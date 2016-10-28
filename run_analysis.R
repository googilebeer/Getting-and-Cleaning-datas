#download and unzip files
if(!file.exists("./data")){dir.create("./data")}
fileUrl <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
download.file(fileUrl,destfile="./data/Dataset.zip",method="curl")
unzip(zipfile="./data/Dataset.zip",exdir="./data")

#open relevant packages
library(data.table)
library(dplyr)

#load in data
features <- read.table("UCI HAR Dataset/features.txt")
activity_labels <- read.table("UCI HAR Dataset/activity_labels.txt")

train_set <- read.table("UCI HAR Dataset/train/X_train.txt", header = FALSE)
train_labels <- read.table("UCI HAR Dataset/train/y_train.txt", header = FALSE)
subject_train_id <- read.table("UCI HAR Dataset/train/subject_train.txt", header = FALSE)

test_set <- read.table("UCI HAR Dataset/test/x_test.txt", header = FALSE)
test_labels <- read.table("UCI HAR Dataset/test/y_test.txt", header = FALSE)
subject_test_id <- read.table("UCI HAR Dataset/test/subject_test.txt", header = FALSE)

#name the columns
colnames(train_set) <- features[,2]
colnames(train_labels) <- "Labels"
colnames(subject_train_id) <- "Subjectid"
colnames(test_set) <- features[,2]
colnames(test_labels) <- "Labels"
colnames(subject_test_id) <- "Subjectid"

#merge all data sets
merged_train <- cbind(subject_train_id, train_labels, train_set)
merged_test <- cbind(subject_test_id, test_labels, test_set)
mergeddata <- rbind(merged_train, merged_test)

#extract required measurements(mean and sd) to leave completed data set with studentid & labels attached
measurements<- grep(".*mean.*|.*std.*|.*subjectid.*|.*labels.*", names(mergeddata), ignore.case = TRUE, value= TRUE)
completedata <- mergeddata[measurements]

#change labels to associated activity discription
completedata$Labels[completedata$Labels == "1"] <- "walking"
completedata$Labels[completedata$Labels == "2"] <- "walking upstairs"
completedata$Labels[completedata$Labels == "3"] <- "walking downstairs"
completedata$Labels[completedata$Labels == "4"] <- "sitting"
completedata$Labels[completedata$Labels == "5"] <- "standing"
completedata$Labels[completedata$Labels == "6"] <- "laying"

#relabel data set with descriptive variable names
names(completedata)<-gsub("^t", "Total", names(completedata))
names(completedata)<-gsub("Acc", "Acceleration", names(completedata))
names(completedata)<-gsub("mean", "Mean", names(completedata))
names(completedata)<-gsub("std", "STD", names(completedata))
names(completedata)<-gsub("Gyro", "Gyroscope", names(completedata))
names(completedata)<-gsub("Mag", "Magnitude", names(completedata))
names(completedata)<-gsub("^f", "Frequency", names(completedata))
names(completedata)<-gsub("BodyBody", "Body", names(completedata))
names(completedata)<-gsub("angle", "Angle", names(completedata))
names(completedata)<-gsub("gravity", "Gravity", names(completedata))

#create independent tidy data set with the average of each variable for each subject and activity. order according to Subjectid first then activity labels
Tidydata <- aggregate(.~Subjectid +Labels, completedata, mean)
Tidydata <- Tidydata[order(Tidydata$Subjectid,Tidydata$Label),]

#create tidydata text file
write.table(Tidydata, file = "Tidydata.txt", row.names = FALSE)
