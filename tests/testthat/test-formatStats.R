test_that("output is dataframe", {
  expect_snapshot_output(is.data.frame(df))
})
