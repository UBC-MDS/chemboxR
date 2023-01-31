test_that("Function outputs the correct data frame.", {
  expect_equal(get_molec_props('Al2(SO4)3(C2H4)5'), read.csv("get_molec_props_toy_df.csv")[,-1])
})

test_that("Function output dataframe has the right amount of columns", {
  expect_equal(ncol(get_molec_props('CH4')), 9)
})

test_that("Function output dataframe has the right amount of rows", {
  expect_equal(nrow(get_molec_props('CH4')), 2)
})

test_that("Function output dataframe has the element names in the right order", {
  expect_equal(get_molec_props('CH4')$Element, c("Carbon", "Hydrogen"))
})
