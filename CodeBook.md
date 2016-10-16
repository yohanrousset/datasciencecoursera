##CodeBook

This document describes the data and transofrmations used by run_analysis.R and the definition of variables in Tidy.txt.

##Dataset Used

This data is obtained from "Human Activity Recognition Using Smartphones Data Set". The data linked are collected from the accelerometers from the Samsung Galaxy S smartphone. A full description is available at the site http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones.

The data set used can be downloaded from https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip.

##Input Data Set

The input data containts the following data files:

X_train.txt contains variable features that are intended for training.
y_train.txt contains the activities corresponding to X_train.txt.
subject_train.txt contains information on the subjects from whom data is collected.
X_test.txt contains variable features that are intended for testing.
y_test.txt contains the activities corresponding to X_test.txt.
subject_test.txt contains information on the subjects from whom data is collected.
activity_labels.txt contains metadata on the different types of activities.
features.txt contains the name of the features in the data sets.

##Data
Following are the transformations that were performed on the input dataset:
#Train data
X_train.txt is read into featuresTrain.
y_train.txt is read into activityTrain.
subject_train.txt is read into subjectTrain.
#Test data
X_test.txt is read into featuresTest.
y_test.txt is read into activityTest.
subject_test.txt is read into subjectTest.
#Other data
features.txt is read into featureNames.
activity_labels.txt is read into activityLabels.

##Output Data Set

The output data Tidy.txt is a a space-delimited value file. The header line contains the names of the variables. It contains the mean and standard deviation values of the data contained in the input files. The header is restructued in an understandable manner.
