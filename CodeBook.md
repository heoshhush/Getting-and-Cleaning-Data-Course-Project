


The run_analysis.R script performs the data preparation and then followed by the 5 steps required as described in the course project’s definition.



 
* Step : 1
Download the dataset & Assign each data to variables

x_test<-read.table("C:/Users/Heosh/Desktop/data/JHU_getting_and_cleaning_data/data/UCI HAR Dataset/test/X_test.txt")
y_test<-read.table("C:/Users/Heosh/Desktop/data/JHU_getting_and_cleaning_data/data/UCI HAR Dataset/test/Y_test.txt")
sub_test<-read.table("C:/Users/Heosh/Desktop/data/JHU_getting_and_cleaning_data/data/UCI HAR Dataset/test/subject_test.txt")
sub_train<-read.table("C:/Users/Heosh/Desktop/data/JHU_getting_and_cleaning_data/data/UCI HAR Dataset/train/subject_train.txt")
x_train <-read.table("C:/Users/Heosh/Desktop/data/JHU_getting_and_cleaning_data/data/UCI HAR Dataset/train/X_train.txt")
y_train <-read.table("C:/Users/Heosh/Desktop/data/JHU_getting_and_cleaning_data/data/UCI HAR Dataset/train/Y_train.txt")
activity <- read.table("C:/Users/Heosh/Desktop/data/JHU_getting_and_cleaning_data/data/UCI HAR Dataset/activity_labels.txt")
features <- read.table("C:/Users/Heosh/Desktop/data/JHU_getting_and_cleaning_data/data/UCI HAR Dataset/features.txt")


Merges the training and the test sets to create one data set
X (10299 rows, 561 columns) is created by merging x_train and x_test using rbind() function
Y (10299 rows, 1 column) is created by merging y_train and y_test using rbind() function
Sub (10299 rows, 1 column) is created by merging sub_train and sub_test using rbind() function
merge (10299 rows, 563 column) is created by merging Subject, Y and X using cbind() function


* step : 2

I used 'grep' to get the location of features that contains string "mean" and "std". 
after this step, I can get "tidydata"(only the measurements on the mean and standard deviation for each measurement)
through that location; nmean, nstd


* step : 3

To "Uses descriptive activity names to name the activities in the data set",
Extract entire numbers in V1 column of the Y, and corresponded it to "activity" 

* step : 4


to appropriately labels the data set with descriptive variable names, extract names from features. and assigned these names into 
colnames of tidydata. also, there are few correction steps using 'gsub'

* step : 5

before perforimng this step, i saved dataset "tidydata.1" 

from the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject
tidyadata2 is created by sumarizing TidyData taking the means of each variable for each activity and each subject, after groupped by subject and activity.
Export it into tidydata2.txt file.
