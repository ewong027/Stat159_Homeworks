## Multiple Regression Analysis

Homework Name: Stat159-Fall2016-HW03

Author: Erica Wong

Description: In this homework assignment, we are using the different tools that we have learned about to reproduce a simple regression analysis. Specifically, we are looking at Chapter 3 of _An Introduction to Statistical Learning_ by Gareth James, Daniela Witten, Trevor Hastie and Robert Tibshirani. [Here is a link to a PDF of their book.](http://www-bcf.usc.edu/%7Egareth/ISL/ISLR%20Sixth%20Printing.pdf) Specifically, we are looking at the analysis regarding the linear relationship between TV, Radio, Newspaper, and Sales.

Organization:

* Code: This folder contains all of my R Scripts. Within the code folder, the scripts are further divided into functions, scripts, and tests.
* Data: This folder contains all of the different data files that I have produced in this homework assignment.
* .gitignore: In the .gitignore file, we would put files and directories that we want to ignore in Git. In this project, we want to ignore files such as .Rhistory and .DS_Store, so that will be in our .gitignore file.
* Images: This folder contains all of my plots in both .png and .pdf form.
* Makefile: This files contains the commands that will run my different R scripts. Additonally, through Makefile, I am going to produce everything that exists in the data folder and the report.
* Report: This file contains my Report for this homework assignment in both .Rmd and .pdf form.

Instructions on How to Reproduce (Assuming you have already have all the scripts made and ready to use):

1. I first started on this project by loading the advertising data set. To do this, I ran the command `make data`. This would download the dataset into my data folder. 
2. Next, I worked with the r-script session-info-script.R. To run this script, I ran the command `make info`. This would then produce session-info.txt.
3. Then I focused on the R-script eda-script.R. To generate the histograms, scatterplot matrix, and eda-output.txt, I ran the command `make eda`.
4. After that, I worked with the r-script regression-script.R. To generate the scatterplots, residual plot, scale location plot, and normal qq plot, I ran the command `make regression`.
5. In this project, we also had to create tests to be tested under testthat functions. To run the test-that tests, I ran the command `make tests`.
6. Finally, in order to generate the report. I ran the command `make report`. This will run the report.Rmd and produce a report.pdf.
    * Within the report itself, to generate the tables, I used the package xtable.

Licenses: All media in this work is licensed under a [Creative Commons Attribution 4.0 International License](https://creativecommons.org/licenses/by/4.0/). All code is licensed under BSD-2-Clause, more information can be found in the License file.
