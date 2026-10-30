validate_test_budget <- function(lines, notes = character(), limit = 180) {
    if (any(grepl("CPU|elapsed|timing", notes, ignore.case = TRUE))) {
        stop("Unreviewed resource-timing NOTE: ", paste(notes, collapse = "\n"))
    }
    marker <- grep("^TESTTHAT_TIMING ", lines, value = TRUE)
    if (length(marker) != 1L) stop("Missing unique testthat timing record.")
    seconds <- scan(text = sub("^TESTTHAT_TIMING ", "", marker), quiet = TRUE)
    if (length(seconds) != 2L || any(!is.finite(seconds)) ||
        any(seconds < 0) || any(seconds >= limit)) {
        stop(sprintf("testthat must finish below %g CPU and elapsed seconds.",
            limit))
    }
    message(sprintf("testthat: %.1f CPU seconds; %.1f elapsed seconds",
        seconds[[1L]], seconds[[2L]]))
    invisible(seconds)
}

if (sys.nframe() == 0L) {
    tarballs <- list.files("source-package", "[.]tar[.]gz$", full.names = TRUE)
    stopifnot(length(tarballs) == 1L)
    check_dir <- Sys.getenv("FASTEMBEDR_CHECK_DIR",
        file.path(tempdir(), "fastembedr-budget-check"))
    check_args <- commandArgs(trailingOnly = TRUE)
    if (!length(check_args)) check_args <- c("--no-manual", "--as-cran")
    print(Sys.getenv(c("OMP_NUM_THREADS", "OMP_THREAD_LIMIT", "OMP_WAIT_POLICY",
        "OPENBLAS_NUM_THREADS", "GOTO_NUM_THREADS", "MKL_NUM_THREADS",
        "BLIS_NUM_THREADS", "VECLIB_MAXIMUM_THREADS")))
    result <- rcmdcheck::rcmdcheck(tarballs[[1L]],
        args = check_args, check_dir = check_dir,
        error_on = "warning")
    logs <- list.files(check_dir, "^testthat[.]Rout$", recursive = TRUE,
        full.names = TRUE)
    stopifnot(length(logs) == 1L)
    validate_test_budget(readLines(logs[[1L]]), result$notes)
}
