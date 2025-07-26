import time
from pathlib import Path

from dt_rt_synth.synthetic_generator import SensorType, SyntheticQuantumDataGenerator
from dt_rt_synth.mapper import CadParameters, FuselageParams, WingIntegrationParams, QuantumSensorZones, SyntheticDataMapper
from dt_rt_synth.pipeline import run_pipeline


def test_pipeline_runs(tmp_path: Path) -> None:
    generator = SyntheticQuantumDataGenerator(100.0, {SensorType.QSM: 2, SensorType.QNS: 1, SensorType.QDS: 1})
    mapper = SyntheticDataMapper(smoothing=0.2)
    run_pipeline(
        frames=2,
        output_dir=tmp_path,
        generator=generator,
        mapper=mapper,
    )
    files = list(tmp_path.glob('*.step'))
    assert len(files) == 2
    assert all(f.read_text().startswith('ISO-10303-21;') for f in files)

