# Codebook



##	Source data

[Human Activity Recognition Using Smartphones Data Set](https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip)

A full description is available at the [site](http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones) where the data was obtained.



##	R script : run_analysis.R

In the beginning the data are downloaded and unzipped and the necessary libraries for the analysis are loaded.

0. Initialize
    1. Download data set
    2. Unzip data set
    3. Load libraries


The 5 steps as described in the course project are followed :

1.	Merge training and test sets to create one data set
    1. Read files
        1.	Read training set data, labels, subjects
        2.	Read test set data, labels, subjects
        3.	Read features data
        4.	Read activity labels
    2.	Make tidy data frames
        1.	Make tidy activity labels: column names
    	2.  Make tidy train_set: column names and binding with train_labels and subject_train
        3.  Make tidy test_set: column names and binding with test_labels and subject_test
    3.	Merge tidy training and test sets

2.	Extract only the measurements on the mean and standard deviation for each measurement
    1.	Identify columns with mean and standard deviation
    2.	Subset these measurements from tidy_data_set
    3.	Add activity_id and subject_id

3.	Use descriptive activity names to name the activities in the data set

4.	Appropriately label the data set with descriptive variable names

5.	From the data set in step 4, create a second, independent tidy data set 
    1.	with the average of each variable for each activity and each subject
    2.	Make data set
    3.	Write data set in txt format



##	Variables

### Input data

* train_set : Training set (data from 70% of the volunteers)
* train_labels : Training labels
* subject_train : Each row identifies the subject who performed the activity for each window sample. Its range is from 1 to 30. 
* test_set : Test set (data from 30% of the volunteers)
* test_labels : Test labels
* subject_test : Each row identifies the subject who performed the activity for each window sample. Its range is from 1 to 30.
* features : List of all features
* activity_labels : Links the class labels with their activity name


(features are normalized and bounded within [-1,1])


### Output data : average_per_activity_subject.txt

#### Identifiers

* subject_id : Each row identifies the subject who performed the activity for each window sample. Its range is from 1 to 30.
* activity_id : The type of activity performed when the corresponding measurements were taken

#### Activity Labels

* activity_name: WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING

#### Measurements

* tBodyAcc-mean()-X
* tBodyAcc-mean()-Y
* tBodyAcc-mean()-Z
* tBodyAcc-std()-X
* tBodyAcc-std()-Y              
* tBodyAcc-std()-Z
* tGravityAcc-mean()-X           
* tGravityAcc-mean()-Y
* tGravityAcc-mean()-Z           
* tGravityAcc-std()-X
* tGravityAcc-std()-Y            
* tGravityAcc-std()-Z
* tBodyAccJerk-mean()-X          
* tBodyAccJerk-mean()-Y
* tBodyAccJerk-mean()-Z          
* tBodyAccJerk-std()-X
* tBodyAccJerk-std()-Y           
* tBodyAccJerk-std()-Z
* tBodyGyro-mean()-X             
* tBodyGyro-mean()-Y
* tBodyGyro-mean()-Z             
* tBodyGyro-std()-X
* tBodyGyro-std()-Y              
* tBodyGyro-std()-Z
* tBodyGyroJerk-mean()-X         
* tBodyGyroJerk-mean()-Y
* tBodyGyroJerk-mean()-Z         
* tBodyGyroJerk-std()-X
* tBodyGyroJerk-std()-Y
* tBodyGyroJerk-std()-Z
* tBodyAccMag-mean()
* tBodyAccMag-std()
* tGravityAccMag-mean()          
* tGravityAccMag-std()
* tBodyAccJerkMag-mean()         
* tBodyAccJerkMag-std()
* tBodyGyroMag-mean()           
* tBodyGyroMag-std()
* tBodyGyroJerkMag-mean()        
* tBodyGyroJerkMag-std()
* fBodyAcc-mean()-X              
* fBodyAcc-mean()-Y
* fBodyAcc-mean()-Z              
* fBodyAcc-std()-X
* fBodyAcc-std()-Y               
* fBodyAcc-std()-Z
* fBodyAcc-meanFreq()-X          
* fBodyAcc-meanFreq()-Y
* fBodyAcc-meanFreq()-Z          
* fBodyAccJerk-mean()-X
* fBodyAccJerk-mean()-Y          
* fBodyAccJerk-mean()-Z
* fBodyAccJerk-std()-X           
* fBodyAccJerk-std()-Y
* fBodyAccJerk-std()-Z           
* fBodyAccJerk-meanFreq()-X
* fBodyAccJerk-meanFreq()-Y
* fBodyAccJerk-meanFreq()-Z
* fBodyGyro-mean()-X             
* fBodyGyro-mean()-Y
* fBodyGyro-mean()-Z             
* fBodyGyro-std()-X
* fBodyGyro-std()-Y              
* fBodyGyro-std()-Z
* fBodyGyro-meanFreq()-X
* fBodyGyro-meanFreq()-Y
* fBodyGyro-meanFreq()-Z
* fBodyAccMag-mean()
* fBodyAccMag-std()
* fBodyAccMag-meanFreq()
* fBodyBodyAccJerkMag-mean()
* fBodyBodyAccJerkMag-std()
* fBodyBodyAccJerkMag-meanFreq()
* fBodyBodyGyroMag-mean()
* fBodyBodyGyroMag-std()
* fBodyBodyGyroMag-meanFreq()
* fBodyBodyGyroJerkMag-mean()
* fBodyBodyGyroJerkMag-std()
* fBodyBodyGyroJerkMag-meanFreq()




