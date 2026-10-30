## Submission

This is a new submission of fastEmbedR. Development is at
https://github.com/tkcaccia/fastEmbedR-light. The original fastEmbedR
repository has not been modified by this work.

The package does not import, link to, load, or require faissR or a FAISS
installation. CPU exact and HNSW searches are package-owned. Historical
source attribution and license copies are retained.

## Source archive

The canonical fastEmbedR_0.1.tar.gz was built by GitHub Actions from commit
49e9a9ba2aa4710685af3d4072f7cea6d57da2e2 on 2026-10-30. All four platform
checks use this identical archive. Its 234 ordinary package source files
and DESCRIPTION fields match the checkout; no compiled binaries are included.

SHA-256:

    be38382c7d8f05c5012ae00bbcc19d2bcdb1c1f2019e8315bda774aaf1ba28ad

## Cross-platform checks and test budget

R CMD check --as-cran --no-manual completed with 0 errors, 0 warnings,
and 0 notes on all four platforms. Full testthat timings were:

| Platform | CPU seconds | Elapsed seconds |
| --- | ---: | ---: |
| Linux, release R | 70.8 | 77.6 |
| macOS, release R | 54.4 | 70.6 |
| Windows, release R | 93.5 | 104.9 |
| Linux, R-devel | 90.3 | 96.4 |

Check run:
https://github.com/tkcaccia/fastEmbedR-light/actions/runs/41073871045

CI requires both total CPU time (including completed child processes) and
elapsed time to remain strictly below 180 seconds. The timing gate also
rejects resource-timing notes. Its regression tests cover missing timing
records, CPU and elapsed overruns, and timing notes.

Checks unset external OpenMP controls, set BLAS providers to one thread,
and set all three R check CPU-to-elapsed timing thresholds to 2.5.
Tests scope n.cores to one; parallel correctness tests explicitly compare
one and two workers. An optional test-only BLAS limit restores the previous
setting on teardown. Production thread defaults remain unchanged.

The manuscript, streamed PCA, UMAP worker metadata, and synchronized UMAP
checkpoint tests run on CRAN. Workloads retain numerical, metadata, error,
thread-invariance, and checkpoint assertions while using at most two workers.
GPU/device-specific tests still skip when hardware is unavailable. Windows
skips the Unix external-command and preserved-time mutation tests.

## Additional verification

The identical canonical archive also completed local R CMD check --as-cran
on Ubuntu 22.04, R 4.5.2, with PDF and HTML manuals and vignette rebuilding:
0 errors, 0 warnings, and 2 notes (incoming URL/ORCID probes could not
resolve remote hosts; the environment could not verify the system clock).
All external OpenMP and BLAS controls were unset. Testthat took 86.8 CPU
and 96.6 elapsed seconds. No resource-timing notes occurred.

A fresh local build on Ubuntu 22.04 with R 4.5.2, including vignettes,
passed full R CMD check --as-cran including PDF and HTML manuals with
0 errors, 0 warnings, and only the new-submission note. This diagnostic
archive differs from the canonical CI archive above. With external BLAS
limits, check tests took 87.9 CPU and 94.3 elapsed seconds; with all external
OpenMP and BLAS controls unset, 84.7 CPU and 91.0 elapsed seconds.
A separate full testthat run had 2,816 passing assertions, no failures or
warnings, and took 99.2 CPU and 109.7 elapsed seconds.

Source style, CUDA configure regression checks, and the budget gate tests
passed. Only C++17 is declared in SystemRequirements; optional GPU tooling
is documented separately. Unavailable backend requests fail explicitly.

No CRAN submission has been made.
