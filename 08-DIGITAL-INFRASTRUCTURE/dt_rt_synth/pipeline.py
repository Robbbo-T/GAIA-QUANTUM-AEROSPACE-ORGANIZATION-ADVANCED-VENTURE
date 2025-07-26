"""
Digital Twin Real-Time Synthetic Pipeline
----------------------------------------

Coordinates synthetic data generation, mapping, and STEP file
production for the AMPEL360E demonstrator.  The implementation is
lightweight to support continuous integration environments while still
mirroring the data flow expected in a full system.  It is suitable for
certification-oriented unit testing.
"""

from __future__ import annotations

import itertools
from pathlib import Path
from typing import Iterable

from .mapper import (
    CadParameters,
    FuselageParams,
    QuantumSensorZones,
    SyntheticDataMapper,
    WingIntegrationParams,
)
from .synthetic_generator import SensorReading, SensorType, SyntheticQuantumDataGenerator
from .step_generator import generate_step


def default_parameters() -> CadParameters:
    return CadParameters(
        fuselage=FuselageParams(length=40000, max_diameter=5000, blending_factor=0.3),
        wing=WingIntegrationParams(root_chord=10000, blend_radius=2000, sweep_angle=30),
        sensors=QuantumSensorZones(nose_sensor_density=10, structural_nodes=150),
    )


def run_pipeline(
    frames: int,
    output_dir: Path,
    generator: SyntheticQuantumDataGenerator,
    mapper: SyntheticDataMapper,
    initial_params: CadParameters | None = None,
) -> None:
    """Execute the end-to-end synthetic data pipeline.

    Parameters
    ----------
    frames:
        Number of iteration frames to process. Must be positive.
    output_dir:
        Directory where STEP files will be written.
    generator:
        Synthetic data generator instance.
    mapper:
        Mapper converting sensor readings to CAD parameters.
    initial_params:
        Optional starting parameter set. ``default_parameters`` is used if not
        supplied.
    """

    if frames <= 0:
        raise ValueError("frames must be positive")

    params = initial_params or default_parameters()
    output_dir.mkdir(parents=True, exist_ok=True)

    data_iter = generator.generate()
    for frame in range(frames):
        readings = list(itertools.islice(data_iter, len(generator._sensors)))
        params = mapper.map_readings(readings, params)
        step_text = generate_step(params)
        (output_dir / f"ampel360e_{frame:05d}.step").write_text(step_text)

