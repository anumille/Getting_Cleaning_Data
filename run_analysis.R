setwd("~/Documents/KMOC/Coursera/3_GettingCleaningData/Week3_assignment/UCI HAR Dataset")

#Merge the training and the test sets to create one data set.
#files already downloaded into working directory
#read the files
trainingSet <- read.table("./train/X_train.txt")
trainingLabel <- read.table("./train/y_train.txt")
trainingSubject <- read.table("./train/subject_train.txt")
testSet <- read.table("./test/X_test.txt")
testLabel <- read.table("./test/y_test.txt") 
testSubject <- read.table("./test/subject_test.txt")
#merge the files
mergeData <- rbind(trainingSet, testSet)
mergeLabel <- rbind(trainingLabel, testLabel)
mergeSubject <- rbind(trainingSubject, testSubject)
#run dim function on all data sets to confirm merging (all merged datasets have 10299 rows)
AllData <- cbind(mergeData, mergeLabel, mergeSubject)

#Extracts only the measurements on the mean and standard deviation for each measurement. 
AllData_mean<-sapply(AllData,mean,na.rm=TRUE)
AllData_std<-sapply(AllData,sd,na.rm=TRUE)
AllData_mean
AllData_std

#Uses descriptive activity names to name the activities in the data set
activityLabels <- read.table("./activity_labels.txt")
mergeLabel[,1] = activityLabels[mergeLabel[,1], 2]
colnames(mergeLabel) <- c("Activity")


#Appropriately labels the data set with descriptive variable names. 
colnames(mergeSubject)<- c("Subject")  #Labels the mergeSubject file's column as 'Subject'
features <- read.table("./features.txt") # reads in features list
colnames(mergeData)<-features$V2   # Labels the mergeData file's columns based on the second var in features

newData<- cbind(mergeSubject,mergeLabel,mergeData) #combines all three datasets together

#Create a second, independent tidy data set with the average of each variable for each activity and each subject. 

library(data.table)
dt<- data.table(newData)
avgData<- dt[, lapply(.SD, mean), by=c("Subject", "Activity")]
write.table(avgData,file="tidy.txt",sep=",",row.names = FALSE)