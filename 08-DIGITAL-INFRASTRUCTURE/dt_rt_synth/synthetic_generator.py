"""
Synthetic Quantum Data Generator for AMPEL360E Digital Twin
----------------------------------------------------------

Generates deterministic synthetic sensor data for quantum-classical
integration testing. Frequencies and sensor configurations emulate
onboard QSM/QNS/QDS subsystems.
"""

from __future__ import annotations

import random
import time
from dataclasses import dataclass
from enum import Enum
from typing import Generator, List


class SensorType(str, Enum):
    """Enumeration of synthetic quantum sensor categories."""

    QSM = "quantum_structural_monitor"
    QNS = "quantum_navigation_sensor"
    QDS = "quantum_dynamic_sensor"


@dataclass
class SensorReading:
    """Represents a single synthetic sensor reading."""

    sensor_type: SensorType
    sensor_id: str
    value: float
    timestamp: float


class SyntheticQuantumDataGenerator:
    """Generates synthetic quantum sensor data at a fixed rate."""

    def __init__(self, frequency_hz: float, sensor_counts: dict[SensorType, int]):
        """Create the generator.

        Parameters
        ----------
        frequency_hz:
            Output frequency in Hertz.
        sensor_counts:
            Mapping of ``SensorType`` to how many sensors of each type are
            simulated.
        """

        if frequency_hz <= 0:
            raise ValueError("frequency_hz must be positive")
        if any(count <= 0 for count in sensor_counts.values()):
            raise ValueError("sensor_counts must contain only positive values")
        self.frequency_hz = frequency_hz
        self.sensor_counts = sensor_counts
        self._period = 1.0 / frequency_hz
        self._sensors = self._create_sensor_ids()

    def _create_sensor_ids(self) -> List[tuple[SensorType, str]]:
        """Return the list of synthetic sensor identifiers."""

        sensors: List[tuple[SensorType, str]] = []
        for s_type, count in self.sensor_counts.items():
            sensors.extend((s_type, f"{s_type.value}-{i:03d}") for i in range(count))
        return sensors

    def generate(self) -> Generator[SensorReading, None, None]:
        """Yield synthetic sensor readings endlessly."""

        while True:
            start = time.perf_counter()
            for s_type, s_id in self._sensors:
                value = random.uniform(0.0, 1.0)
                yield SensorReading(
                    sensor_type=s_type,
                    sensor_id=s_id,
                    value=value,
                    timestamp=time.time(),
                )
            elapsed = time.perf_counter() - start
            sleep_time = max(0.0, self._period - elapsed)
            if sleep_time:
                time.sleep(sleep_time)

