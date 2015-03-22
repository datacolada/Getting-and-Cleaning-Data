# Codebook.md

## Variables in the tidy dataset (TidyDataSet.txt)
The final tidy data set (FinalTidyDataSet contained in file tidydataset.txt) has 15,480 observations and 4 variables comprising:
1.	"Subject" -> Subject identification number
2.	"Activity.Name" -> Name of the activity if the subject with values of:
•	WALKING
•	WALKING_UPSTAIRS
•	WALKING_DOWNSTAIRS
•	SITTING
•	STANDING
•	LAYING
3.	“Variable” -> 88 unique variables relating to mean and standard deviation
4.	“Value” -> Measures averaged by Activity.Name and Variable.

## The tidy dataset was compiled by:
1.	Assigning column names from features.txt to Xtest and Xtrain data, Activity to ytest and ytrain data, and Subject to subject_test and subject_train data.
2.	Column binding Xtrain, ytrain and subject_train data followed by
3.	Row binding Train and Test datasets
4.	Selecting only observations that relate to mean or standard deviation
5.	Converting the wide data set into a long data set
6.	Grouping the data set by Subject and Activity.Name and averaging the values
