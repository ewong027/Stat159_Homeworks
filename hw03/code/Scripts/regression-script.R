#Loading the data and Required Packages
require(ggplot2)
advertising <- read.csv('data/Advertising.csv', header = TRUE)

#Computing Regression Object
regression <- lm(advertising$Sales ~ advertising$TV)
regression

#Summary of Regression Object
regression_summary <- summary(regression)
regression_summary

#Lines from Point to Regression Line
estimate <- predict(regression)

#Scatterplot with Regression Line

png("images/scatterplot-tv-sales.png")
ggplot(advertising, aes(TV, Sales))+
  geom_smooth(method = "lm", se = FALSE, col = '#000000') +
  geom_point(col = '#99ccff') +
  geom_segment(aes(xend = TV, yend = estimate), col = '#f04137', alpha = 0.3) +
  theme_bw()
dev.off()

pdf("images/scatterplot-tv-sales.pdf")
ggplot(advertising, aes(TV, Sales)) +
  geom_smooth(method = "lm", se = FALSE, col = '#000000') +
  geom_point(col = '#99ccff') +
  geom_segment(aes(xend = TV, yend = estimate), col = '#f04137', alpha = 0.3) +
  theme_bw()
dev.off()

#Saving objects to Regression.RData
save(regression, regression_summary, file = 'data/regression.RData')
