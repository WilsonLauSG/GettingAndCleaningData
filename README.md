GettingAndCleaningData
======================

Repo for Course Project (Coursera Course on Getting and Cleaning Data)

Wilson LAU

Overview

The purpose of this project is to demonstrate the ability to collect, work with and clean a data set. The goal is to prepare tidy data that can be used for later analysis.

Folder Structure for this Repo
Folder name: GettingAndCleaningData.  This folder contains the following files

1) README.md - explains how the script works and its relation to the dataset
2) CodeBook.md - describes the variables, data and any transformations or work to clean up the data
3) run_analysis.R - R script to import and clean the data
4) UCI HAR Dataset - folder to be downloaded and unzipped from the data source (see CodeBook.md for further details).  The run_analysis.R script will navigate this folder
5) tidyData.txt - file containing the tidy data that is generated after successfully executing run_analysis.R

Modifications to the run_analysis.R script

After you have downloaded and unzipped the source files and dataset, take note of line 19 of the R script to set the path of the working directory for the script as well as the dataset folder

Project Objectives

You are to create one R script called run_analysis.R that does the following steps

1) Merges the training and the test sets to create one data set.
2) Extracts only the measurements on the mean and standard deviation for each measurement. 
3) Uses descriptive activity names to name the activities in the data set
4) Appropriately labels the data set with descriptive variable names. 
5) Creates a second, independent tidy data set with the average of each variable for each activity and each subject.
