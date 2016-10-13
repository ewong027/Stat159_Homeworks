# In these functions, the object x would have class of lm. So, it would
# have the appropriate attributions that are needed in these functions.
# Hence the expected input is an object with class of lm.

#Calculating the Residual Sum of Squares (RSS)
#This function takes the sum of the squared value of the residuals.
residual_sum_squares <- function(x){
  sum(x$residuals^2)
}

#Calculating the Total Sum of Squares (TSS)
#Total Sum of Squares takes the sum of (yi - y_bar).
#In order to get the y values, we have to call on the parameter model.
total_sum_squares <- function(x){
  sum((x$model[ , 1] - mean(x$model[ , 1]))^2)
}

#Calculating the R-squared
#R^2 = 1 - RSS/TSS
#R^2 tells us how much of the dependent variable
#can be explained by the independent variable
R_squared <- function(x){
  1 - residual_sum_squares(x)/total_sum_squares(x)
}

#Calculating the F-statistic
#F-stat = ((TSS-RSS)/p)/(RSS/(n-p-1))
#Numerator of F-stat = ((TSS-RSS)/p)
#Denominator of F-stat = (RSS/(n-p-1))
#p is the number of explainatory variables and n is the number of samples
f-statistic <- function(x){
  numerator <- (total_sum_squares(x)-residual_sum_squares(x))/(x$rank - 1)
  denominator <- residual_sum_squares(x)/x$df.residual
  numerator/denominator
}

#Calculating the RSE
#RSE = sqrt(RSS/(n-p-1))
#p is the number of explainatory variables and n is the number of samples
residual_std_error <- function(x){
  sqrt(residual_sum_squares(x)/x$df.residual)
}