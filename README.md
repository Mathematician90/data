Course Project README
=====================
This file describes how run_analysis.R script works.   
* Unzip the data from https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip and rename the folder with "data".
* Put data into /home/yourname
* Put run_analysis.R into /home/yourname/data
* Make sure the folder "data" and the run_analysis.R script are both in the working directory.
* In RStudio: setwd("/home/yourname")
* Use source("run_analysis.R") command in RStudio 
* You will find two output files are generated in the current working directory: mergedcleaneddata.txt: it contains a dataframe called MergedCleanedData with 10299x68 dimension, datasetaverages.txt : it contains a dataframe called averages with 180x68 dimension.
* Use data <- read.table("datasetaverages.txt") command in RStudio to read the file. 