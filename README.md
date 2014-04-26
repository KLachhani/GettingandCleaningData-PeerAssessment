#Getting and Cleaning Data
##Peer Assessment
###Introduction
This script runs analysis on the Samsung sensor data. 30 subjects perform 6 
activities, the scripts returns the mean and standard deviation and averages
over all measurements for each subject for each activity.

###How to use
The "UCI HAR Dataset" folder should be placed in the same directory as the
script. There is only a single function in this script. run_analysis() returns 
the tidied data frame and also writes the data frame to tidy.txt in the same 
directory

###How it works
* Read in data, activity label number, label names, subject IDs for test and train
* Merge test and train file pairs where applicable
* Give label numbers their associated activity names
* column bind subject, activies and measurements
* Add column names from full features list
* Keep only columns with mean() and std() in the name
* Order the data with subject then activity
* Evaluate mean for subject and activity