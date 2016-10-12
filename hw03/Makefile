.PHONY: all data clean

all: eda-output.txt regression.Rdata report.pdf

data:
	curl http://www-bcf.usc.edu/~gareth/ISL/Advertising.csv >> data/Advertising.csv

regression.Rdata: code/regression-script.R data/Advertising.csv
	RScript code/regression-script.R

eda-output.txt: data/Advertising.csv code/eda-script.R
	RScript code/eda-script.R

report.pdf: report/report.Rmd data/regression.RData images/scatterplot-tv-sales.png
	Rscript -e "library(rmarkdown); render('report/report.Rmd','pdf_document')"

clean:
	rm -f report/report.pdf