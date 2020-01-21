# Getting and Cleaning Data - Course Project
This repository is created for the project of Getting and Cleaning Data course.
### Overview
The purpose of this project is to demonstrate the ability to collect, work with, and clean a data set. The goal is to prepare tidy data that can be used for later analysis.

4 items will be submitted in this repo :
1. README.md 
2. run_analysis.R 
3. CodeBook.md
4. tidydata.txt
### Data Information
The data used in this project was collected from 30 subjects who performed 6 activities with Samsung Galaxy S smartphone wore on the waist.  
The data for this project can be found here :
https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

### Script Information
The run_analysis.R script in this repository performs these 5 functions:
(The above data will first be downloaded and unzipped into R working directory.)
1. Merges the training and the test sets to create one data set. (Use command rbind to combine the training and test sets)
2. Extracts only the measurements on the mean and standard deviation for each measurement.
