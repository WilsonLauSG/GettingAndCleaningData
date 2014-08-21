## Getting and Cleaning Data Project

Wilson LAU

## Purpose of this File
This is to provide additional information on the variables, data and transformations used in the Course Project

## Data Source
The data linked to from the course website represent data collected from the accelerometers from the Samsung Galaxy S smartphone. A full description is available at the site where the data was obtained: 

http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones 

Here are the data for the project: 

https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip 

## Information on the Data Set
The experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, we captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz. The experiments have been video-recorded to label the data manually. The obtained dataset has been randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data. 

The sensor signals (accelerometer and gyroscope) were pre-processed by applying noise filters and then sampled in fixed-width sliding windows of 2.56 sec and 50% overlap (128 readings/window). The sensor acceleration signal, which has gravitational and body motion components, was separated using a Butterworth low-pass filter into body acceleration and gravity. The gravitational force is assumed to have only low frequency components, therefore a filter with 0.3 Hz cutoff frequency was used. From each window, a vector of features was obtained by calculating variables from the time and frequency domain. See 'features_info.txt' in the dataset folder for more details.

For each record it is provided:
- Triaxial acceleration from the accelerometer (total acceleration) and the estimated body acceleration.
- Triaxial Angular velocity from the gyroscope. 
- A 561-feature vector with time and frequency domain variables. 
- Its activity label. 
- An identifier of the subject who carried out the experiment.

## Information on the run_analysis.R
You are to create one R script called run_analysis.R that does the following steps

1) Merges the training and the test sets to create one data set.
2) Extracts only the measurements on the mean and standard deviation for each measurement. 
3) Uses descriptive activity names to name the activities in the data set
4) Appropriately labels the data set with descriptive variable names. 
5) Creates a second, independent tidy data set with the average of each variable for each activity and each subject.

## Step 1 - Merge the training and the test sets to create one data set.
a) After clearing the workspace and setting the appropriate working directory, the script would import into tables the data from all the relevant files, namely
- top-level files in UCI HAR Dataset folder 
        - activity_labels.txt
        - features.txt
- files in the train folder
        - subject_train.txt
        - x_train.txt
        - y_train.txt
- files in the test folder
        - subject_test.txt
        - x_test.txt
        - y_test.txt

b) Assignment of meaningful headers to the respective tables, namely
- activityID
- activityType
- featureID
- featureType
- subjectID

c) Merging of the training and test data sets into one consolidated data set using cbind and rbind functions

## Step 2. Extracts only the measurements on the mean and standard deviation for each measurement.
- use the grepl function to scan for specific patterns to include/exclude in the table headers

## Step 3. Uses descriptive activity names to name the activities in the data set
- use the merge function to label descriptive activity names

## Step 4 - Appropriately labels the data set with descriptive variable names.
- use the gsub function to label descriptive variable names

## Step 5 - Creates a second, independent tidy data set with the average of each variable for each activity and each subject.
- use the aggregate, order, merge and mean functions to effect this
- export the tidy data set to filename "tidyData.txt"
