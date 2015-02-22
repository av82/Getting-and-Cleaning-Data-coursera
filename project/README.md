#Coursera -Getting and Cleaning Data

##Project:

###Getting Data:

 The companies like Fitbit, Nike, and Jawbone Up are racing to develop the most advanced algorithms to attract new users. The data to work on represents data collected from the accelerometers from the Samsung Galaxy S smartphone. A full description is available at the site where the data was obtained: 

####Data Description:

[Description about the data](http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones)

####Data Source:

[Data Source Link used in the project](https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip)

### Cleaning, merging data (run_analysis.R script description)

*The script run_analysis.R loads plyr, dplyr, reshape2 libraries.
* **readData()**: The method creates a data directory if there is not one, downloads the data from the **Data Source** 
* **mergeData()**: The downloaded data is read into corresponding tables (x,y,subject from train, test data sets). The data is merged into a single data frame by merging train, test data sets.
* **extractData()**: The X variable is subsetted and filtered such that only **mean**, **standard deviation** columns are considered.
* **setActivityNames()**: The method takes Y data frame, renames the activitiy codes with appropriate activity labels using the activity_labels.txt. 
* **setNames()**: The method uses pattern matcher, replacer funtion gsub to appropriately label the data sets with descriptive variable names. 
* **getTidyData()**: After the step of naming the variables with descriptive labels, the mean is computed for each variable for each activity and each subject using ddply. The result is written to file **tidy_data.txt**.

