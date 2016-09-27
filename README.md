# Getting and Cleaning Data Course Project

The purpose of this project is to demonstrate the ability to collect, work with, and clean a data set. The goal is to prepare tidy data (more on tidy data on this [link](https://cran.r-project.org/web/packages/tidyr/vignettes/tidy-data.html)) that can be used for later analysis.

The data used was from one of the most exciting areas in all of data science right now is wearable computing. Companies like Fitbit, Nike, and Jawbone Up are racing to develop the most advanced algorithms to attract new users. The data linked to from the course website represent data collected from the accelerometers from the Samsung Galaxy S smartphone. A full description is available at the site where the data was obtained:

http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

The data for the project can be downloaded from:

https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

This repository have the following files:

1. README.md - This file that explains how the script work beside the comments on script.
2. CodeBook.md  -  Describes the variables, the data, and any transformations or work performed to clean up the data.
3. run_analysis.R - R script the performs the following:

	3.1. Download and unzip the data from the link above if it doesn't exist already.
	3.2. Merges the training and the test sets to create one data set.
    3.3. Extracts only the measurements on the mean and standard deviation for each measurement.
    3.4. Replace the Activity information with descriptive names.
    3.5. Appropriately labels the data set with descriptive variable names.
    3.6. Creates an independent tidy data set with the average of each variable for each activity and each subject.

4. tidyData.txt - Tidy data set with the average of each variable for each activity and each subject.
