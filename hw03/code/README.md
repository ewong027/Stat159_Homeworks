## Overview of Code Folder

In this folder, you will find all of the Code scripts that I have written for HW03.

### Files in this Folder

* Functions: This folder contains the regression-function script.
* Scripts: This folder will contain the different scripts that are used in this homework assignment.
    * eda-script.R: This script uses information from Advertising.csv and computes summary statistics and histograms of `TV`, `Radio`, `Newspaper`, and `Sales`. Additionally, it will save the summary statistics and matrix of correlations into eda-output.txt.
    * regression-script.R: This script uses information from Advertising.csv and computes information regrading regression via the `lm()` function. We also comput the summary statistics of the regression object. Finally, this script will produce three different scatterplots of the data with the regression line, save it into PDF form, and save R objection from the regression analusis into the file regression.RData.
    * session-info-script: This script loads all of the necessary packages for this homework and well as has the output of a function called sessionInfo().
* Tests: This file will contain the script called test-regression.R which contains a lot of different test-that functions.
* test-that.R: This contains the general set up of the test-that functions for the project.
