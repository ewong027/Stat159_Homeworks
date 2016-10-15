.PHONY: all data tests info eda regression report clean

# Establishing Variables
Adv = data/Advertising.csv
regdata = data/regression.RData
cordata = data/correlation-matrix.RData
fun = code/Functions/regression-functions.R
cod = code/Scripts

all: eda regression report

# Loading the CSV File
data:
	curl http://www-bcf.usc.edu/~gareth/ISL/Advertising.csv >> $(Adv)

# Testing Test-That File
tests:
	cd code && Rscript test-that.R

# Targets that Run the Scripts in Code/Scripts
info: 
	RScript $(cod)/session-info-script.R

eda: $(Adv) $(cod)/eda-script.R
	RScript $(cod)/eda-script.R

regression: $(Adv) $(cod)/regression-script.R
	RScript $(cod)/regression-script.R

# Target for the report
report: report/report.Rmd $(regdata) $(cordata) $(fun)
	Rscript -e "library(rmarkdown); render('report/report.Rmd','pdf_document')"


clean:
	rm -f report/report.Rmd