#Loading the data and Required Packages
require(ggplot2)
advertising <- read.csv('data/Advertising.csv', header = TRUE)
advertising$X <- NULL

#Single Variable Regression for Each of the Variables
regression_TV <- lm(advertising$Sales ~ advertising$TV)
regression_Radio <- lm(advertising$Sales ~ advertising$Radio)
regression_Newspaper <- lm(advertising$Sales ~ advertising$Newspaper)

#Summary of Single Regression Objects for Each of the Variables
regression_summary_TV <- summary(regression_TV)
regression_summary_Radio <- summary(regression_Radio)
regression_summary_Newspaper <- summary(regression_Newspaper)

#Lines from Point to Regression Line
estimate_TV <- predict(regression_TV)
estimate_Radio <- predict(regression_Radio)
estimate_Newspaper <- predict(regression_Newspaper)

#Scatterplots of Single Variables with Regression Line
png("images/scatterplot-tv-sales.png")
ggplot(advertising, aes(TV, Sales))+
  geom_smooth(method = "lm", se = FALSE, col = '#000000') +
  geom_point(col = '#99ccff') +
  geom_segment(aes(xend = TV, yend = estimate_TV), 
               col = '#f04137', alpha = 0.3) +
  ggtitle('Scatterplot-TV-Sales') +
  theme_bw()
dev.off()

png("images/scatterplot-radio-sales.png")
ggplot(advertising, aes(Radio, Sales))+
  geom_smooth(method = "lm", se = FALSE, col = '#000000') +
  geom_point(col = '#007f7f') +
  geom_segment(aes(xend = Radio, yend = estimate_Radio), 
               col = '#645570', alpha = 0.3) +
  ggtitle('Scatterplot-Radio-Sales') +
  theme_bw()
dev.off()

png("images/scatterplot-newspaper-sales.png")
ggplot(advertising, aes(Newspaper, Sales))+
  geom_smooth(method = "lm", se = FALSE, col = '#000000') +
  geom_point(col = '#ff5588') +
  geom_segment(aes(xend = Newspaper, yend = estimate_Newspaper), 
               col = '#0975a9', alpha = 0.3) +
  ggtitle('Scatterplot-Newspaper-Sales') +
  theme_bw()
dev.off()

#Multiple Regression
regression_multiple <- lm(Sales ~ TV+ Radio+ Newspaper, 
                          data = advertising)
#Summary of Multiple Regression
regression_summary_multiple <- summary(regression_multiple)

#Multiple Regression Plots
png("images/residual-plot.png")
plot(regression_multiple,1)
dev.off()

png("images/normal-qq-plot.png")
plot(regression_multiple,2)
dev.off()

png("images/scale-location-plot.png")
plot(regression_multiple,3)
dev.off()

#Saving objects to Regression.RData
save(regression_TV, regression_Radio, regression_Newspaper, 
     regression_multiple, regression_summary_TV, regression_summary_Radio,
     regression_summary_Newspaper, regression_summary_multiple,
     file = 'data/regression.RData')
