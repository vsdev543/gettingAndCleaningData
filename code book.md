# gettingAndCleaningData
The Script, run_analysis is created to download and prepare the data.

## Downloading data

Dataset used for the project can be found on https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

A full description is available at the site where the data was obtained:
http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones 

References: Davide Anguita, Alessandro Ghio, Luca Oneto, Xavier Parra and Jorge L. Reyes-Ortiz. A Public Domain Dataset for Human Activity Recognition Using Smartphones. 21th European Symposium on Artificial Neural Networks, Computational Intelligence and Machine Learning, ESANN 2013. Bruges, Belgium 24-26 April 2013.

## Preperation of data for the analysis

### Getting Data into R
+ Features
  + Features are generated from the accelerometer and gyroscope. 3 axial raw signals are used, tAcc-XYZ and tGyro-XYZ.
  + Read data as a dataframe from file 'data/features.txt' and assign to variable 'feat' (Line-22:23).
  + 561 rows, 2 columns
+ Activity labels
  + Corresponding label for the activity codes.
  + Read data as a dataframe from file 'data/activity_labels.txt' and assign to variable 'act' (Line-24:25).
  + 6 rows, 2 columns
+ Test data
  + Subjects of the test data are read from the file "data/test/subject_test.txt" as a data frame and assigned to variable 'sTest' (line-28:29, 2947 rows, 1 column)
  + Test data are read from the file "data/test/X_test.txt" as a dataframe and assign to variable 'xTest' (line-30:31, 2947 rows, 1 column).
  + Activities related to each observation are read from "data/test/y_test.txt" as a dataframe and assign to variable'yTest' (line-32:33, 2947 rows, 1 column).
+ Train Data
  + Subjects of the train data are read from the file "data/train/subject_train.txt" as a data frame and assigned to variable 'sTrain' (line-36:37, 7352 rows, 1 column)
  + Train data are read from the file "data/train/X_train.txt" as a dataframe and assign to variable 'xTrain' (line-38:39, 7352 rows, 1 column).
  + Activities related to each observation are read from "data/train/y_train.txt" as a dataframe and assign to variable 'yTrain' (line-40:41, 7352 rows, 1 column).
  
### 






