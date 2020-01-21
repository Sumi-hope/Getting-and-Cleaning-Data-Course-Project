#run_analysis.R
#install.packages("dplyr")

library(dplyr)

#Download the files
if(!file.exists("./rawdata")) {dir.create("./rawdata")}
fileUrl <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
download.file(fileUrl, destfile = "./rawdata/cleandata.zip")

unzip(zipfile = "./rawdata/cleandata.zip")

#read train data
X_train <- read.table("./UCI HAR Dataset/train/X_train.txt")
Y_train <- read.table("./UCI HAR Dataset/train/y_train.txt")
Subject_train <- read.table("./UCI HAR Dataset/train/subject_train.txt")

#read test data
X_test <- read.table("./UCI HAR Dataset/test/X_test.txt")
Y_test <- read.table("./UCI HAR Dataset/test/y_test.txt")
Subject_test <- read.table("./UCI HAR Dataset/test/subject_test.txt")

#read features data
Features_data <- read.table("./UCI HAR Dataset/features.txt")

#read activity labels
Activity_labels <- read.table("./UCI HAR Dataset/activity_labels.txt")

#1. Merges the training and test sets to create one data set.
X_merge <- rbind(X_train, X_test)
Y_merge <- rbind(Y_train, Y_test)
Subject_merge <- rbind(Subject_train, Subject_test)

#2. Extracts only the measurements on the mean and standard deviation for each measurement
sel_var <- Features_data[grep("mean\\(\\)|std\\(\\)", Features_data[,2]),]
X_merge  <- X_merge[, sel_var[,1]]

#3. Uses descriptive activity names to name the activities in the data set
colnames(Y_merge) <- "activity"
Y_merge$activity_label <- factor(Y_merge$activity, labels = as.character(Activity_labels[,2]))
activity_label <- Y_merge[,-1]

#4. Appropriately labels the data set with descriptive variable names.
colnames(X_merge) <- Features_data[sel_var[,1],2]

#5. From the data set in step 4, create a second, independent tidy data set with the average
# of each variable for each activity and each subject.
colnames(Subject_merge) <- "subject"
Total <- cbind(X_merge, activity_label, Subject_merge)
Total_mean <- Total %>% group_by(activity_label, subject) %>% summarize_each(funs(mean))
write.table(Total_mean, file = "./UCI HAR Dataset/tidydata.txt", row.names = FALSE, col.names = TRUE)


