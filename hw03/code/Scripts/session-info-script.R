#Loading Packages that will be used
library(ggplot2)
library(testthat)

#Making session-info.txt
sink(file = "session-info.txt")
sessionInfo()
sink()