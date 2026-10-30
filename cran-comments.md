## Submission

This source package is named fastEmbedR. Its development repository is
https://github.com/tkcaccia/fastEmbedR-light; the original fastEmbedR
repository is unchanged by this preparation.

The package does not import, link to, load, or require faissR or a FAISS
installation. CPU exact and HNSW nearest-neighbor searches are implemented
in the package. Historical source attribution and license copies are retained.

## Test environments

- Ubuntu 22.04, x86_64-pc-linux-gnu, R 4.5.2, GCC 11.4.0.
- CPU-only build; faissR is not installed in the test environment.
- Separate clean sessions exercise CPU HNSW, UMAP, and t-SNE without either
  faissR or the optional float package.

## R CMD check results

Checked on 2026-10-30 with:

    R CMD check --as-cran fastEmbedR_0.1.tar.gz

0 errors | 0 warnings | 2 notes

- New submission.
- The checking environment could not verify the current time. This is an
  external clock-verification note; no future-dated package files were
  identified. The clock check was not disabled.

Tests: 2,789 passing assertions, 0 failures, 0 warnings, 97 expected skips.
Examples, vignette rebuilding, PDF and HTML manuals, compiled-code checks,
source portability checks, and dependency checks passed.

The exact source archive and complete local check log are available in the
project directory as fastEmbedR_0.1.tar.gz and
output/cran-check/00check.log. Source-style and CUDA configuration regression
checks also passed.

Windows, macOS, and current R-release/R-devel checks remain to be run using
the repository's R CMD check workflow before submission. The local R version
is 4.5.2. The workflow includes Linux release/devel, macOS release, and Windows
release. Publication to fastEmbedR-light was approved on 2026-10-30;
cross-platform check results will be recorded after those jobs finish.
No CRAN submission has been made.

## Optional acceleration

Apple Metal and CUDA/cuVS support are optional. Unavailable backend requests
fail explicitly. No GPU hardware is available in the local test environment,
so hardware-specific tests are skipped. The CPU build requires only a C++17
compiler and the declared R dependencies.

Tests requiring more than two CPU workers and the long manuscript example
are skipped on CRAN. Ordinary examples and the remaining tests exercise CPU
embedding, query search, transforms, graph construction, clustering,
preprocessing, and file-backed workflows.
