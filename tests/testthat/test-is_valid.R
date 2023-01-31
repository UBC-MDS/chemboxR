# Test for one substance combination
expect_equal(is_valid('(C2H4)5', TRUE),TRUE)
# Test for two substance combination simple chck
expect_equal(is_valid('Al2(SO4)3', TRUE),TRUE)
# Test for two substance combination
expect_equal(is_valid('Al2(SO4)3'),TRUE)
# Test for more than two substance combination
expect_equal(is_valid('Al2(SO4)3(C2H4)5',TRUE),TRUE)
# test large indices
expect_equal(is_valid('Al20(SO4)30',TRUE),TRUE)
# Test for 2-digit substance
expect_equal(is_valid('C5H12',TRUE),TRUE)
# Test for multiple 2-digit substance
expect_equal(is_valid('(C12H24)2',TRUE),TRUE)
# Test for base
expect_equal(is_valid('NaOH',TRUE),TRUE)
# Test for unknown elements
expect_error(is_valid('NxOH'))
# Test for organic molecules
expect_error(is_valid('CH4'))
# Test for not valid data format
expect_error(is_valid(4))