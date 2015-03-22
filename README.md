# Getting-and-Cleaning-Data
Getting and Cleaning Data Course Project

This project manipulates and creates a tidy data set from the UCI HAR Dataset resulting from experiments with 30 volunteers wearing a smartphone (Samsung Galaxy S II) on the waist. 

The readme file describes the steps to convert the data provided set into a tidy dataset following the principles of tidy dataset as stated in Hadley Wickhams paper at URL http://vita.had.co.nz/papers/tidy-data.pdf - “Tidy datasets are easy to manipulate, model and visualise, and have a specific structure: each variable is a column, each observation is a row, and each type of observational unit is a table.”

The final tidy data set is attached in the file named TidyDataSet.txt.
It contains 15,480 observations 4 variables. The measure value is a mean of variables grouped by Subject#, Activity Name, Variable (x, y and z attributes of 88 variables). 

# The project includes the files
•	'README.md': this file
•	'run_analysis.R': R script manipulating UCI HAR Dataset to answer the questions of the assignment
•	'CodeBook.md': The Code Book for the assignment.
•	'TidyDataSet.txt': The tidy data set resulting from final step of the assignment.

# Steps in the ‘run_analysis.R’
## 1. Setup and get organised
•	Assign full paths and filenames for files to be used in the UCI HAR Dataset
•	Load packages plyr, dplyr, reshape2

## 2. Read files and assign column names
•	Read feature and activity files
•	Read training files and assign column names
•	Read test files and assign column names

## 3. Merge Training and Test data sets
•	Column bind train and subject data
•	Column bind test and subject data
•	Row bind train and test data

## 4. Extract measurements on the mean and standard deviation 
•	Create data frame ExtractMeanStd

## 5. Use descriptive activity names 
•	Join Activity with ExtractMeanStd and remove Activity column

## 6. Appropriately labels the data set 
•	Substitute std with Std and mean with Mean for better variable names 
•	Creat LabelledDataSet 

## 7. Create tidy data set 
•	Convert wide format into long format 
•	Group by columns and calculate mean for each group
•	Create FinalTidyDataSet 
•	Write final tidy data set file for upload
