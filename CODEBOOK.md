Course Project CODEBOOK
=======================
This file describes the variables, the data, and any transformations or work that I have performed to clean up the data.
* The site where the data was obtained:
http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones 
The data for the project:
https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip
*  The run_analysis.R script performs the following steps to clean the data:
     1.Read and concatenate: X_train.txt and X_test.txt in new X dataframe by one command with 10299*66 dimension, Y_train.txt and Y_test.txt in new Y dataframe by one command with 10299*1 dimension, subject_train.txt and subject_test.txt in new Subj dataframe by one command with 10299*1 dimension
     2.Read the features.txt file from the "/data" folder and store the data in a variable called features. We only extract the measurements on the mean and standard deviation and store them in NecessaryFeatures. This results in a 66 indices list. We get a subset of X with the 66 corresponding columns.
     3.Read the activity_labels.txt file from the "./data"" folder and store the data in a variable called activity.
     4.Clean the activity names in the second column of activity. We first make all names to lower cases. If the name has an underscore between letters, we remove the underscore.
     5.Transform the values of joinLabel according to the activity data frame.
     6.Appropriately labels the data set with descriptive variable names: transform f into Frequency, t into Time, mean into MeanValue, std into Standard Deviation, Acc into LinearAcceleration, Gyro in AngularVelocity, Mag into Magnitude, delete () and - .
     7.Combine the X, Y and Subj by column to get a new cleaned 10299x68 data frame, MergedCleanedData. The first two columns are "subject" and "activity". The "subject" column contains integers that range from 1 to 30 inclusive; the "activity" column contains 6 kinds of activity names; the last 66 columns contain measurements that range from -1 to 1 exclusive.
     8.Sorting MergedCleanedData by 'subject' and 'activity'.
     9.Write MergedCleanedData out to "mergedcleaneddata.txt" file in current working directory with row.names=FALSE as said in task.
     10.Generate a second independent tidy data set called averages with the average of each measurement for each activity and each subject with functions "group_by" and "summarise_each" from "dplyr". We have 30 unique subjects and 6 unique activities, which result in a 180 combinations of the two. For each combination, we calculate the mean of each measurement with the corresponding combination with "mean" function. After this we get a 180x68 dataframe.
     11.Write the result out to "datasetaverages.txt" file in current working directory.

