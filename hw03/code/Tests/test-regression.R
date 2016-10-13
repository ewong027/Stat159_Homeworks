#Setting Up Data and Loading Packages
library(testthat)
reg <- lm(mpg ~ disp + hp, data = mtcars)
regsum <- summary(reg)

#Loading the Regression Functions
source('../functions/regression-functions.R')

#Things that I Want to Test

context('Test that my Regression-functions produce the 
        same values as using the summary function')

test_that('RSS function works', {
  expect_equal(residual_sum_squares(reg), sum(reg$residuals^2))
  expect_type(residual_sum_squares(reg), 'double')
  expect_length(residual_sum_squares(reg), 1)
})

test_that('TSS function works', {
  expect_equal(total_sum_squares(reg), sum((mtcars$mpg - mean(mtcars$mpg))^2))
  expect_type(total_sum_squares(reg), 'double')
  expect_length(total_sum_squares(reg), 1)
})

test_that('RSE function is value as RSE from summary() ', {
  expect_equal(residual_std_error(reg), regsum$sigma)
  expect_type(residual_std_error(reg), 'double')
  expect_length(residual_std_error(reg), 1)
})

test_that('R^2 function is value as R^2 from summary() ', {
  expect_equal(r_squared(reg), regsum$r.squared)
  expect_type(r_squared(reg), 'double')
  expect_length(r_squared(reg), 1)
})

test_that('F-stat is value as F-stat from summary() ', {
  expect_equivalent(f_statistic(reg), regsum$fstatistic[1])
  expect_type(f_statistic(reg), 'double')
  expect_length(f_statistic(reg), 1)
})

