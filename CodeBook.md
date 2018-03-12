

Getting and Cleaning Data Project
=================================

A code book that describes the variables, the data, and any transformations or work that is performed to clean up the data.
Information about the variables, data and transformations is used in the course project for JHU's Getting and Cleaning Data course.

### Source Data
The data linked to from the course website represent data collected from the accelerometers from the Samsung Galaxy S smartphone. A full description is available at the [site](http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones) where the data was obtained.


Data can be downloaded from [here](https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip)

#### Downloaded datset contains following files.
    [1] "activity_labels.txt"                         
    [2] "features.txt"
    [3] "features_info.txt"
    [4] "README.txt"
    [5] "test/Inertial Signals/body_acc_x_test.txt"
    [6] "test/Inertial Signals/body_acc_y_test.txt"
    [7] "test/Inertial Signals/body_acc_z_test.txt"
    [8] "test/Inertial Signals/body_gyro_x_test.txt"
    [9] "test/Inertial Signals/body_gyro_y_test.txt"
    [10] "test/Inertial Signals/body_gyro_z_test.txt"
    [11] "test/Inertial Signals/total_acc_x_test.txt"
    [12] "test/Inertial Signals/total_acc_y_test.txt"
    [13] "test/Inertial Signals/total_acc_z_test.txt"
    [14] "test/subject_test.txt"
    [15] "test/X_test.txt"
    [16] "test/y_test.txt"
    [17] "train/Inertial Signals/body_acc_x_train.txt"
    [18] "train/Inertial Signals/body_acc_y_train.txt"
    [19] "train/Inertial Signals/body_acc_z_train.txt"
    [20] "train/Inertial Signals/body_gyro_x_train.txt"
    [21] "train/Inertial Signals/body_gyro_y_train.txt"
    [22] "train/Inertial Signals/body_gyro_z_train.txt"
    [23] "train/Inertial Signals/total_acc_x_train.txt"
    [24] "train/Inertial Signals/total_acc_y_train.txt"
    [25] "train/Inertial Signals/total_acc_z_train.txt"
    [26] "train/subject_train.txt"
    [27] "train/X_train.txt"
    [28] "train/y_train.txt"


#### Summary of dataset

The experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, we captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz. The experiments have been video-recorded to label the data manually. The obtained dataset has been randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data. 

The sensor signals (accelerometer and gyroscope) were pre-processed by applying noise filters and then sampled in fixed-width sliding windows of 2.56 sec and 50% overlap (128 readings/window). The sensor acceleration signal, which has gravitational and body motion components, was separated using a Butterworth low-pass filter into body acceleration and gravity. The gravitational force is assumed to have only low frequency components, therefore a filter with 0.3 Hz cutoff frequency was used. From each window, a vector of features was obtained by calculating variables from the time and frequency domain. 


#### For each record it is provided:


- Triaxial acceleration from the accelerometer (total acceleration) and the estimated body acceleration.
- Triaxial Angular velocity from the gyroscope. 
- A 561-feature vector with time and frequency domain variables. 
- Its activity label. 
- An identifier of the subject who carried out the experiment.

#### Creating the tidy data file

1. First download the zipped dataset from the link given above, unzip it, read readme file, activity_labels, features, features_info files and check data files in each of the folders.
1. Downloading of file and unzip can be done manually or through coding
1. tidying of dataset will require dplyr package or reshape2 package or (others package for ease). So install if not already installed. 
1. In this code, "reshape2" package is used for data tidying
1. Merge training and test sets to create one data set.
    1. Read data of subject_train, X_train, y_train, subject_test, X_test, y_test separately.
    1. Combine training and test sets by rows for subject_train and subject_test, X_train and X_test, y_train and y_test separately.
    1. Combine them by columns to make one dataset.

 
#### Data Cleaning
1. Extract only the mean and std (standard deviation) of features.
1. Clean column names of the dataset using gsub function. Remove the brackets () from the features columns.
1. Name the column names of the merged data with "subjectNum", "activity" and features names
1. Name the features labelled with descriptive variable names, replacing prefixes with appropriate labels. For example: Replace prefix t by time, Replace Gyro by Gyroscope etc.


#### Create independent tidy data set 
Find the average of each variable for each activity and each subject.
1. Using "reshape2" package, Melt the data to have a unique row for each combination of subject and activities
1. Using "reshape2" package, Cast the melted data getting the mean value.
1. Write the data out to a file "tidydata.txt"


#### Variables in the tidydata.txt file
General description of the file including:
 - Dimensions of the dataset
 - Summary of the data
 - Variables present in the dataset
 
1. It contains 180 observations of 68 variables.
1. Variable names of tinydata.txt
  
  [1] "subjectNum"                                   "activity"                                    
  [3] "timeBodyAccelerometer.mean.X"                 "timeBodyAccelerometer.mean.Y"                
  [5] "timeBodyAccelerometer.mean.Z"                 "timeBodyAccelerometer.std.X"                 
  [7] "timeBodyAccelerometer.std.Y"                  "timeBodyAccelerometer.std.Z"                 
  [9] "timeGravityAccelerometer.mean.X"              "timeGravityAccelerometer.mean.Y"             
  [11] "timeGravityAccelerometer.mean.Z"              "timeGravityAccelerometer.std.X"              
  [13] "timeGravityAccelerometer.std.Y"               "timeGravityAccelerometer.std.Z"              
  [15] "timeBodyAccelerometerJerk.mean.X"             "timeBodyAccelerometerJerk.mean.Y"            
  [17] "timeBodyAccelerometerJerk.mean.Z"             "timeBodyAccelerometerJerk.std.X"             
  [19] "timeBodyAccelerometerJerk.std.Y"              "timeBodyAccelerometerJerk.std.Z"             
  [21] "timeBodyGyroscope.mean.X"                     "timeBodyGyroscope.mean.Y"                    
  [23] "timeBodyGyroscope.mean.Z"                     "timeBodyGyroscope.std.X"                     
  [25] "timeBodyGyroscope.std.Y"                      "timeBodyGyroscope.std.Z"                     
  [27] "timeBodyGyroscopeJerk.mean.X"                 "timeBodyGyroscopeJerk.mean.Y"                
  [29] "timeBodyGyroscopeJerk.mean.Z"                 "timeBodyGyroscopeJerk.std.X"                 
  [31] "timeBodyGyroscopeJerk.std.Y"                  "timeBodyGyroscopeJerk.std.Z"                 
  [33] "timeBodyAccelerometerMagnitude.mean"          "timeBodyAccelerometerMagnitude.std"          
  [35] "timeGravityAccelerometerMagnitude.mean"       "timeGravityAccelerometerMagnitude.std"       
  [37] "timeBodyAccelerometerJerkMagnitude.mean"      "timeBodyAccelerometerJerkMagnitude.std"      
  [39] "timeBodyGyroscopeMagnitude.mean"              "timeBodyGyroscopeMagnitude.std"              
  [41] "timeBodyGyroscopeJerkMagnitude.mean"          "timeBodyGyroscopeJerkMagnitude.std"          
  [43] "frequencyBodyAccelerometer.mean.X"            "frequencyBodyAccelerometer.mean.Y"           
  [45] "frequencyBodyAccelerometer.mean.Z"            "frequencyBodyAccelerometer.std.X"            
  [47] "frequencyBodyAccelerometer.std.Y"             "frequencyBodyAccelerometer.std.Z"            
  [49] "frequencyBodyAccelerometerJerk.mean.X"        "frequencyBodyAccelerometerJerk.mean.Y"       
  [51] "frequencyBodyAccelerometerJerk.mean.Z"        "frequencyBodyAccelerometerJerk.std.X"        
  [53] "frequencyBodyAccelerometerJerk.std.Y"         "frequencyBodyAccelerometerJerk.std.Z"        
  [55] "frequencyBodyGyroscope.mean.X"                "frequencyBodyGyroscope.mean.Y"               
  [57] "frequencyBodyGyroscope.mean.Z"                "frequencyBodyGyroscope.std.X"                
  [59] "frequencyBodyGyroscope.std.Y"                 "frequencyBodyGyroscope.std.Z"                
  [61] "frequencyBodyAccelerometerMagnitude.mean"     "frequencyBodyAccelerometerMagnitude.std"     
  [63] "frequencyBodyAccelerometerJerkMagnitude.mean" "frequencyBodyAccelerometerJerkMagnitude.std" 
  [65] "frequencyBodyGyroscopeMagnitude.mean"         "frequencyBodyGyroscopeMagnitude.std"         
  [67] "frequencyBodyGyroscopeJerkMagnitude.mean"     "frequencyBodyGyroscopeJerkMagnitude.std"  


#### Summary of Variables of tidydata

1. subjectNum : int   (1 to 6)
1. activity : Factor with 6 levels (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING)
1. All others variables describe a features with mean value: num


#### Author
Arun Chaudhary

