library(testthat)
source(".github/scripts/check-package.R")

test_that("test budget gate accepts measured, bounded workloads", {
    expect_equal(validate_test_budget("TESTTHAT_TIMING 105.5 117.4"),
        c(105.5, 117.4))
})

test_that("test budget gate rejects slow CPU or wall time", {
    expect_error(validate_test_budget("TESTTHAT_TIMING 180 80"), "below 180")
    expect_error(validate_test_budget("TESTTHAT_TIMING 80 180"), "below 180")
    expect_error(validate_test_budget(character()), "timing record")
})

test_that("test budget gate rejects every resource-timing NOTE", {
    for (stage in c("Examples", "Tests", "Vignettes")) {
        note <- paste(stage, "with CPU time > 2.5 times elapsed time")
        expect_error(validate_test_budget("TESTTHAT_TIMING 1 1", note),
            "resource-timing NOTE")
    }
})
