local({
    scope <- testthat::teardown_env()
    withr::local_options(list(n.cores = 1L), .local_envir = scope)
    if (requireNamespace("RhpcBLASctl", quietly = TRUE)) {
        threads <- RhpcBLASctl::blas_get_num_procs()
        withr::defer(RhpcBLASctl::blas_set_num_threads(threads),
            envir = scope)
        RhpcBLASctl::blas_set_num_threads(1L)
    }
})
