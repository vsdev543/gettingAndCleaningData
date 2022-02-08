library(dplyr)
library(data.table)

# Getting data

if(!file.exists("data/README.txt")){
  if(!file.exists("data/raw.zip")) {
    url <-
      'https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip'
    download.file(url, "data/raw.zip", method = "curl")
  }
  unzip(zipfile = "data/raw.zip",exdir = "data/")
  file.copy(from = "data/UCI HAR Dataset/.",to = "data/",recursive = T)
  unlink("data/UCI HAR Dataset/",recursive = T)
}

# [data citation]: Davide Anguita, Alessandro Ghio, Luca Oneto, Xavier Parra and Jorge L. Reyes-Ortiz. A Public Domain Dataset for Human Activity Recognition Using Smartphones. 21th European Symposium on Artificial Neural Networks, Computational Intelligence and Machine Learning, ESANN 2013. Bruges, Belgium 24-26 April 2013.

# Reading Data
feat <- read.table("data/features.txt", col.names = c("n","functions"))
act <- read.table("data/activity_labels.txt", col.names = c("code", "activity"))

## Test set
sTest <- read.table("data/test/subject_test.txt", col.names = "subject")
xTest <- read.table("data/test/X_test.txt", col.names = feat$functions)
yTest <- read.table("data/test/y_test.txt", col.names = "activitycode")

## Train set
sTrain <- read.table("data/train/subject_train.txt", col.names = "subject")
xTrain <- read.table("data/train/X_train.txt", col.names = feat$functions)
yTrain <- read.table("data/train/y_train.txt", col.names = "activitycode")

# combine train and test data sets
x<-rbind(xTest,xTrain)
y<-rbind(yTest,yTrain)
s<-rbind(sTest,sTrain)

# merging x,y,s
m_df<-cbind(s,y,x)

# Selecting only necessary variables
df <- m_df %>% select(subject, activitycode, contains("mean"), contains("std"))

# Replacing activity number by the name of the activity
df$activitycode <- act[df$activitycode, 2]

# updating the name of the column activitycode to activity
names(df)[2]<-'activity'

# print(names(df))

# Replacing short words with descriptive names in variable names
names(df)<-gsub("Acc", "Accelerometer", names(df))
names(df)<-gsub("Gyro", "Gyroscope", names(df))
names(df)<-gsub("Mag", "Magnitude", names(df))
names(df)<-gsub("^t", "Time", names(df))
names(df)<-gsub("^f", "Frequency", names(df))
names(df)<-gsub("tBody", "TimeBody", names(df))

names(df)<-gsub("angle", "Angle", names(df))
names(df)<-gsub("gravity", "Gravity", names(df))

names(df)<-gsub("BodyBody", "Body", names(df))

names(df)<-gsub("-mean()", "Mean", names(df), ignore.case = TRUE)
names(df)<-gsub("-std()", "STD", names(df), ignore.case = TRUE)
names(df)<-gsub("-freq()", "Frequency", names(df), ignore.case = TRUE)

dfF <- df %>%
  group_by(subject, activity) %>%
  summarise_all(mean)

str(dfF)

