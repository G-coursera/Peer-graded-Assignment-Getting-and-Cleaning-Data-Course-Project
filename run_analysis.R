setwd("C:/Coursera Code/03/Week 4/Project")

##Obtaining Data
fileurl1 <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
download.file(fileurl1,destfile="data1.zip")
unzip("data1.zip")
test_folder <- "C:/Coursera Code/03/Week 4/Project/UCI HAR Dataset/test/"
train_folder <- "C:/Coursera Code/03/Week 4/Project/UCI HAR Dataset/train/"

train_data <- read.table(paste0(train_folder,"X_train.txt"))
train_labels <- read.table(paste0(train_folder,"y_train.txt"))
train_subject <- read.table(paste0(train_folder,"subject_train.txt"))

test_data <- read.table(paste0(test_folder,"X_test.txt"))
test_labels <- read.table(paste0(test_folder,"y_test.txt"))
test_subject <- read.table(paste0(test_folder,"subject_test.txt"))

features <- read.table("C:/Coursera Code/03/Week 4/Project/UCI HAR Dataset/features.txt")
activity_labels <- read.table("C:/Coursera Code/03/Week 4/Project/UCI HAR Dataset/activity_labels.txt")
activity_labels <- activity_labels[,2]

##1.	Merging the training and the test sets to create one data set. 
merged_subject <- merge(train_subject,test_subject, all=TRUE,sort=FALSE)
colnames(merged_subject) <- "volunteer"

mergeddata <- merge(train_data,test_data, all=TRUE,sort=FALSE)

##2.	Extracting only the measurements on the mean and standard deviation for each measurement. 
mean_indices <- grep("(.*)mean(.*)|(.*)std(.*))",features[,2] )     #Getting indices for mean and std stats
mergeddata <- mergeddata[,mean_indices]       #Subsetting based on mean and std

##3.	Setting descriptive activity names to name the activities in the data set 
merged_labels <- append(train_labels[,1], test_labels[,1], after = length(train_labels[,1]))

for(i in 1:length(merged_labels)){                  #setting descriptive activity names
        n <- grep(as.character(i),merged_labels)
        merged_labels[n] <- as.character(activity_labels[i])
        }

mergeddata <- cbind(merged_labels,mergeddata)
names(mergeddata)[1] <- "activity"

#Adding subject data
mergeddata <- cbind(merged_subject,mergeddata)

##4.	Appropriately labeling the data set with descriptive variable names. 
colnames(mergeddata)[3:ncol(mergeddata)] <- as.character(features[mean_indices,2])


##5 Creating a second, independent tidy data set with the average of each variable for each activity and each subject


##Extracting txt file of tidy dataset
write.table(mergeddata, file="data_tidy.txt",row.name=FALSE) 