import lzma
from pathlib import Path
import sys

sys.path.append(str(Path(__file__).resolve().parents[1] / "src"))

from compress_lzma import compress_file_lzma


def test_compress_file_lzma(tmp_path: Path) -> None:
    source = tmp_path / "sample.txt"
    data = b"GAIA-QAO Test Data"
    source.write_bytes(data)

    compressed_path = compress_file_lzma(str(source))

    assert compressed_path.exists()
    # Verify decompression yields original data
    with lzma.open(compressed_path, 'rb') as f:
        decompressed = f.read()
    assert decompressed == data
