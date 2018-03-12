

Getting and Cleaning Data Project
=================================

This Repository is for submission of the project for the Coursera (JHU's) - Getting and Cleaning Data course.

The purpose of this project is to demonstrate your ability to collect, work with, and clean a data set. The goal is to prepare tidy data that can be used for later analysis. 
This repo will contain:


1. an R script for getting and cleaning data 
1. a README.md file
1. a tidy data set as described below
1. a code book that describes the variables, the data, and any transformations or work that are performed to clean up the data called CodeBook.md. 

This repo explains how all of the scripts work and how they are connected.

### Overview

One of the most exciting areas in all of data science right now is wearable computing - see for example this [article](http://www.insideactivitytracking.com/data-science-activity-tracking-and-the-battle-for-the-worlds-top-sports-brand/)
The data linked to from the course website represent data collected from the accelerometers from the Samsung Galaxy S smartphone. A full description is available at the [site](http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones) where the data was obtained.

Here are the [data](https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip) for the project.


The R script called run_analysis.R does the following.

1. Download the dataset if it does not already exist in the working directory
1. Merges the training and the test sets to create one data set.
1. Extracts only the measurements on the mean and standard deviation for each measurement.
1. Uses descriptive activity names to name the activities in the data set
1. Appropriately labels the data set with descriptive variable names.
1. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.

In this repo, you will find README.md, run_analysis.R and CodeBook.md files.
Independent tidy data set called "tidydata.txt" is also uploaded in the repo.

### Additional Information
You can find additional information about the variables, data and transformations in the CodeBook.md file.

### Requirements
This code is written in  R (version 3.4.3), with RStudio (Version 1.1.423) in Windows 10 OS.

#### Author
Arun Chaudhary