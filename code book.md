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
  
### Merging train and test data

1. Step 1
	+ 'xTrain' and 'xTest' are combined to make variable 'x' (Line-44,10299 rows, 561 columns)
	+ 'yTrain' and 'yTest' are combined to make variable 'y' (Line-45,10299 rows, 561 columns)
	+ 'sTrain' and 'sTest' are combined to make variable 'z (Line-45,10299 rows, 561 columns)

2. Step 2
	+ merging x, y, z and assigning to new variable 'm_df' (Line-49 ,10299 rows, 563 columns).

### Extracting variables which represent a mean or standard deviation, activities and subject

+ Variable subject, activitycode and variables which has the word "mean" or "std" are selected and assigned to the variable 'df' (Line-52:53, 10299 rows, 88 columns).

### Replacing the activity code with activity label

+ variable 'activitycode' in the dataframe df is replaced with the relevant lavel in 'act' table which represent activities (Line-56:59) and the name of the variable is set as 'activity'.

### Appropriately labelling the data set

+ Data set is re-labeled with descriptive names.
+ All abbriverbs identified are replaced with the descriptive name.
	+ "Acc" -> "Accelerometer"
	+ "Gyro" -> "Gyroscope"
	+ "Mag" -> "Magnitude"
	+ "^t" -> "Time"
		+ Using regular expression to find words start with 't'
	+ "^f" -> "Frequency"
		+ Using regular expression to find words start with 'f'
	+ "tBody" -> "TimeBody"
	+ "angle" -> "Angle"
	+ "gravity" -> "Gravity"
	+ "BodyBody" -> "Body"
	+ "-mean()" -. "Mean"
		+ Using regular expression to find words which has ''-mean'
	+ "-std()" -> "STD"
		+ + Using regular expression to find words which has ''-std'

### Generating the final data frame
+ Data are grouped by 'subject' and 'activity'
+ mean of the each column for pair is calculated
	+ Line-81:83



	


