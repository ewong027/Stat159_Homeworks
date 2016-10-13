.PHONY: all data info eda regression report clean

# Establishing Variables
Adv = data/Advertising.csv
regdata = data/regression.RData
cordata = data/correlation-matrix.RData
fun = code/Functions/regression-functions.R
rmd = report/report.Rmd
rep = report/report.Rmd
cod = code/Scripts

all: eda regression report

# Loading the CSV File
data:
	curl http://www-bcf.usc.edu/~gareth/ISL/Advertising.csv >> $(Adv)

# Testing Test-That File
tests:
	cd code && Rscript test-that.R

# Running the Scripts in Code/Scripts
info: 
	RScript $(cod)/session-info-script.R

eda: $(Adv) code/Scripts/eda-script.R
	RScript $(cod)/eda-script.R

regression: $(Adv) code/Scripts/regression-script.R
	RScript $(cod)/regression-script.R

# Generating the report
report: $(rmd) $(regdata) $(cordata) $(fun)
	Rscript -e "library(rmarkdown); render(‘$(rmd)’,c(‘pdf_document’,‘html_document’))”

clean:
	rm -f $(rep)