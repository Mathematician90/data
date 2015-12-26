library(dplyr)
#1. Merges the training and the test sets to create one data set.
X<-rbind(read.table("./data/train/X_train.txt"),read.table("./data/test/X_test.txt"))
Y<-rbind(read.table("./data/train/y_train.txt"),read.table("./data/test/y_test.txt"))
Subj<-rbind(read.table("./data/train/subject_train.txt"),read.table("./data/test/subject_test.txt"))

# Step2. Extracts only the measurements on the mean and standard deviation for each measurement. 
features<- read.table("./data/features.txt")
NecessaryFeatures<-grep("mean\\(\\)|std\\(\\)", features[, 2]) #extract features with mean() and std()
X<-X[,NecessaryFeatures]

# Step3. Uses descriptive activity names to name the activities in the data set
activity<-read.table("./data/activity_labels.txt")
activity[, 2] <-gsub("_", "", tolower(as.character(activity[, 2]))) #transform activitylabels to lower case
Y[,1] <- activity[Y[,1], 2]
names(Y)<-"activity"

# 4. Appropriately labels the data set with descriptive activity names.
names(Subj) <- "subject"
names(X) <- gsub("\\(\\)", "", features[NecessaryFeatures, 2])
names(X) <- gsub("mean", "MeanValue", names(X))
names(X) <- gsub("-", "", names(X))
names(X) <- gsub("tBody", "TimeBody", names(X))
names(X) <- gsub("tGravity", "TimeGravity", names(X))  #changes all short names to full
names(X) <- gsub("std", "StandardDeviation", names(X))
names(X) <- gsub("f", "Frequency", names(X))
names(X) <- gsub("Acc", "LinearAcceleration", names(X))
names(X) <- gsub("Gyro", "AngularVelocity", names(X))
names(X) <- gsub("Mag", "Magnitude", names(X))
MergedCleanedData <- cbind(Subj, Y, X)
MergedCleanedData<-MergedCleanedData[order(MergedCleanedData$subject,MergedCleanedData$activity),] #sort dataframe by subject and activity for comfortable order
write.table(MergedCleanedData, "./data/mergedcleaneddata.txt",row.names=FALSE)

# 5. Creates a 2nd, independent tidy data set with the average of each variable for each activity and each subject.
averages<-group_by(MergedCleanedData,subject,activity)
averages<-summarise_each(averages,funs(mean))
write.table(averages, "./data/datasetaverages.txt",row.names=FALSE)

