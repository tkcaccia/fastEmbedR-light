## Submission

This is a new submission of fastEmbedR. Development is at
https://github.com/tkcaccia/fastEmbedR-light. The original fastEmbedR
repository has not been modified by this work.

The package does not import, link to, load, or require faissR or a FAISS
installation. CPU exact and HNSW searches are package-owned. Historical
source attribution and license copies are retained.

## Source archive

fastEmbedR_0.1.tar.gz is the canonical archive built with R 4.6.2 by GitHub
Actions from commit 8df0a0801165307fefed242fef3dbc5b4c8fbdc0 on 2026-10-30.
The same archive is checked on every platform. Its unpacked source was
compared with the committed package source; no compiled binaries are included.

## Cross-platform checks

The final archive passed R CMD check --as-cran --no-manual with
0 errors, 0 warnings, and 0 notes on:

- Ubuntu Linux, R 4.6.2, GCC 13.3.0.
- Windows, R 4.6.2 ucrt, GCC 14.3.0.
- macOS Tahoe, aarch64, R 4.6.2, Apple clang 21.0.0.
- Ubuntu Linux, R-devel 4.7.0 (2026-10-26 r90766).

Check run:
https://github.com/tkcaccia/fastEmbedR-light/actions/runs/41063442753

All source-build and platform-check jobs in this run completed successfully.
The canonical archive SHA-256 is:

    63a9ba1dd78a2d3f0498b3e763c1ed237aadb6c6f0cc15d242437f4e013b3714

Only required CPU tooling is declared in SystemRequirements. Optional GPU
installation requirements are documented in docs/installation.md, so
automated CPU dependency installation does not request a CUDA toolkit.

## Additional verification

An earlier complete local check on Ubuntu 22.04, R 4.5.2, passed with
0 errors, 0 warnings, and 2 notes: new submission and inability to verify the
system clock. It had 2,789 passing assertions and no test failures or warnings.
The subsequent metadata and portability fixes passed their focused local
tests and the release-R checks above.

Separate clean sessions exercised CPU HNSW, UMAP, and t-SNE without either
faissR or the optional float package. Source-style and CUDA configuration
regression checks passed. The documentation build also passed.

## Optional acceleration and platform-specific tests

Apple Metal and CUDA/cuVS are optional. Unavailable backend requests fail
explicitly. The CPU build requires only a C++17 compiler and the declared R
dependencies. Hardware-specific tests are skipped when no suitable device
is available.

Tests requiring more than two CPU workers and the long manuscript example
are skipped on CRAN. A Unix external-command test and the preserved-time
mutation check do not run on Windows. Windows graph modularity uses the
existing native Windows file mapper; bucketed graph sorting closes readers
before deleting temporary files.

No CRAN submission has been made.
