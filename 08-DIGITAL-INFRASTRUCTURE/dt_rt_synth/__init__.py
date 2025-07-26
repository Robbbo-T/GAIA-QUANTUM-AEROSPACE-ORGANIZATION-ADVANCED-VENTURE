
"""Synthetic DT-RT pipeline modules for AMPEL360E.

This package bundles lightweight utilities used to prototype the
digital-twin pipeline.  It purposely avoids heavy dependencies so the
tests can execute in constrained environments.
"""

from .synthetic_generator import SensorReading, SensorType, SyntheticQuantumDataGenerator
from .mapper import (
    CadParameters,
    FuselageParams,
    QuantumSensorZones,
    SyntheticDataMapper,
    WingIntegrationParams,
)
from .pipeline import run_pipeline, default_parameters
from .step_generator import generate_step

__all__ = [
    "SensorReading",
    "SensorType",
    "SyntheticQuantumDataGenerator",
    "CadParameters",
    "FuselageParams",
    "QuantumSensorZones",
    "SyntheticDataMapper",
    "WingIntegrationParams",
    "run_pipeline",
    "default_parameters",
    "generate_step",
]
