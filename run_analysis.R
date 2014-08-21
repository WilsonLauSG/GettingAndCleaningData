## Coursera Course: Getting and Cleaning Data
## Activity: Course Project
## Name: Wilson LAU
## Date: 23 August 2014
## Filename: run_analysis.R
## Data Source: UCI HAR Dataset downloaded from
## https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

## This R script will perform the following steps
## 1. Merges the training and the test sets to create one data set.
## 2. Extracts only the measurements on the mean and standard deviation for each measurement.
## 3. Uses descriptive activity names to name the activities in the data set
## 4. Appropriately labels the data set with descriptive variable names.
## 5. Creates a second, independent tidy data set with the average of each variable
##    for each activity and each subject.

# Clear workspace and set the working directory
rm(list = ls())
setwd("~/Desktop/03_GettingCleaningData") # Location of unzipped UCI HAR Dataset
dataPath <- "./UCI HAR Dataset/"

## 1. Merges the training and the test sets to create one data set.
print("Performing step 1")

# Import the data from all the files
# Import top-level files in UCI HAR Dataset folder
activityLabels  <- read.table(paste(dataPath, "./activity_labels.txt", sep=""), header=FALSE); #activity_labels.txt
features        <- read.table(paste(dataPath, "./features.txt", sep=""), header=FALSE); #features.txt

# Import training data files
print("Importing subjectTrain")
subjectTrain    <- read.table(paste(dataPath, "./train/subject_train.txt", sep=""), header=FALSE); #subject_train.txt
xTrain          <- read.table(paste(dataPath, "./train/x_train.txt", sep=""), header=FALSE); #x_train.txt
yTrain          <- read.table(paste(dataPath, "./train/y_train.txt", sep=""), header=FALSE); #y_train.txt

# Import test data files
print("Importing subjectTest")
subjectTest     <- read.table(paste(dataPath, "./test/subject_test.txt", sep=""), header=FALSE); #subject_test.txt
xTest           <- read.table(paste(dataPath, "./test/x_test.txt", sep=""), header=FALSE); #x_test.txt
yTest           <- read.table(paste(dataPath, "./test/y_test.txt", sep=""), header=FALSE); #y_test.txt

# Assign meaningful headers to the data frames
names(activityLabels)   <- c("activityID", "activityType")
names(features)         <- c("featureID", "featureType")
names(subjectTrain)     <- "subjectID"
names(subjectTest)      <- "subjectID"
names(yTrain)           <- "activityID"
names(yTest)            <- "activityID"
names(xTrain)           <- features[,2]
names(xTest)            <- features[,2]

# Merge the training and test data sets into one data set
trainData <- cbind(yTrain, subjectTrain, xTrain) # activity, subject, measurements
testData <- cbind(yTest, subjectTest, xTest)
combineData <- rbind(trainData, testData) # Addresses step 1 above
#print(str(combineData))

## 2. Extracts only the measurements on the mean and standard deviation for each measurement.
print("Performing step 2")
headerNames <- names(combineData) # extract the column headers from the data set
pattern_include <- "ID|-mean|-std"
pattern_exclude <- "-meanFreq|-X|-Y|-Z"
selectedCol <- (grepl(pattern_include, headerNames) & !grepl(pattern_exclude, headerNames)) # choose only ID, mean and std deviation measurements
combineData2 <- combineData[selectedCol == TRUE] # subset the dataset; addresses step 2 above

## 3. Uses descriptive activity names to name the activities in the data set
print("Performing step 3")
combineData3 <- merge(combineData2, activityLabels) # Addresses step 3 above

## 4. Appropriately labels the data set with descriptive variable names.
print("Performing step 4")
headerNames <- names(combineData3) # Re-subset the headers
for (i in 1:length(headerNames)) {
        headerNames[i] <- gsub("^(f)", "freq", headerNames[i]) # freq prefix
        headerNames[i] <- gsub("^(t)", "time", headerNames[i]) # time prefix
        headerNames[i] <- gsub("BodyBody", "Body", headerNames[i]) # body
        headerNames[i] <- gsub("Mag", "Magnitude", headerNames[i]) # magnitude
        headerNames[i] <- gsub("-mean\\()", "Mean", headerNames[i]) # mean
        headerNames[i] <- gsub("-std\\()", "StdDev", headerNames[i]) # standard deviation        
}
combineData4 <- combineData3
names(combineData4) <- headerNames # update the headers.  Addresses step 4 above

## 5. Creates a second, independent tidy data set with the average of each variable
##    for each activity and each subject.
print("Performing step 5")
tidyData <- aggregate(combineData4[,names(combineData4) != c("activityID", "subjectID", "activityType")], 
                 by=list(activityID=combineData4$activityID, subjectID=combineData4$subjectID),
                 FUN=mean)      # aggregate all columns except activityID, subjectID and activityType,
                                # grouped by activityID and subjectID and
                                # applying mean to find the average for each variable
tidyData <- tidyData[order(tidyData$activityID, tidyData$subjectID),] # order the data set by activityID and subjectID
tidyData <- merge(tidyData, activityLabels) # add in the descriptive activity name

# Export the tidyData set
write.table(tidyData, './tidyData.txt', row.names=FALSE); # Addresses step 5 above
#tidyData2  <- read.table(paste(dataPath, "./tidyData.txt", sep="")); #tidyData.txt to verify correct write
#tidyData2 <- tidyData2[order(tidyData2$activityId, tidyData2$subjectId),] # order the data set by activityID and subjectID
