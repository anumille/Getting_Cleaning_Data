Introduction

This file describes the data, the variables, and the work that has been performed to clean up the data.

Source code run_analysis.R does the following:

    1. Downloads the data from UCI Machine Learning Repository
    2. Merges the original training and test data files into a single dataset
    3. Determines mean and standard deviation of all measurements
    4. Labels activity values in the dataset with descriptive activity names
    5. Appropriately labels the columns with descriptive names
    6. Creates a second, independent tidy dataset with an average of each variable for each each activity and each subject
        - for every unique combination of activity and subject, the average of variable is presented

Data
The experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, we captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz. The experiments have been video-recorded to label the data manually. The obtained dataset has been randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data. 

The sensor signals (accelerometer and gyroscope) were pre-processed by applying noise filters and then sampled in fixed-width sliding windows of 2.56 sec and 50% overlap (128 readings/window). The sensor acceleration signal, which has gravitational and body motion components, was separated using a Butterworth low-pass filter into body acceleration and gravity. The gravitational force is assumed to have only low frequency components, therefore a filter with 0.3 Hz cutoff frequency was used. From each window, a vector of features was obtained by calculating variables from the time and frequency domain. See 'features_info.txt' for more details. 

For each record it is provided:
- Triaxial acceleration from the accelerometer (total acceleration) and the estimated body acceleration.
- Triaxial Angular velocity from the gyroscope. 
- A 561-feature vector with time and frequency domain variables. 
- Its activity label. 
- An identifier of the subject who carried out the experiment.

The dataset includes the following files:

- 'README.txt'

- 'features_info.txt': Shows information about the variables used on the feature vector.

- 'features.txt': List of all features.

- 'activity_labels.txt': Links the class labels with their activity name.

- 'train/X_train.txt': Training set.

- 'train/y_train.txt': Training labels.

- 'test/X_test.txt': Test set.

- 'test/y_test.txt': Test labels.

The following files are available for the train and test data. Their descriptions are equivalent. 

- 'train/subject_train.txt': Each row identifies the subject who performed the activity for each window sample. Its range is from 1 to 30. 



Getting and cleaning data

The data files are downloaded to the working directory and read in using read.table
First, I merge the Training and Test data, the Training and Test label data, and the Training and Test label data into separate merged files.
Then all three merged files are combined into a single dataset called allData.
Throughout the merging process, I used the dim() function to ensure the correct total number of records were maintained.  With training and test data, there are 10,299 records.

After merging the data, the mean and standard deviation was calculated on each meaurement

Activity labels were replaced with descriptive activity names, defined in activity_labels.txt in the original data folder.
I named the single column in the mergedSubject file as 'Subject'
I renamed the single column in the merged training and test datasets using the features.txt 
A new dataset is created call 'newData' which has all 3 merged files together in a single tidy file

The final step is to create tidy data set with the average of each variable for each activity and each subject. Using the data.table library, I created a new table table with just the average measurements for each unique activity/subject combination.  The tidy data set is exported to the working directory with the new column headers.