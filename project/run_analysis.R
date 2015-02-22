library(plyr)
library(dplyr)
library(reshape2)




#download the files specified in the project.
readData=function(){
  if(!file.exists("data")){
    dir.create("data")
  }
  if(!file.exists("data/UCI HAR Dataset")){
    fileUrl<-"https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
    download.file(fileUrl,destfile = "data/UCI_HAR_data.zip",method="curl")
    unzip("data/UCI_HAR_data.zip",exdir="data")
  }
  
}


#1. Merges the training and the test sets to create one data set.
# function to read train, test data sets for (x,y,subjects)
# merge the data sets by x, y, subjects to construct the sensor data
mergeData=function(){
  train_x<-read.table("data/UCI HAR Dataset/train/X_train.txt")
  train_y<-read.table("data/UCI HAR Dataset/train/y_train.txt")
  train_subject<-read.table("data/UCI HAR Dataset/train/subject_train.txt")
  
  test_x<-read.table("data/UCI HAR Dataset/test/X_test.txt")
  test_y<-read.table("data/UCI HAR Dataset/test/y_test.txt")
  test_subject<-read.table("data/UCI HAR Dataset/test/subject_test.txt")
  
  merged_x<-rbind(test_x,train_x)
  merged_y<-rbind(test_y,train_y)
  merged_subs<-rbind(test_subject,train_subject)
  
  merged_sensor_data<-list(subject=merged_subs,y=merged_y,x=merged_x)
  return(merged_sensor_data)
}

#2 Extracts only the measurements on the mean and standard deviation for each measurement. 
extractData=function(x_data){
  features <- read.table("data/UCI HAR Dataset/features.txt")
  mean_column <- sapply(features[,2], function(x) grepl("mean", x, fixed=T))
  std_column <- sapply(features[,2], function(x) grepl("std", x, fixed=T))
  filtered_x_data <- x_data[, (mean_column | std_column)]
  colnames(filtered_x_data) <- features[(mean_column | std_column), 2]
  return(filtered_x_data)
}

#3. Uses descriptive activity names to name the activities in the data set
#read the activity labels and replce activityids with activity labels
setActivityNames=function(y_data){
  activityLabels = read.table("data/UCI HAR Dataset/activity_labels.txt")
  activityCount = 1
  for (label in activityLabels$V2) {
    y_data$activity <- gsub(activityCount, label, y_data$activity)
    activityCount <- activityCount + 1
  }
  return(y_data)
}

#4. Appropriately labels the data set with descriptive variable names.
#provide appropriate names for data set
setNames=function(merged_sensor_data){
  names(merged_sensor_data)<-gsub('^t',"Time",names(merged_sensor_data))
  names(merged_sensor_data) <- gsub('^f',"Frequency.",names(merged_sensor_data))
  names(merged_sensor_data) <- gsub('Mag',"Magnitude",names(merged_sensor_data))
  names(merged_sensor_data) <- gsub('Acc',"Acceleration",names(merged_sensor_data))
  names(merged_sensor_data) <- gsub('Gyro',"AngularSpeed",names(merged_sensor_data))
  names(merged_sensor_data) <- gsub('\\.mean',".Mean",names(merged_sensor_data))
  names(merged_sensor_data) <- gsub('\\.std',".StandardDeviation",names(merged_sensor_data))
  return(merged_sensor_data)
}


#From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.
#take mean for each variable for each activity and each subject using ddply
getTidyData=function(namedData){
  tidyData = ddply(namedData, c("subject","activity"), numcolwise(mean))
  write.table(tidyData, file = "tidy_data.txt",row.name=FALSE)
}


#run the functions in order 

readData()
mergedData<-mergeData()
extractedData<-extractData(mergedData$x)
colnames(mergedData$y)<-'activity'
mergedData$y<-setActivityNames(mergedData$y)
colnames(mergedData$subject)<-c('subject')
new_merged_Data<-cbind(extractedData,mergedData$y,mergedData$subject)
orderdData<-setNames(new_merged_Data)
getTidyData(orderdData)