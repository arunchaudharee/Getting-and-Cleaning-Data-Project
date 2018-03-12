## Getting and Cleaning Data Course Project
## This R script called run_analysis.R downloads the data from the following link and does the following:
## download link - https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

## 1. Merges the training and the test sets to create one data set.
## 2. Extracts only the measurements on the mean and standard deviation for each measurement.
## 3. Uses descriptive activity names to name the activities in the data set
## 4. Appropriately labels the data set with descriptive variable names.
## 5. From the data set in step 4, creates a second, independent tidy data set with 
## the average of each variable for each activity and each subject.

## This code is written in RStudio, R version 3.4.3, in Windows 10 OS.
## First download the zipped dataset, unzip it and read readme file, activity_labels, features, features_info files
## and check data files in each of the folders

## Downloading of file and unzip can be done manually or through coding
## tidying of dataset will require dplyr package or reshape2 package so install if not already installed
## In this code, "reshape2" package is used for data tidying


## First clear the environment

rm(list=ls())

## Downloading of file and unzip can be done manually or through coding
## tidying of dataset will require dplyr package or reshape2 package, install if not already installed
## In this code, reshape2 package is used for data tidying
## Check if the "reshape2" package is installed.

if(!is.element("reshape2", installed.packages())) {
  # It package is not installed,install it, and then load it
  install.packages("reshape2")
  library(reshape2)
}

## Initialize some initial values for folders that are to be downloaded and unzipped
## Get the path of working directory

path <- getwd()
downloadFolder <- "UCI HAR Dataset"
zippedfile <- "dataset.zip"
url <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"

# Check if the user has already unzipped the file

if(!file.exists(downloadFolder)) {

  # Is there a zip file?
  if(!file.exists(zippedfile)) {
    
    # if zip file is not downloaded, downlaod it
    download.file(url,file.path(path, zippedfile)) 
  }
  
  # Now, unzip the file
  unzip(zippedfile)
}

## unzipped files are in the folder UCI HAR Dataset. See the list of files in it.

downloaded_path <- file.path(path, "UCI HAR Dataset")
files<-list.files(downloaded_path, recursive=TRUE)
files

## 1. Merges the training and the test sets to create one data set.
# To merge different data files, first rbind it and then cbind it.

# Read in the data of train folders
# Use file.data function for the path to a file
train_subjects <- read.table(file.path(path, "UCI HAR Dataset/train/subject_train.txt"))
train_data <- read.table(file.path(path, "UCI HAR Dataset/train/X_train.txt"))
train_activities <- read.table(file.path(path, "UCI HAR Dataset/train/y_train.txt"))


# Read in the data of test folders
test_subjects <- read.table(file.path(path, "UCI HAR Dataset/test/subject_test.txt"))
test_data <- read.table(file.path(path, "UCI HAR Dataset/test/X_test.txt"))
test_activities <- read.table(file.path(path, "UCI HAR Dataset/test/y_test.txt"))


## Look at the structure/properties of the above variables
str(train_subjects)
str(train_data)
str(train_activities)
str(test_subjects)
str(test_data)
str(test_activities)

## Combine the all tables by the rows together
row_data <- rbind(train_data, test_data)
row_activities <- rbind(train_activities, test_activities)
row_subjects <- rbind(train_subjects, test_subjects)

# Now combine all different columns together into one table
combined_data <- cbind(row_subjects, row_activities, row_data)

## 2. Extracts only the measurements on the mean and standard deviation for each measurement.

# Load features of the dataset

## Read features.txt file
features <- read.table(file.path(path, "UCI HAR Dataset/features.txt"))

## Extract only the mean and std (standard deviation) of measurements into the combined table.
mean_std_Features <- features[grep("-(mean|std)\\(\\)", features[, 2 ]), 2]
combined_data <- combined_data[, c(1, 2, mean_std_Features)]


## 3. Uses descriptive activity names to name the activities in the data set
# Load activity labels of the dataset where activity names are found.
## Read activity_label.txt file 
activityNames <- read.table(file.path(path, "UCI HAR Dataset/activity_labels.txt"))

# Update the activity names into the combined table
combined_data[, 2] <- activityNames[combined_data[,2], 2]

## 4. Appropriately labels the data set with descriptive variable names.

## Remove the brackets from the features columns
##measurements <- gsub("\\-|\\(|\\)", "", as.character(mean_std_Features))
measurements <- gsub("[()]", "", as.character(mean_std_Features))

## Name the column names of the combined data with "subjectNum", "activity" and features names found in measurements
colnames(combined_data) <- c("subjectNum", "activity", measurements)

## Now name the features labelled with descriptive variable names.

# Replace prefix t by time
names(combined_data)<-gsub("^t", "time", names(combined_data))

# Replace prefix f by frequency
names(combined_data)<-gsub("^f", "frequency", names(combined_data))

# Replace Gyro by Gyroscope
names(combined_data)<-gsub("Gyro", "Gyroscope", names(combined_data))

# Replace Acc by Accelerometer
names(combined_data)<-gsub("Acc", "Accelerometer", names(combined_data))

# Replace Mag by Magnitude
names(combined_data)<-gsub("Mag", "Magnitude", names(combined_data))

# Replace BodyBody by Body
names(combined_data)<-gsub("BodyBody", "Body", names(combined_data))

## Let's coerce the data of 2nd column - "activity" into strings
combined_data[, 2] <- as.character(combined_data[, 2])


## 5. From the data set in step 4, creates a second, independent tidy data set with 
## the average of each variable for each activity and each subject.

## Melt the data so we have a unique row for each combination of subject and activities
melted_data <- reshape2::melt(combined_data, id = c("subjectNum", "activity"))

# Cast the melted data getting the mean value.
mean_data <- reshape2::dcast(melted_data, subjectNum + activity ~ variable, fun.aggregate = mean)

# Write the data out to a file
write.table(mean_data, file=file.path("tidydata.txt"), row.names = FALSE, quote = FALSE)

