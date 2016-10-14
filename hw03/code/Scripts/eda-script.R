#Loading Data
advertising <- read.csv('data/Advertising.csv', header = TRUE)
advertising$X <- NULL

#PNG Images
png('images/histogram-tv.png')
  hist(as.numeric(advertising$TV), breaks = 20, col = '#07ffc7',
     xlab = 'TV Advertising Budget (in thousands of dollars)',
     ylab = 'Frequency',
     main = 'Histogram of Frequency of TV Advertising Budgets',
     ylim = c(0,20))
dev.off()

png('images/histogram-sales.png')
hist(as.numeric(advertising$Sales), breaks = 20, col = '#d9d8ff',
     xlab = 'Sales (in thousands of units)',
     ylab = 'Frequency',
     main = 'Histogram of Frequency of Sales',
     xlim = c(0,30),
     ylim = c(0,25))
dev.off()

png('images/histogram-radio.png')
hist(as.numeric(advertising$Radio), breaks = 10, col = '#ffc0cb',
     xlab = 'Radio Advertising Budget (in thousands of dollars)',
     ylab = 'Frequency',
     main = 'Histogram of Frequency of Radio')
dev.off()

png('images/histogram-newspaper.png')
hist(as.numeric(advertising$Newspaper), breaks = 10, col = '#3b98ee',
     xlab = 'Newspaper Advertising Budget (in thousands of dollars)',
     ylab = 'Frequency',
     main = 'Histogram of Frequency of Newspaper')
dev.off()

#correlation matrix
correlation_matrix <- cor(advertising)
correlation_matrix <- round(correlation_matrix, digits = 4)
correlation_matrix[lower.tri(correlation_matrix)] <- ''

#Making the Summary Tables
sink('data/eda-output.txt')
cat('Summary of TV\n')
summary(as.numeric(advertising$TV))
cat('Summary of Radio\n')
summary(as.numeric(advertising$Radio))
cat('Summary of Newspaper\n')
summary(as.numeric(advertising$Newspaper))
cat('Summary of Sales\n')
summary(as.numeric(advertising$Sales))
cat('\nMatrix of Correlations\n')
print(correlation_matrix)
sink()

#scatterplot-matrix
png('images/scatterplot-matrix.png')
pairs(advertising, cex.labels = 1.5)
dev.off()

#Saving objects to correlation-matrix.RData
save(correlation_matrix, file = 'data/correlation-matrix.RData')

