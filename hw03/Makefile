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

# Phony Targets that Run the Scripts in Code/Scripts
info: $(cod)/session-info-script.R
	RScript $(cod)/session-info-script.R

eda: $(Adv) code/Scripts/eda-script.R
	RScript $(cod)/eda-script.R

regression: $(Adv) $(cod)/regression-script.R
	RScript $(cod)/regression-script.R

# Producing the files that are in Data
session-info.txt: $(cod)/session-info-script.R
	RScript $(cod)/session-info-script.R

data/eda-output.txt: $(Adv) $(cod)/eda-script.R
	RScript $(cod)/eda-script.R

data/regression.RData: $(Adv) $(cod)/regression-script.R
	RScript $(cod)/regression-script.R

# Phony Target for the report
report: $(rmd) $(regdata) $(cordata) $(fun)
	Rscript -e "library(rmarkdown); render(‘$(rmd)’,c(‘pdf_document’,‘html_document’))”

# Generating the report
$(rep): $(rmd) $(regdata) $(cordata) $(fun)
	Rscript -e "library(rmarkdown); render(‘$(rmd)’,c(‘pdf_document’,‘html_document’))”

clean:
	rm -f $(rep)