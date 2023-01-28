# Test for one substance combination
expect_equal(get_elements('(C2H4)5'),data.frame(element = c('C','H'), count = c(10,20)))
# Test for two substance combination
expect_equal(get_elements('Al2(SO4)3'),data.frame(element = c('Al','S','O'), count = c(2,3,12)))
# Test for more than two substance combination
expect_equal(get_elements('Al2(SO4)3(C2H4)5'),data.frame(element = c('Al','S','O','C','H'), count = c(2,3,12,10,20)))
# Test for 2-digit substance
expect_equal(get_elements('C5H12'),data.frame(element = c('C','H'), count = c(5,12)))
# Test for multiple 2-digit substance
expect_equal(get_elements('(C12H24)2'),data.frame(element = c('C','H'), count = c(24,48)))
# Test for multiple of single substances - case1
expect_equal(get_elements('LiH'),data.frame(element = c('Li','H'), count = c(1,1)))
# Test for multiple of single substances - case2
expect_equal(get_elements('HLi'),data.frame(element = c('H','Li'), count = c(1,1)))
# Test for multiple of single substances - case3
expect_equal(get_elements('LiH2'),data.frame(element = c('Li','H'), count = c(1,2)))
# Test for multiple of single substances - case4
expect_equal(get_elements('Li2H8'),data.frame(element = c('Li','H'), count = c(2,8)))
# Test for duplicated elements
expect_equal(get_elements('NaOH'),data.frame(element = c('Na','O','H'), count = c(1,1,1)))