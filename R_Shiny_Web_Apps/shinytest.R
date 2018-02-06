## Install required packages.
## devtools::install_github("rstudio/shinytest")
## webdriver::install_phantomjs()

## Load shinytest package
library(shinytest)

## Record a test for this application
recordTest('carsApp')

## Test the current behaviour of the application to how it behaved
## at baseline.
testApp("carsApp", "carsAppTest.R")
