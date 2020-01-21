# Code Book Description
The code book is a document that describes the variables, the data, and any transformations or work that was performed to clean up the data.
### Data Source
The experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, we captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz. The experiments have been video-recorded to label the data manually. The obtained dataset has been randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data.

The sensor signals (accelerometer and gyroscope) were pre-processed by applying noise filters and then sampled in fixed-width sliding windows of 2.56 sec and 50% overlap (128 readings/window). The sensor acceleration signal, which has gravitational and body motion components, was separated using a Butterworth low-pass filter into body acceleration and gravity. The gravitational force is assumed to have only low frequency components, therefore a filter with 0.3 Hz cutoff frequency was used. From each window, a vector of features was obtained by calculating variables from the time and frequency domain.

### The Data
The data set includes data downloaded from the following files :
* 'X_train.txt': Training set
* 'y_train.txt': Training labels
* 'X_test.txt': Test set
* 'y_test.txt': Test labels
* 'subject_train.txt'
* 'subject_test.txt'
* 'activity_labels.txt'
* 'features.txt'

### The Variables
* Subject column is numbered from 1 to 30.
* Activity column has 6 types (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING)
* Only the variables from the mean and standard deviation are extracted for the tidy data set.
  1. mean()
  2. std()

### Transformation specifics
1. Merges the training and the test sets to create one data set. Source code 'run_analysis.R' merges both test and train data into one dataset.
2. Extracts only the measurements on the mean and standard deviation for each measurement. Source code'run_analysis.R' extracts the mean and standard deviation data into one dataset.
3. Uses descriptive activity names to name the activities in the data set. Source code'run_analysis.R' loads the activity labels.
4. Appropriately labels the data set with descriptive variable names. Source code'run_analysis.R' updates descriptive names to column names.
5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.  Source code'run_analysis.R' calculates the averages of the measurement columns and writes the output to a text file 'tidydata.txt'.
