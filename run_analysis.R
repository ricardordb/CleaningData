# Set working directory

setwd("~/Cursos/Coursera/Data Science/assignments/GettingCleaning")

# First download the data zip file if it doesn't exists
fname <- 'UCI HAR Dataset.zip' 
if (!file.exists(fname)) {
        download.file('https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip', fname , method = 'curl')        
}

# Unzip file if dir not exists
if (!file.exists('UCI HAR Dataset')) {
        unzip(fname)
}

# Change the path to unziped folder
setwd('UCI HAR Dataset')

#### Now we are going to read the test and training files in two dataframes
# Train Data
trainData <- read.table('./train/X_train.txt')
head(trainData)
trainLabels <- read.table('./train/y_train.txt')
head(trainLabels)
trainSubjects <- read.table('./train/subject_train.txt')
head(trainSubjects)
# Test Data
testData <- read.table('./test/X_test.txt')
head(testData)
testLabels <- read.table('./test/y_test.txt')
head(testLabels)
testSubjects <- read.table('./test/subject_test.txt')
head(testSubjects)

## 1. Merges the training and the test sets to create one data set.
mergeData <- rbind(trainData, testData)
mergeLabels <- rbind(trainLabels, testLabels)
mergeSubjects <- rbind(trainSubjects, testSubjects)

# Put names on columns
features <- read.table('features.txt')

# 4. Labeling the data set with descriptive variable names. 
names(mergeData) <- features[,2]
names(mergeLabels) <- 'keyActivity'
names(mergeSubjects) <- 'Subjects'

## 2. Extracts only the measurements on the mean and standard deviation for each measurement.
# Get the column number of the entries that include mean( and std(
meanStdColumns <- grep('mean\\(|std\\(', features[, 2])
# replace the merged dataframe with only the necessary columns
mergeData <- mergeData[, meanStdColumns]

# Merge all dataframes tables toghether horizontally
mergeData <- cbind(mergeSubjects, mergeLabels, mergeData)

## 3. Uses descriptive activity names to name the activities in the data set
activity <- read.table('activity_labels.txt')
names(activity) <- c('keyActivity', 'Activity')
mergeData <- merge(x = mergeData, y = activity)
mergeData$keyActivity <- NULL

## 5. Creates a second, independent tidy data set with the average of each variable for each activity and each subject.
# Columns to group and exclude from aggregate fuction
aggColumns <- names(mergeData) != c('Subjects', 'Activity')
# Aggregate data
tidyData <- aggregate(mergeData[, aggColumns], by = list(mergeData$Subjects, mergeData$Activity), mean)
# Rename Group columns
names(tidyData)[1:2] <- c('Subjects', 'Activity')
# Clean features names
names(tidyData) <- gsub('[-()]', '', names(tidyData))
names(tidyData) <- gsub('mean', 'Mean', names(tidyData))
names(tidyData) <- gsub('std', 'Std', names(tidyData))

# Save tidyData dataframe
write.table(tidyData, file = 'tidyData.txt', row.names=FALSE)
