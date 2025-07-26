"""
Synthetic Data Mapper for AMPEL360E Digital Twin
------------------------------------------------

Maps synthetic quantum sensor data to CAD parameters used by the
STEP generator. Mapping logic follows deterministic rules and
includes smoothing to avoid abrupt transitions. This approach is
aligned with ARINC 653 partitioning and DO-178C Level A guidance.
"""

from __future__ import annotations

from dataclasses import dataclass
from typing import Iterable

from .synthetic_generator import SensorReading, SensorType


@dataclass
class FuselageParams:
    """Fuselage geometric parameters."""

    length: float
    max_diameter: float
    blending_factor: float


@dataclass
class WingIntegrationParams:
    """Wing root integration parameters."""

    root_chord: float
    blend_radius: float
    sweep_angle: float


@dataclass
class QuantumSensorZones:
    """Quantum sensor zone configuration."""

    nose_sensor_density: int
    structural_nodes: int


@dataclass
class CadParameters:
    """Complete parameter set for STEP generation."""

    fuselage: FuselageParams
    wing: WingIntegrationParams
    sensors: QuantumSensorZones


Consider collapsing the three `apply_*` methods and the `if/elif` dispatch into a simple table-driven loop, and drop the manual `**vars` cloning in favor of `copy.deepcopy`. This preserves all behavior but removes boilerplate.

```python
import copy
from typing import Callable, Dict

class SyntheticDataMapper:
    def __init__(self, smoothing: float = 0.1) -> None:
        if not 0.0 <= smoothing <= 1.0:
            raise ValueError("smoothing must be within [0.0, 1.0]")
        self.smoothing = smoothing
        # map SensorType → (update_fn)
        self._updates: Dict[SensorType, Callable[[CadParameters, float], None]] = {
            SensorType.QSM: lambda p, v: setattr(
                p.wing,
                'blend_radius',
                self._smooth(p.wing.blend_radius,  2000 + 1000 * v)
            ),
            SensorType.QNS: lambda p, v: setattr(
                p.wing,
                'sweep_angle',
                self._smooth(p.wing.sweep_angle,     25 + 10   * v)
            ),
            SensorType.QDS: lambda p, v: setattr(
                p.fuselage,
                'blending_factor',
                self._smooth(p.fuselage.blending_factor, 0.1 + 0.9 * (1 - v))
            ),
        }

    def map_readings(self,
                     readings: Iterable[SensorReading],
                     params: CadParameters) -> CadParameters:
        new_params = copy.deepcopy(params)
        for r in readings:
            updater = self._updates.get(r.sensor_type)
            if updater:
                updater(new_params, r.value)
        return new_params

    def _smooth(self, current: float, target: float) -> float:
        return current * (1 - self.smoothing) + target * self.smoothing
    """Maps sensor readings to CAD parameter adjustments."""

    def __init__(self, smoothing: float = 0.1) -> None:
        if not 0.0 <= smoothing <= 1.0:
            raise ValueError("smoothing must be within [0.0, 1.0]")
        self.smoothing = smoothing

    def map_readings(self, readings: Iterable[SensorReading], params: CadParameters) -> CadParameters:
        """Translate sensor readings into updated CAD parameters."""

        new_params = CadParameters(
            fuselage=FuselageParams(**vars(params.fuselage)),
            wing=WingIntegrationParams(**vars(params.wing)),
            sensors=QuantumSensorZones(**vars(params.sensors)),
        )
        for reading in readings:
            if reading.sensor_type == SensorType.QSM:
                self._apply_structural(reading, new_params)
            elif reading.sensor_type == SensorType.QNS:
                self._apply_navigation(reading, new_params)
            elif reading.sensor_type == SensorType.QDS:
                self._apply_dynamic(reading, new_params)
        return new_params

    def _smooth(self, current: float, target: float) -> float:
        """Return a smoothed value between ``current`` and ``target``."""

        return current * (1 - self.smoothing) + target * self.smoothing

    def _apply_structural(self, reading: SensorReading, params: CadParameters) -> None:
        """Adjust wing blend radius based on structural stress."""

        # Map stress values to blend_radius adjustments
        stress = reading.value  # 0..1
        target_radius = 2000 + 1000 * stress
        params.wing.blend_radius = self._smooth(params.wing.blend_radius, target_radius)

    def _apply_navigation(self, reading: SensorReading, params: CadParameters) -> None:
        """Adjust sweep angle using navigation variance."""

        # Map navigation variance to sweep_angle
        variance = reading.value  # 0..1
        target_angle = 25 + 10 * variance
        params.wing.sweep_angle = self._smooth(params.wing.sweep_angle, target_angle)

    def _apply_dynamic(self, reading: SensorReading, params: CadParameters) -> None:
        """Adjust fuselage blending factor from efficiency metrics."""

        # Map efficiency metrics to blending factor
        efficiency = reading.value  # 0..1
        target_blend = 0.1 + 0.9 * (1 - efficiency)
        params.fuselage.blending_factor = self._smooth(params.fuselage.blending_factor, target_blend)

