## step: 1

dir()
x_test<-read.table("C:/Users/Heosh/Desktop/data/JHU_getting_and_cleaning_data/data/UCI HAR Dataset/test/X_test.txt")
y_test<-read.table("C:/Users/Heosh/Desktop/data/JHU_getting_and_cleaning_data/data/UCI HAR Dataset/test/Y_test.txt")
sub_test<-read.table("C:/Users/Heosh/Desktop/data/JHU_getting_and_cleaning_data/data/UCI HAR Dataset/test/subject_test.txt")
sub_train<-read.table("C:/Users/Heosh/Desktop/data/JHU_getting_and_cleaning_data/data/UCI HAR Dataset/train/subject_train.txt")
x_train <-read.table("C:/Users/Heosh/Desktop/data/JHU_getting_and_cleaning_data/data/UCI HAR Dataset/train/X_train.txt")
y_train <-read.table("C:/Users/Heosh/Desktop/data/JHU_getting_and_cleaning_data/data/UCI HAR Dataset/train/Y_train.txt")
activity <- read.table("C:/Users/Heosh/Desktop/data/JHU_getting_and_cleaning_data/data/UCI HAR Dataset/activity_labels.txt")
features <- read.table("C:/Users/Heosh/Desktop/data/JHU_getting_and_cleaning_data/data/UCI HAR Dataset/features.txt")


X <- rbind(x_test,x_train)
Y <- rbind(y_test,y_train)
sub <- rbind(sub_test,sub_train)
merge <- cbind(X,Y,sub)


## step: 2

nmean <- grep("mean", features$V2)
nstd <- grep("std", features$V2)

a <- c(nmean,nstd)
a <- sort(a)

tidydata <- merge[,a]

## step: 3



tidydata$activity <- activity$V2[Y$V1]


## step: 4

name <- features$V2[a]
colnames(tidydata) <- name

names(tidydata) <- gsub("^t", "Time", names(tidydata))
names(tidydata) <- gsub("-std()", "STD", names(tidydata), ignore.case = T)
names(tidydata) <- gsub("-mean()", "Mean", names(tidydata), ignore.case = T)



## step:5


tidydata2 <- cbind(tidydata,sub$V1)
names(tidydata2) <- c(names(tidydata),"Subject")
tidydata2 <- group_by(tidydata2, activity, Subject)



tidydata2 <- summarise_all (tidydata2, funs(mean))

       

## Saving


write.table(tidydata, "tidydata1.txt")
write.table(tidydata2, "tidydata2.txt")
