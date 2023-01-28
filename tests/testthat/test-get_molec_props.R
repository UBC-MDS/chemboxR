library(tidyverse)

test_that("Function outputs the correct data frame.", {
  expect_equal(get_molec_props('Al2(SO4)3(C2H4)5'), read.csv("get_molec_props_toy_df.csv")[,-1])
})
