test_that("output is a matrix", {
  expect_snapshot_output(is.matrix(
    makeMatrix(Halo_DF, "percent_identity_global", 100, 50)
  ))
})
