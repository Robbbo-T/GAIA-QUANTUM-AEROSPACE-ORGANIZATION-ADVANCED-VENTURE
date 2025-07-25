// SPDX-License-Identifier: GAIA-QAO-1.0
pragma solidity ^0.8.19;

/**
 * @title GAIA-QAO Smart Contract v3.0
 * @author GAIA-QAO Development Team
 * @notice Optimized on-chain component with enhanced security and gas efficiency
 * @dev Implements all recommended improvements from security audit
 */

import "@openzeppelin/contracts-upgradeable/access/AccessControlUpgradeable.sol";
import "@openzeppelin/contracts-upgradeable/security/ReentrancyGuardUpgradeable.sol";
import "@openzeppelin/contracts-upgradeable/security/PausableUpgradeable.sol";
import "@openzeppelin/contracts-upgradeable/proxy/utils/Initializable.sol";
import "@openzeppelin/contracts-upgradeable/proxy/utils/UUPSUpgradeable.sol";
import "@openzeppelin/contracts/utils/cryptography/EIP712.sol";
import "@openzeppelin/contracts/utils/cryptography/ECDSA.sol";
import "@openzeppelin/contracts/utils/structs/EnumerableSet.sol";

/**
 * @dev Data classification levels
 */
enum DataClassification {
    PUBLIC,
    ARCHIVED,
    OPERATIONAL,
    STRATEGIC,
    QUANTUM_CRITICAL
}

/**
 * @dev Governance levels
 */
enum GovernanceLevel {
    HYBRID_CLASSICAL,
    AI_ASSISTED,
    COMMUNITY_VOTE,
    EMERGENCY_OVERRIDE,
    QUANTUM_CONSENSUS
}

/**
 * @dev Request types for oracle
 */
enum RequestType {
    QUANTUM_SIGNATURE,
    AI_GOVERNANCE,
    COHERENCE_CHECK
}

/**
 * @dev Optimized DIKE record structure
 */
struct DIKERecord {
    uint256 id;                    // Unique numeric ID
    bytes32 contentHash;
    bytes32 quantumHash;
    DataClassification classification;
    address owner;
    uint256 carbonFootprint;
    uint256 createdAt;
    uint256 modifiedAt;
    bool paused;                   // Individual DIKE pause state
    bool erasureRequested;
    uint256 erasureDate;
}

/**
 * @dev Quantum signature structure
 */
struct QuantumSignature {
    bytes32 classicalSignature;
    bytes32 quantumProof;
    bytes32 entanglementId;        // Changed from string to bytes32 for gas
    uint256 timestamp;
    uint96 coherenceScore;
    bool errorCorrectionApplied;
}

/**
 * @dev Governance decision structure
 */
struct GovernanceDecision {
    uint256 dikeId;
    GovernanceLevel level;
    uint256 timestamp;
    bool approved;
    bytes32 ipfsHash;              // Changed from string for gas efficiency
}

/**
 * @dev Oracle request structure
 */
struct OracleRequest {
    RequestType requestType;
    uint256 dikeId;
    bytes32 dataHash;
    uint256 timestamp;
    bool fulfilled;
}

interface IQuantumOracle {
    function requestQuantumSignature(uint256 dikeId, bytes32 dataHash) external returns (bytes32 requestId);
    function requestAIGovernance(uint256 dikeId, bytes32 dataHash) external returns (bytes32 requestId);
    function requestCoherenceCheck(uint256 dikeId) external returns (bytes32 requestId);
}

contract GAIAQAOContractV3 is 
    Initializable,
    AccessControlUpgradeable,
    ReentrancyGuardUpgradeable,
    PausableUpgradeable,
    UUPSUpgradeable,
    EIP712 
{
    using ECDSA for bytes32;
    using EnumerableSet for EnumerableSet.AddressSet;

    // Constants
    bytes32 public constant QUANTUM_OPERATOR_ROLE = keccak256("QUANTUM_OPERATOR");
    bytes32 public constant COMPLIANCE_OFFICER_ROLE = keccak256("COMPLIANCE_OFFICER");
    bytes32 public constant AI_ORACLE_ROLE = keccak256("AI_ORACLE");
    bytes32 public constant UPGRADER_ROLE = keccak256("UPGRADER");
    
    uint256 public constant QUANTUM_COHERENCE_MINIMUM = 9500; // 0.95 scaled
    uint256 public constant GOVERNANCE_THRESHOLD = 5100; // 51%
    uint256 private constant ERASURE_GRACE_PERIOD = 30 days;
    
    // State variables
    uint256 private _dikeIdCounter;
    mapping(uint256 => DIKERecord) public dikeRegistry;
    mapping(uint256 => mapping(address => bool)) public accessPermissions; // Optimized access control
    mapping(uint256 => EnumerableSet.AddressSet) private _accessLists;
    mapping(uint256 => QuantumSignature[]) public quantumSignatures;
    mapping(uint256 => GovernanceDecision) public governanceDecisions;
    mapping(address => uint256) public carbonLedger;
    mapping(address => uint256) public carbonOffsetBalance; // Separate offset tracking
    mapping(address => mapping(bytes32 => bool)) public consentRegistry;
    mapping(bytes32 => OracleRequest) public oracleRequests; // Enhanced oracle tracking
    
    // Configuration
    uint256 public carbonPricePerKg;
    uint256 public maxTransactionSize;
    IQuantumOracle public quantumOracle;
    
    // Events
    event DIKECreated(
        uint256 indexed dikeId,
        address indexed owner,
        DataClassification classification,
        bytes32 quantumHash,
        uint256 carbonFootprint
    );
    
    event AccessGranted(
        uint256 indexed dikeId,
        address indexed grantee,
        address indexed granter
    );
    
    event AccessRevoked(
        uint256 indexed dikeId,
        address indexed revokee,
        address indexed revoker
    );
    
    event QuantumSignatureAdded(
        uint256 indexed dikeId,
        bytes32 signatureHash,
        uint96 coherenceScore
    );
    
    event GovernanceDecisionMade(
        uint256 indexed dikeId,
        GovernanceLevel level,
        bool approved
    );
    
    event ConsentGranted(
        address indexed dataSubject,
        bytes32 indexed purposeHash,
        uint256 timestamp
    );
    
    event ConsentWithdrawn(
        address indexed dataSubject,
        bytes32 indexed purposeHash,
        uint256 timestamp
    );
    
    event ErasureRequested(
        uint256 indexed dikeId,
        address indexed requester,
        uint256 scheduledDate
    );
    
    event ErasureExecuted(
        uint256 indexed dikeId,
        uint256 timestamp
    );
    
    event DIKEPaused(
        uint256 indexed dikeId,
        address indexed pauser,
        string reason
    );
    
    event DIKEUnpaused(
        uint256 indexed dikeId,
        address indexed unpauser
    );
    
    event CarbonOffsetPurchased(
        address indexed buyer,
        uint256 amount,
        uint256 offsetKg
    );
    
    event OracleRequestCreated(
        bytes32 indexed requestId,
        uint256 indexed dikeId,
        RequestType requestType
    );
    
    // Custom errors for gas efficiency
    error InvalidDIKE();
    error InsufficientPermissions();
    error InvalidAddress();
    error InvalidClassification();
    error CoherenceTooLow();
    error CarbonOffsetRequired();
    error RequestNotFound();
    error DIKEPausedError();
    error ErasureNotRequested();
    error GracePeriodActive();
    error InvalidAmount();
    
    // Modifiers
    modifier validDIKE(uint256 dikeId) {
        if (dikeRegistry[dikeId].id == 0) revert InvalidDIKE();
        _;
    }
    
    modifier notPausedDIKE(uint256 dikeId) {
        if (dikeRegistry[dikeId].paused) revert DIKEPausedError();
        _;
    }
    
    modifier onlyOracle() {
        if (msg.sender != address(quantumOracle)) revert InsufficientPermissions();
        _;
    }
    
    modifier hasAccess(uint256 dikeId) {
        DIKERecord memory record = dikeRegistry[dikeId];
        if (record.owner != msg.sender && 
            !accessPermissions[dikeId][msg.sender] &&
            record.classification != DataClassification.PUBLIC) {
            revert InsufficientPermissions();
        }
        _;
    }
    
    /// @custom:oz-upgrades-unsafe-allow constructor
    constructor() {
        _disableInitializers();
    }
    
    /**
     * @notice Initialize the contract
     */
    function initialize(address _quantumOracle) public initializer {
        __AccessControl_init();
        __ReentrancyGuard_init();
        __Pausable_init();
        __UUPSUpgradeable_init();
        
        _grantRole(DEFAULT_ADMIN_ROLE, msg.sender);
        _grantRole(QUANTUM_OPERATOR_ROLE, msg.sender);
        _grantRole(COMPLIANCE_OFFICER_ROLE, msg.sender);
        _grantRole(UPGRADER_ROLE, msg.sender);
        
        quantumOracle = IQuantumOracle(_quantumOracle);
        carbonPricePerKg = 0.01 ether;
        maxTransactionSize = 10 * 1024 * 1024; // 10MB
    }
    
    /**
     * @notice Create a new DIKE record with optimized storage
     */
    function createDIKERecord(
        bytes32 _contentHash,
        DataClassification _classification,
        address[] calldata _accessList,
        bytes32 _ipfsMetadata
    ) external nonReentrant whenNotPaused returns (uint256) {
        if (_contentHash == bytes32(0)) revert InvalidDIKE();
        if (_accessList.length > 100) revert InvalidAmount();
        
        // Generate unique ID
        _dikeIdCounter++;
        uint256 newDikeId = _dikeIdCounter;
        
        // Calculate carbon footprint
        uint256 carbonFootprint = _calculateCarbonFootprint(_classification);
        
        // Check carbon offset
        if (carbonOffsetBalance[msg.sender] < carbonFootprint) {
            revert CarbonOffsetRequired();
        }
        carbonOffsetBalance[msg.sender] -= carbonFootprint;
        
        // Create record
        dikeRegistry[newDikeId] = DIKERecord({
            id: newDikeId,
            contentHash: _contentHash,
            quantumHash: bytes32(0), // Set by oracle
            classification: _classification,
            owner: msg.sender,
            carbonFootprint: carbonFootprint,
            createdAt: block.timestamp,
            modifiedAt: block.timestamp,
            paused: false,
            erasureRequested: false,
            erasureDate: 0
        });
        
        // Set access permissions efficiently
        for (uint i = 0; i < _accessList.length; i++) {
            if (_accessList[i] != address(0)) {
                accessPermissions[newDikeId][_accessList[i]] = true;
                _accessLists[newDikeId].add(_accessList[i]);
            }
        }
        
        // Update carbon ledger
        carbonLedger[msg.sender] += carbonFootprint;
        
        // Request quantum operations
        _createOracleRequest(
            quantumOracle.requestQuantumSignature(newDikeId, _contentHash),
            RequestType.QUANTUM_SIGNATURE,
            newDikeId,
            _contentHash
        );
        
        _createOracleRequest(
            quantumOracle.requestAIGovernance(newDikeId, _contentHash),
            RequestType.AI_GOVERNANCE,
            newDikeId,
            _contentHash
        );
        
        emit DIKECreated(
            newDikeId,
            msg.sender,
            _classification,
            _contentHash,
            carbonFootprint
        );
        
        return newDikeId;
    }
    
    /**
     * @notice Grant access to DIKE record
     */
    function grantAccess(
        uint256 _dikeId,
        address _grantee
    ) external validDIKE(_dikeId) notPausedDIKE(_dikeId) {
        DIKERecord memory record = dikeRegistry[_dikeId];
        
        if (record.owner != msg.sender && !accessPermissions[_dikeId][msg.sender]) {
            revert InsufficientPermissions();
        }
        
        if (_grantee == address(0)) revert InvalidAddress();
        if (accessPermissions[_dikeId][_grantee]) return; // Already has access
        
        accessPermissions[_dikeId][_grantee] = true;
        _accessLists[_dikeId].add(_grantee);
        dikeRegistry[_dikeId].modifiedAt = block.timestamp;
        
        emit AccessGranted(_dikeId, _grantee, msg.sender);
    }
    
    /**
     * @notice Revoke access from DIKE record
     */
    function revokeAccess(
        uint256 _dikeId,
        address _revokee
    ) external validDIKE(_dikeId) {
        DIKERecord memory record = dikeRegistry[_dikeId];
        
        if (record.owner != msg.sender) {
            revert InsufficientPermissions();
        }
        
        if (!accessPermissions[_dikeId][_revokee]) return; // No access to revoke
        
        accessPermissions[_dikeId][_revokee] = false;
        _accessLists[_dikeId].remove(_revokee);
        dikeRegistry[_dikeId].modifiedAt = block.timestamp;
        
        emit AccessRevoked(_dikeId, _revokee, msg.sender);
    }
    
    /**
     * @notice Get all addresses with access to a DIKE
     */
    function getAccessList(uint256 _dikeId) 
        external 
        view 
        validDIKE(_dikeId) 
        hasAccess(_dikeId)
        returns (address[] memory) 
    {
        return _accessLists[_dikeId].values();
    }
    
    /**
     * @notice Oracle callback for quantum signature
     */
    function fulfillQuantumSignature(
        bytes32 _requestId,
        uint256 _dikeId,
        bytes32 _classicalSignature,
        bytes32 _quantumProof,
        bytes32 _entanglementId,
        uint96 _coherenceScore,
        bool _errorCorrectionApplied
    ) external onlyOracle validDIKE(_dikeId) {
        OracleRequest storage request = oracleRequests[_requestId];
        if (request.dikeId != _dikeId || request.fulfilled) revert RequestNotFound();
        if (_coherenceScore < QUANTUM_COHERENCE_MINIMUM) revert CoherenceTooLow();
        
        request.fulfilled = true;
        
        QuantumSignature memory sig = QuantumSignature({
            classicalSignature: _classicalSignature,
            quantumProof: _quantumProof,
            entanglementId: _entanglementId,
            timestamp: block.timestamp,
            coherenceScore: _coherenceScore,
            errorCorrectionApplied: _errorCorrectionApplied
        });
        
        quantumSignatures[_dikeId].push(sig);
        
        // Update quantum hash on first signature
        if (dikeRegistry[_dikeId].quantumHash == bytes32(0)) {
            dikeRegistry[_dikeId].quantumHash = _quantumProof;
        }
        
        emit QuantumSignatureAdded(_dikeId, _quantumProof, _coherenceScore);
    }
    
    /**
     * @notice Oracle callback for governance decision
     */
    function fulfillGovernanceDecision(
        bytes32 _requestId,
        uint256 _dikeId,
        GovernanceLevel _level,
        bool _approved,
        bytes32 _ipfsHash
    ) external onlyOracle validDIKE(_dikeId) {
        OracleRequest storage request = oracleRequests[_requestId];
        if (request.dikeId != _dikeId || request.fulfilled) revert RequestNotFound();
        
        request.fulfilled = true;
        
        governanceDecisions[_dikeId] = GovernanceDecision({
            dikeId: _dikeId,
            level: _level,
            timestamp: block.timestamp,
            approved: _approved,
            ipfsHash: _ipfsHash
        });
        
        emit GovernanceDecisionMade(_dikeId, _level, _approved);
        
        // Execute emergency actions
        if (_level == GovernanceLevel.EMERGENCY_OVERRIDE && !_approved) {
            _pauseDIKE(_dikeId, "Emergency governance override");
        }
    }
    
    /**
     * @notice Grant GDPR consent
     */
    function grantConsent(string calldata _purpose) external {
        bytes32 purposeHash = keccak256(bytes(_purpose));
        consentRegistry[msg.sender][purposeHash] = true;
        emit ConsentGranted(msg.sender, purposeHash, block.timestamp);
    }
    
    /**
     * @notice Withdraw GDPR consent
     */
    function withdrawConsent(string calldata _purpose) external {
        bytes32 purposeHash = keccak256(bytes(_purpose));
        consentRegistry[msg.sender][purposeHash] = false;
        emit ConsentWithdrawn(msg.sender, purposeHash, block.timestamp);
    }
    
    /**
     * @notice Request GDPR erasure
     */
    function requestErasure(uint256 _dikeId) external validDIKE(_dikeId) {
        DIKERecord storage record = dikeRegistry[_dikeId];
        
        if (record.owner != msg.sender) revert InsufficientPermissions();
        if (record.erasureRequested) revert ErasureNotRequested();
        
        record.erasureRequested = true;
        record.erasureDate = block.timestamp + ERASURE_GRACE_PERIOD;
        
        emit ErasureRequested(_dikeId, msg.sender, record.erasureDate);
    }
    
    /**
     * @notice Execute scheduled erasure
     */
    function executeErasure(uint256 _dikeId) external validDIKE(_dikeId) {
        DIKERecord storage record = dikeRegistry[_dikeId];
        
        if (!record.erasureRequested) revert ErasureNotRequested();
        if (block.timestamp < record.erasureDate) revert GracePeriodActive();
        
        // Anonymize data
        record.owner = address(0);
        record.contentHash = keccak256(abi.encodePacked("ERASED", block.timestamp));
        record.quantumHash = keccak256(abi.encodePacked("ERASED", block.timestamp));
        
        // Clear access permissions
        address[] memory accessList = _accessLists[_dikeId].values();
        for (uint i = 0; i < accessList.length; i++) {
            accessPermissions[_dikeId][accessList[i]] = false;
            _accessLists[_dikeId].remove(accessList[i]);
        }
        
        // Clear associated data
        delete quantumSignatures[_dikeId];
        delete governanceDecisions[_dikeId];
        
        emit ErasureExecuted(_dikeId, block.timestamp);
    }
    
    /**
     * @notice Purchase carbon offsets
     */
    function purchaseCarbonOffset() external payable {
        if (msg.value == 0) revert InvalidAmount();
        
        uint256 offsetKg = msg.value / carbonPricePerKg;
        carbonOffsetBalance[msg.sender] += offsetKg;
        
        emit CarbonOffsetPurchased(msg.sender, msg.value, offsetKg);
    }
    
    /**
     * @notice Pause specific DIKE
     */
    function pauseDIKE(uint256 _dikeId, string calldata _reason) 
        external 
        validDIKE(_dikeId) 
        onlyRole(COMPLIANCE_OFFICER_ROLE) 
    {
        _pauseDIKE(_dikeId, _reason);
    }
    
    /**
     * @notice Unpause specific DIKE
     */
    function unpauseDIKE(uint256 _dikeId) 
        external 
        validDIKE(_dikeId) 
        onlyRole(COMPLIANCE_OFFICER_ROLE) 
    {
        dikeRegistry[_dikeId].paused = false;
        emit DIKEUnpaused(_dikeId, msg.sender);
    }
    
    /**
     * @notice Get DIKE record details
     */
    function getDIKERecord(uint256 _dikeId) 
        external 
        view 
        validDIKE(_dikeId) 
        hasAccess(_dikeId)
        returns (DIKERecord memory) 
    {
        return dikeRegistry[_dikeId];
    }
    
    /**
     * @notice Get quantum signatures
     */
    function getQuantumSignatures(uint256 _dikeId)
        external
        view
        validDIKE(_dikeId)
        hasAccess(_dikeId)
        returns (QuantumSignature[] memory)
    {
        return quantumSignatures[_dikeId];
    }
    
    /**
     * @notice Update configuration
     */
    function updateConfig(
        address _quantumOracle,
        uint256 _carbonPricePerKg,
        uint256 _maxTransactionSize
    ) external onlyRole(DEFAULT_ADMIN_ROLE) {
        if (_quantumOracle != address(0)) {
            quantumOracle = IQuantumOracle(_quantumOracle);
        }
        if (_carbonPricePerKg > 0) {
            carbonPricePerKg = _carbonPricePerKg;
        }
        if (_maxTransactionSize > 0) {
            maxTransactionSize = _maxTransactionSize;
        }
    }
    
    /**
     * @notice Emergency pause
     */
    function pause() external onlyRole(COMPLIANCE_OFFICER_ROLE) {
        _pause();
    }
    
    /**
     * @notice Unpause
     */
    function unpause() external onlyRole(COMPLIANCE_OFFICER_ROLE) {
        _unpause();
    }
    
    // Internal functions
    
    function _createOracleRequest(
        bytes32 _requestId,
        RequestType _type,
        uint256 _dikeId,
        bytes32 _dataHash
    ) private {
        oracleRequests[_requestId] = OracleRequest({
            requestType: _type,
            dikeId: _dikeId,
            dataHash: _dataHash,
            timestamp: block.timestamp,
            fulfilled: false
        });
        
        emit OracleRequestCreated(_requestId, _dikeId, _type);
    }
    
    function _calculateCarbonFootprint(DataClassification _classification) 
        private 
        pure 
        returns (uint256) 
    {
        if (_classification == DataClassification.QUANTUM_CRITICAL) return 5;
        if (_classification == DataClassification.STRATEGIC) return 3;
        if (_classification == DataClassification.OPERATIONAL) return 2;
        if (_classification == DataClassification.ARCHIVED) return 1;
        return 1; // PUBLIC
    }
    
    function _pauseDIKE(uint256 _dikeId, string memory _reason) private {
        dikeRegistry[_dikeId].paused = true;
        emit DIKEPaused(_dikeId, msg.sender, _reason);
    }
    
    function _authorizeUpgrade(address newImplementation)
        internal
        onlyRole(UPGRADER_ROLE)
        override
    {}
}

/**
 * @title Enhanced Quantum Oracle Contract
 * @notice Improved oracle with request tracking and validation
 */
contract QuantumOracleV3 is AccessControl {
    using ECDSA for bytes32;
    
    bytes32 public constant ORACLE_OPERATOR = keccak256("ORACLE_OPERATOR");
    
    address public gaiaContract;
    uint256 private _nonce;
    
    mapping(bytes32 => bool) public pendingRequests;
    mapping(bytes32 => uint256) public requestToDike; // Links requests to DIKEs
    mapping(bytes32 => RequestType) public requestTypes;
    
    event QuantumSignatureRequested(
        bytes32 indexed requestId, 
        uint256 indexed dikeId,
        bytes32 dataHash
    );
    
    event AIGovernanceRequested(
        bytes32 indexed requestId,
        uint256 indexed dikeId,
        bytes32 dataHash
    );
    
    event CoherenceCheckRequested(
        bytes32 indexed requestId,
        uint256 indexed dikeId
    );
    
    modifier onlyGAIA() {
        require(msg.sender == gaiaContract, "Not GAIA contract");
        _;
    }
    
    constructor() {
        _setupRole(DEFAULT_ADMIN_ROLE, msg.sender);
        _setupRole(ORACLE_OPERATOR, msg.sender);
    }
    
    function setGAIAContract(address _gaiaContract) 
        external 
        onlyRole(DEFAULT_ADMIN_ROLE) 
    {
        require(_gaiaContract != address(0), "Invalid address");
        gaiaContract = _gaiaContract;
    }
    
    function requestQuantumSignature(uint256 _dikeId, bytes32 _dataHash) 
        external 
        onlyGAIA 
        returns (bytes32 requestId) 
    {
        requestId = _generateRequestId(_dikeId, _dataHash, RequestType.QUANTUM_SIGNATURE);
        pendingRequests[requestId] = true;
        requestToDike[requestId] = _dikeId;
        requestTypes[requestId] = RequestType.QUANTUM_SIGNATURE;
        
        emit QuantumSignatureRequested(requestId, _dikeId, _dataHash);
    }
    
    function requestAIGovernance(uint256 _dikeId, bytes32 _dataHash) 
        external 
        onlyGAIA 
        returns (bytes32 requestId) 
    {
        requestId = _generateRequestId(_dikeId, _dataHash, RequestType.AI_GOVERNANCE);
        pendingRequests[requestId] = true;
        requestToDike[requestId] = _dikeId;
        requestTypes[requestId] = RequestType.AI_GOVERNANCE;
        
        emit AIGovernanceRequested(requestId, _dikeId, _dataHash);
    }
    
    function requestCoherenceCheck(uint256 _dikeId) 
        external 
        onlyGAIA 
        returns (bytes32 requestId) 
    {
        requestId = _generateRequestId(_dikeId, bytes32(0), RequestType.COHERENCE_CHECK);
        pendingRequests[requestId] = true;
        requestToDike[requestId] = _dikeId;
        requestTypes[requestId] = RequestType.COHERENCE_CHECK;
        
        emit CoherenceCheckRequested(requestId, _dikeId);
    }
    
    function fulfillQuantumSignature(
        bytes32 _requestId,
        bytes32 _classicalSignature,
        bytes32 _quantumProof,
        bytes32 _entanglementId,
        uint96 _coherenceScore,
        bool _errorCorrectionApplied
    ) external onlyRole(ORACLE_OPERATOR) {
        require(pendingRequests[_requestId], "Invalid request");
        require(requestTypes[_requestId] == RequestType.QUANTUM_SIGNATURE, "Wrong request type");
        
        uint256 dikeId = requestToDike[_requestId];
        delete pendingRequests[_requestId];
        
        GAIAQAOContractV3(gaiaContract).fulfillQuantumSignature(
            _requestId,
            dikeId,
            _classicalSignature,
            _quantumProof,
            _entanglementId,
            _coherenceScore,
            _errorCorrectionApplied
        );
    }
    
    function fulfillGovernanceDecision(
        bytes32 _requestId,
        GovernanceLevel _level,
        bool _approved,
        bytes32 _ipfsHash
    ) external onlyRole(ORACLE_OPERATOR) {
        require(pendingRequests[_requestId], "Invalid request");
        require(requestTypes[_requestId] == RequestType.AI_GOVERNANCE, "Wrong request type");
        
        uint256 dikeId = requestToDike[_requestId];
        delete pendingRequests[_requestId];
        
        GAIAQAOContractV3(gaiaContract).fulfillGovernanceDecision(
            _requestId,
            dikeId,
            _level,
            _approved,
            _ipfsHash
        );
    }
    
    function _generateRequestId(
        uint256 _dikeId,
        bytes32 _dataHash,
        RequestType _type
    ) private returns (bytes32) {
        _nonce++;
        return keccak256(abi.encodePacked(
            _dikeId,
            _dataHash,
            _type,
            block.timestamp,
            block.number,
            _nonce
        ));
    }
}
