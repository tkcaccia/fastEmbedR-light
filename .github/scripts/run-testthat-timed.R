args <- commandArgs(trailingOnly = TRUE)
if (length(args) != 1L) {
    stop("usage: run-testthat-timed.R <output-directory>", call. = FALSE)
}
script <- grep("^--file=", commandArgs(), value = TRUE)
script_dir <- dirname(normalizePath(sub("^--file=", "", script)))
source(file.path(script_dir, "check-package.R"))
out_dir <- normalizePath(args[[1L]], mustWork = TRUE)
limit <- as.numeric(Sys.getenv("FASTEMBEDR_TESTTHAT_MAX_SECONDS", "180"))
if (!is.finite(limit) || limit <= 0) {
    stop("FASTEMBEDR_TESTTHAT_MAX_SECONDS must be positive.", call. = FALSE)
}

timing <- system.time(results <- testthat::test_dir(
    "tests/testthat", reporter = "summary", package = "fastEmbedR",
    load_package = "installed", stop_on_failure = FALSE))
counts <- as.data.frame(results)
cpu <- sum(timing[c("user.self", "sys.self", "user.child", "sys.child")],
    na.rm = TRUE)
summary <- data.frame(
    elapsed_sec = unname(timing[["elapsed"]]), cpu_sec = cpu,
    user_sec = unname(timing[["user.self"]]),
    system_sec = unname(timing[["sys.self"]]),
    passed = sum(counts$passed), failed = sum(counts$failed),
    warnings = sum(counts$warning), skipped = sum(counts$skipped),
    errors = sum(counts$error), limit_sec = limit)
utils::write.csv(summary, file.path(out_dir, "testthat-timing.csv"),
    row.names = FALSE)
if (summary$failed || summary$errors) stop("testthat failed.", call. = FALSE)
validate_test_budget(paste("TESTTHAT_TIMING", cpu, summary$elapsed_sec),
    limit = limit)
