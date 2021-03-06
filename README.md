## Getting and Cleaning Data - Course Project

This repository hosts the R code and documentation files for the Data Science's track course "Getting and Cleaning data", available in coursera.

The dataset name is Human Activity Recognition Using Smartphones.

CodeBook.md describes the variables, the data, and any transformations or work that was performed to clean up the data.

run_analysis.R contains all the code to perform the analyses described in the 5 steps, this file can imported in Rstudio.

The output is called tidy_data.txt;

The script performs the following steps:

1 - Load the train and test files into variables using read.table function and assign the variables to dataframes. 

2 - Add column names for subject files, measurement files and label files before merge all files into one dataset using cbind and rbind functions.

3 - Get only the collumns that contains "mean()" or "std()" using  grepl, making sure to keep the first two columns (activity and features) in the data set.

4 - Converts the activity column from integer to factor associating the activity labels to its own respective numbers.

5 - Load reshape2 library to use melt and cast functions to create the final dataset.
