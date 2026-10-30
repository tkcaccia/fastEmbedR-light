library(testthat)
library(fastEmbedR)

timing <- system.time(test_check("fastEmbedR"))
cpu <- sum(timing[c("user.self", "sys.self", "user.child", "sys.child")],
    na.rm = TRUE)
cat("TESTTHAT_TIMING", cpu, timing[["elapsed"]], "\n")
