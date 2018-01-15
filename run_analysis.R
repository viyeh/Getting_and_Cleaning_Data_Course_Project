### 0. Initialize

# 0.1 Download data set
if(!file.exists("./data")){dir.create("./data")}
dataset_url <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
download.file(dataset_url, destfile = "./data/activity_data.zip")
unzip("./data/activity_data.zip", exdir = "./data")

# 0.2 Unzip data set
unzip(zipfile="./data/Dataset.zip",exdir="./data")

# 0.3 Load libraries
library(dplyr)



### 1. Merge training and test sets to create one data set

## 1.1 Read files

# 1.1.1 Read training set data, labels, subjects 
train_set <- read.table("data/UCI\ HAR\ Dataset/train/X_train.txt")
train_labels <- read.table("data/UCI\ HAR\ Dataset/train/y_train.txt")
subject_train <- read.table("data/UCI\ HAR\ Dataset/train/subject_train.txt")

# 1.1.2 Read test set data, labels, subjects 
test_set <- read.table("data/UCI\ HAR\ Dataset/test/X_test.txt")
test_labels <- read.table("data/UCI\ HAR\ Dataset/test/y_test.txt")
subject_test <- read.table("data/UCI\ HAR\ Dataset/test/subject_test.txt")

# 1.1.3 Read features data
features <- read.table("data/UCI\ HAR\ Dataset/features.txt")

# 1.1.4 Read activity labels
activity_labels <- read.table("data/UCI\ HAR\ Dataset/activity_labels.txt")


## 1.2 Make tidy data frames

# 1.2.1 Make tidy activity labels: column names
colnames(activity_labels) <- c("activity_id", "activity_name")

# 1.2.2 Make tidy train_set: column names and binding with train_labels and subject_train
colnames(train_set) <- features[,2]
colnames(train_labels)  <- "activity_id"
colnames(subject_train) <- "subject_id"
tidy_train_set <- cbind(train_labels, subject_train, train_set)

# 1.2.3 Make tidy test_set: column names and binding with test_labels and subject_test
colnames(test_set) <- features[,2]
colnames(test_labels)  <- "activity_id"
colnames(subject_test) <- "subject_id"
tidy_test_set <- cbind(test_labels, subject_test, test_set)


## 1.3 Merge tidy training and test sets
tidy_data_set <- rbind(tidy_train_set, tidy_test_set)



### 2. Extract only the measurements on the mean and standard deviation for each measurement

# 2.1 Identify columns with mean and standard deviation
measurements <- grep("mean|std", colnames(tidy_data_set), value = TRUE )

# 2.2 Subset these measurements from tidy_data_set
extract_mean_std <- tidy_data_set[ , measurements]

# 2.3 Add activity_id and subject_id
mean_std_data_set <- cbind(activity_id = tidy_data_set$activity_id, subject_id = tidy_data_set$subject_id, 
                           extract_mean_std)



### 3. Use descriptive activity names to name the activities in the data set
activity_mean_std_data_set <- merge(mean_std_data_set, activity_labels, by = "activity_id")



### 4. Appropriately label the data set with descriptive variable names
# done in step 1



### 5. From the data set in step 4, create a second, independent tidy data set 
### with the average of each variable for each activity and each subject

# 5.1 Make data set
average_per_activity_subject <- activity_mean_std_data_set %>%
                                group_by(subject_id, activity_id, activity_name) %>%
                                summarise_all(funs(mean))

# 5.2 Write data set in txt format
write.table(average_per_activity_subject, "average_per_activity_subject.txt", row.name = FALSE)





### end