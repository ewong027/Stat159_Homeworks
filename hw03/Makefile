.PHONY: all data clean

all: data/eda-output.txt data/regression.Rdata report/report.pdf

# Loading the CSV File
data:
	curl http://www-bcf.usc.edu/~gareth/ISL/Advertising.csv >> data/Advertising.csv

# Making the Elements of Data Folder
data/regression.Rdata: code/regression-script.R data/Advertising.csv
	RScript code/regression-script.R

data/eda-output.txt: data/Advertising.csv code/eda-script.R
	RScript code/eda-script.R

# Generating the report
report/report.pdf: report/report.Rmd data/regression.RData images/scatterplot-tv-sales.png
	Rscript -e "library(rmarkdown); render('report/report.Rmd','pdf_document')"

clean:
	rm -f report/report.pdf