### Coursera Data Science Specialisation - Peer-graded Assignment: Getting and Cleaning Data Course Project


### run_analysis.R

1. Data is obtained from https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip using download.file()
2. The following files are read into R:
UCI HAR Dataset\test\X_train.txt
UCI HAR Dataset\test\y_train.txt
UCI HAR Dataset\test\subject_train.txt
UCI HAR Dataset\train\X_test.txt
UCI HAR Dataset\train\y_test.txt
UCI HAR Dataset\train\subject_test.txt
UCI HAR Dataset\features.txt
UCI HAR Dataset\activity_labels.txt

3. The training and test subject datasets are merged using merge() and a column name of "volunteer" is set using colnames()
The trianing and test datasets are merged using merge()

4. The merged data set is subset based on the the mean and standard deviation for each measurement using grep() to find "mean" or "std" and the dataset is subset based on this

5. The labels for the train and test variables is merged using append().
The activity labels (1-6) are substituted with the descriptive activity names from the file activity_labels.txt using grep() to find the values (1-6) and are substituted for 1. WALKING, 2.WALKING_UPSTAIRS,3.WALKING_DOWNSTAIRS, 4.SITTING, 5.STANDING, 6.LAYING     
The activities are added to the dataset using cbind() and that column is labelled using names() to "activity"

6. The subject labels are added to the dataset using cbind()

7. Labels for the variables is added from features.txt using colnames()

8. ************************ create tidy dataset

9. The tidy dataset is exported using write.table()