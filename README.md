This file describes how run_analysis.R script works.
    1.unzip the data from https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip and rename the folder with "data".
    2.Put data into /home/yourname
    3.Put run_analysis.R into /home/yourname/data
    4.Make sure the folder "data" and the run_analysis.R script are both in the working directory.
    5.In RStudio: setwd("/home/yourname")
    6.Use source("run_analysis.R") command in RStudio 
    7.You will find two output files are generated in the current working directory:
    mergedcleaneddata.txt: it contains a dataframe called MergedCleanedData with 10299*68 dimension.
    datasetaverages.txt : it contains a dataframe called averages with 180*68 dimension.
    8.Use data <- read.table("datasetaverages.txt") command in RStudio to read the file. There are 6 activities in total and 30 subjects in total, so we have 180 rows with all combinations for each of the 66 features.


