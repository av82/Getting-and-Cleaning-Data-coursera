#Codebook for Coursera Getting and Cleaning Data project

The codebook provides description about the source of data, description of the codes used in data sets and the files that are used for cleaning the data, files that provide details of features in datasets.

####Data Description:

[Description about the data](http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones)

####Data Source:

[Data Source Link used in the project](https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip)

###About the Data:

*From the data source website:*

The experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, we captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz. The experiments have been video-recorded to label the data manually. The obtained dataset has been randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data. 

The sensor signals (accelerometer and gyroscope) were pre-processed by applying noise filters and then sampled in fixed-width sliding windows of 2.56 sec and 50% overlap (128 readings/window). The sensor acceleration signal, which has gravitational and body motion components, was separated using a Butterworth low-pass filter into body acceleration and gravity. The gravitational force is assumed to have only low frequency components, therefore a filter with 0.3 Hz cutoff frequency was used. From each window, a vector of features was obtained by calculating variables from the time and frequency domain.

###Files in the project:

* train, test folders have corresponding data sets with three variables X, Y, Subjects.
* **train/X_train.txt:** training data.
* **train/y_train.txt:** training labels.
* **test/X_test.txt:** test data. 
* **test/y_test.txt:** test labels.
* **train/subject_train.txt:** a row referes to id of a subject in the sample.
* **features_info.txt**: provides info about various features, and methods used on the measurements from various sensors to reduce noise in data. 
* **features.txt: we use this file to rename the merged data set appropriately based on their indices from 1-561. 

Taken from README.txt file in UCI HAR Dataset:

The following files are available for the train and test data. Their descriptions are equivalent. 

- 'train/subject_train.txt': Each row identifies the subject who performed the activity for each window sample. Its range is from 1 to 30. 

- 'train/Inertial Signals/total_acc_x_train.txt': The acceleration signal from the smartphone accelerometer X axis in standard gravity units 'g'. Every row shows a 128 element vector. The same description applies for the 'total_acc_x_train.txt' and 'total_acc_z_train.txt' files for the Y and Z axis. 

- 'train/Inertial Signals/body_acc_x_train.txt': The body acceleration signal obtained by subtracting the gravity from the total acceleration. 

- 'train/Inertial Signals/body_gyro_x_train.txt': The angular velocity vector measured by the gyroscope for each window sample. The units are radians/second. 
 


###Label replacement:

* the column names that prefix with 't' are replaced with prefix 'Time'.
* the column names that prefix with 'f' are replaced with prefix 'Frequency'.
* the column names that prefix with 'Mag' are replaced with prefix 'Magnitude'.
* the column names that prefix with 'Acc' are replaced wtih prefix 'Acceleration'. 
* the column names that prefix with 'Gyro' are replaced wtih prefix 'AngularSpeed'. 
* the column names containing 'mean' are replaced with 'Mean'. 
* the column names containing 'std' are replaced with 'StandardDeviation'.

