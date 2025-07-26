import argparse
import lzma
from pathlib import Path
from typing import Optional


def compress_file_lzma(input_path: str, output_path: Optional[str] = None) -> Path:
    """Compress a text file using the LZMA algorithm.

    Parameters
    ----------
    input_path : str
        Path to the source text file.
    output_path : Optional[str], optional
        Path for the compressed output file. If ``None``, ``input_path`` with
        a ``.xz`` suffix is used.

    Returns
    -------
    Path
        Path to the compressed file.

    Raises
    ------
    FileNotFoundError
        If ``input_path`` does not exist.
    IOError
        If reading or writing fails.
    """
    source = Path(input_path)
    if not source.is_file():
        raise FileNotFoundError(f"Input file not found: {source}")

    target = Path(output_path) if output_path else source.with_suffix(source.suffix + '.xz')

    try:
        with source.open('rb') as src_file, lzma.open(target, 'wb') as dst_file:
            dst_file.write(src_file.read())
    except OSError as exc:
        raise IOError(f"Compression failed: {exc}") from exc

    return target


def main() -> None:
    """Entry point for command line usage."""
    parser = argparse.ArgumentParser(description="Compress a text file using LZMA.")
    parser.add_argument('input', help="Path to the input text file")
    parser.add_argument('-o', '--output', help="Path for the compressed file")
    args = parser.parse_args()

    compressed = compress_file_lzma(args.input, args.output)
    print(f"Compressed file created at: {compressed}")


if __name__ == '__main__':
    main()
