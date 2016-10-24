#Loading Data
advertising <- read.csv('data/Advertising.csv', header = TRUE)

#PNG Images
png('images/histogram-tv.png')
  hist(as.numeric(advertising$TV), breaks = 20, col = '#07ffc7',
     xlab = 'Advertising Budget (in thousands of dollars)',
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

#PDF Images
pdf('images/histogram-tv.pdf')
hist(as.numeric(advertising$TV), breaks = 20, col = '#07ffc7',
     xlab = 'Advertising Budget (in thousands of dollars)',
     ylab = 'Frequency',
     main = 'Histogram of Frequency of TV Advertising Budgets',
     ylim = c(0,20))
dev.off()

pdf('images/histogram-sales.pdf')
hist(as.numeric(advertising$Sales), breaks = 20, col = '#d9d8ff',
     xlab = 'Sales (in thousands of units)',
     ylab = 'Frequency',
     main = 'Histogram of Frequency of Sales',
     xlim = c(0,30),
     ylim = c(0,25))
dev.off()

#Making the Summary Tables

sink('data/eda-output.txt')
cat('Summary of TV\n')
summary(as.numeric(advertising$TV))
cat('Summary of Sales\n')
summary(as.numeric(advertising$Sales))
sink()
