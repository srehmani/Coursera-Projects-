######################################################################################################
#
#  File Name: run_analysis.r
#  Purpose: 
#     1. Merges the training and the test sets to create one data set.
#     2. Extracts only the measurements on the mean and standard deviation for each measurement.
#     3. Uses descriptive activity names to name the activities in the data set
#     4. Appropriately labels the data set with descriptive variable names.
#     5. From the data set in step 4, creates a second, independent tidy data set with the average 
#        of each variable for each activity and each subject.
#
######################################################################################################

#load required libraries
library(dplyr)
library(reshape2)


# Setup: Get zipfile, unzip and analyze file
setwd("C:/Repo/Coursera/Getting Cleaning Data/Project")
FileUrl <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
FileName <- "FUCI HAR Dataset.zip"

# If file does not exists on local repo, download. If there is an error downloading, print error & cusotm message.
tryCatch(
          download.file(FileUrl, destfile = FileName, quiet = FALSE, mode ="wb"), error=function(e) print("Error downloading file.")
        )

# Check downloaded zip file and unzip if a copy does not exist (note, unzipped folder name different than zipped)
File <- "UCI HAR Dataset"
if (!file.exists(File)) {
  unzip(FileName)
}
##################################################
#read all files
##################################################

#training data sets
trainActivityData <- read.table(file.path(File, "train/Y_train.txt" ),header = FALSE)
trainSubjectData <- read.table(file.path(File, "train/subject_train.txt"),header = FALSE)
trainFeaturesData <- read.table(file.path(File, "train", "X_train.txt"),header = FALSE)

#testing datasets
testActivityData <- read.table(file.path(File, "test/Y_test.txt" ),header = FALSE)
testSubjectData <- read.table(file.path(File, "test/subject_test.txt"),header = FALSE)
testFeaturesData  <- read.table(file.path(File, "test" , "X_test.txt" ),header = FALSE)

#lookup data
lookupFeatures <- read.table(file.path(File, "features.txt" ),header = FALSE)
lookupActivity <- read.table(file.path(File, "activity_labels.txt" ),header = FALSE)
colnames(lookupActivity) <- c("ActivityID", "ActivityName")

########################################################
#merge test and training datasets with rowbind 
########################################################
SubjectData <- rbind(testSubjectData, trainSubjectData)
names(SubjectData) <- "SubjectID"

ActivityData <- rbind(testActivityData, trainActivityData)
names(ActivityData) <- "ActivityID"

FeaturesData <- rbind(testFeaturesData, trainFeaturesData)
names(FeaturesData) <- lookupFeatures$V2

#merge with column bind across all datasets
CompleteData <- cbind(SubjectData, ActivityData, FeaturesData)

#Filter data for Mean and STD based in features lookup data
#Create new datset with just the filtered data
#Add Activity and Subject columns
FilteredNames <- lookupFeatures$V2[grep("mean\\(\\)|std\\(\\)", lookupFeatures$V2)]
FilteredFeatures <- c("SubjectID", "ActivityID", as.character(FilteredNames))
FilteredData <- subset(CompleteData, select = FilteredFeatures)          
FilteredData <- merge(FilteredData, lookupActivity, by = "ActivityID")

#cleanup, remove setup data
rm(trainActivityData, trainFeaturesData, trainSubjectData, testActivityData, testFeaturesData, testSubjectData, CompleteData, lookupActivity, lookupFeatures)

# fix column names
names(FilteredData)<-gsub("^t", "Time", names(FilteredData))
names(FilteredData)<-gsub("^f", "Frequency", names(FilteredData))
names(FilteredData)<-gsub("Acc", "Accelerometer", names(FilteredData))
names(FilteredData)<-gsub("Gyro", "Gyroscope", names(FilteredData))
names(FilteredData)<-gsub("Mag", "Magnitude", names(FilteredData))
names(FilteredData)<-gsub("BodyBody", "Body", names(FilteredData))
names(FilteredData)<-gsub("\\.mean", "Mean", names(FilteredData))
names(FilteredData)<-gsub("\\.std", "Std", names(FilteredData))
names(FilteredData)<-gsub("[\\(\\)-]", "", names(FilteredData))

#factorize
FilteredData$SubjectID <- as.factor(FilteredData$SubjectID)
FilteredData$ActivityID <- as.factor(FilteredData$ActivityID)

#create tiday data set
TidyData <- aggregate(. ~SubjectID + ActivityName, FilteredData, mean)

#write output to text file
write.table(TidyData, file = "tidydata.txt",row.name=FALSE)


#names(TidyData)






