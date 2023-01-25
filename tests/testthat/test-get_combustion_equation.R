test_that("basic combustion equation works", {
  expect_equal(get_combustion_equation("CH4"), data.frame(CH4 = 1, O2 = 2, CO2 = 1, H2O = 2))
  expect_equal(get_combustion_equation("C5H12"), data.frame(C5H12 = 1, O2 = 8, CO2 = 5, H2O = 6))
  expect_equal(get_combustion_equation("C6H14"), data.frame(C6H14 = 2, O2 = 19, CO2 = 12, H2O = 14))
})

test_that("Test errors", {
  expect_error(get_combustion_equation(c("CH4", "CH5")), "take one molecule")
  expect_error(get_combustion_equation("CO2"), "only contain")
  expect_error(get_combustion_equation("LiH"), "only contain")
  expect_error(get_combustion_equation("NO2"), "only contain")
  expect_error(get_combustion_equation("(CH4)3"), "parentheses")
  expect_error(get_combustion_equation("(CH43"), "parentheses")
  expect_error(get_combustion_equation("CH4)3"), "parentheses")
  expect_error(get_combustion_equation(1.0), "entered as a string")
})
