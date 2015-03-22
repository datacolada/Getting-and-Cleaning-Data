#run_analysis.R
## Load packages
library(plyr)
library(dplyr)
library(reshape2)

## Assign paths and filenames for files to be used
Path_featact <- "./UCI HAR Dataset"
Path_test <- "./UCI HAR Dataset/test"
Path_train <- "./UCI HAR Dataset/train"
File_feature <- "features.txt"
File_activity <- "activity_labels.txt"
File_Xtrain <- "X_train.txt"
File_ytrain <-  "y_train.txt"
File_subjecttrain <- "subject_train.txt"
File_Xtest <- "X_test.txt"
File_ytest <- "y_test.txt"
File_subjecttest <- "subject_test.txt"

## Establish full paths for all files to be read
Pathfile_feature <- paste(Path_featact, File_feature, sep="/")
Pathfile_activity <- paste(Path_featact, File_activity, sep="/")
Pathfile_Xtrain <- paste(Path_train, File_Xtrain, sep="/")
Pathfile_ytrain <- paste(Path_train, File_ytrain, sep="/")
Pathfile_subjecttrain <- paste(Path_train, File_subjecttrain, sep="/")
Pathfile_Xtest <- paste(Path_test, File_Xtest, sep="/")
Pathfile_ytest <- paste(Path_test, File_ytest, sep="/")
Pathfile_subjecttest <- paste(Path_test, File_subjecttest, sep="/")

## Read feature and activity files
Feature <- read.table(Pathfile_feature, header=FALSE, sep="")
Activity <- read.table(Pathfile_activity, header=FALSE, sep="")

## Read training files and assign column names
Xtrain <-read.table(Pathfile_Xtrain,header=FALSE,col.names=Feature[,2],sep="")

ytrain<-read.table(Pathfile_ytrain,header=FALSE,col.names="Activity",sep="")

subject_train<-read.table(Pathfile_subjecttrain, col.names="Subject", header=FALSE, sep="")

## Read test files and assign column names
Xtest <-read.table(Pathfile_Xtest,header=FALSE,col.names=Feature[,2],sep="")

ytest<-read.table(Pathfile_ytest,header=FALSE,col.names="Activity",sep="")

subject_test<-read.table(Pathfile_subjecttest, col.names="Subject", header=FALSE, sep="")

## Question1: Merges the training and the test sets to create one data set.

## Column bind train and subject data
MergeTrain <- cbind(Xtrain, ytrain, subject_train)

## Column bind test and subject data
MergeTest <- cbind(Xtest, ytest, subject_test)

## Row bind train and test data
MergeTrainTest <- rbind(MergeTrain, MergeTest)

## Question 2: Extracts only the measurements on the mean and standard deviation for each measurement

ExtractMeanStd <- MergeTrainTest%>%select (contains("mean"),contains("std"), contains("Subject"),contains("Activity"))

## Question 3: Use descriptive activity names to name the activities in the data set

activity <- read.table(Pathfile_activity, col.names = c("Activity","Activity.Name"), header = FALSE, comment.char = "")

DataActivityName <- join(ExtractMeanStd, activity, by = "Activity")

## Remove Activity as column not required
DataActivityName$Activity <- NULL

## Question 4: Appropriately labels the data set with descriptive variable names

## Substitute std with Std and mean with Mean for better variable names 
names(DataActivityName) <- gsub("std","Std",names(DataActivityName))
names(DataActivityName) <- gsub("mean","Mean",names(DataActivityName))
LabelledDataSet <- DataActivityName

## Question 5: From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.

## Convert wide format into narrow format 
TidyDataSet<-melt(LabelledDataSet,id=c("Subject","Activity.Name"))

## Group by columns and calculate mean for each group
FinalTidyDataSet <- TidyDataSet %>% group_by(Subject,Activity.Name,variable) %>% summarise_each(funs(mean), value)

## Write final tidy data set file for upload
write.table(FinalTidyDataSet,file="TidyDataSet.txt", row.name=FALSE)
