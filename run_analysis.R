

## https://class.coursera.org/getdata-034
##
## Peer Assessments / Getting and Cleaning Data Course Project
##
## Assignment: The purpose of this project is to demonstrate your ability to collect, work with, and clean a data set.
##
## You should create one R script called run_analysis.R that does the following. 
##
##   1. Merges the training and the test sets to create one data set.
##   2. Extracts only the measurements on the mean and standard deviation for each measurement. 
##   3. Uses descriptive activity names to name the activities in the data set
##   4. Appropriately labels the data set with descriptive variable names. 
##   5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.
##
## Data files are located at "./UCI HAR Dataset" in exactly the same file structure as extracted from the "getdata-projectfiles-UCI HAR Dataset.zip" file
## Working Directory is assumed to be at "."

run_analysis <- function() {

## Load Libraries
   
    library(dplyr)

## Build the proper paths and filenames
    
    folder       <- "./UCI HAR Dataset/"
    train_folder <- "train/"
    test_folder  <- "test/"
    
    activity_labels_filename <- paste(folder, "activity_labels.txt", sep="")
    features_filename        <- paste(folder, "features.txt", sep="")
    
    x_test_filename          <- paste(folder, test_folder, "x_test.txt", sep="")
    y_test_filename          <- paste(folder, test_folder, "y_test.txt", sep="")
    subject_test_filename    <- paste(folder, test_folder, "subject_test.txt", sep="")
    
    x_train_filename         <- paste(folder, train_folder, "x_train.txt", sep="")
    y_train_filename         <- paste(folder, train_folder, "y_train.txt", sep="")
    subject_train_filename   <- paste(folder, train_folder, "subject_train.txt", sep="")
    
    dataAverage_filename     <- paste("./", "dataAverage.txt", sep="")
    
# Read all the files
    
    activityLables <- read.table(activity_labels_filename, header = FALSE)
    features       <- read.table(features_filename, header = FALSE)
    
    xTest          <- read.table(x_test_filename, header = FALSE)
    yTest          <- read.table(y_test_filename, header = FALSE)
    subjectTest    <- read.table(subject_test_filename, header = FALSE)
    
    xTrain         <- read.table(x_train_filename, header = FALSE)
    yTrain         <- read.table(y_train_filename, header = FALSE)
    subjectTrain   <- read.table(subject_train_filename, header = FALSE)
    
# Cleanup the individual data tables
    
    activityLables <- as.character(activityLables[,2])
    features       <- as.character(features[,2])
    
    names(xTest) <- features
    names(yTest) <- "activity"
    names(subjectTest) <- "subject"
    
    names(xTrain) <- features
    names(yTrain) <- "activity"  
    names(subjectTrain) <- "subject"
    
    yTest  <- as.data.frame(activityLables[yTest$activity])
    yTrain <- as.data.frame(activityLables[yTrain$activity])
    names(yTest)  <- "activity"
    names(yTrain) <- "activity"  
    
# Add subject and activity column to test data
    
    dataTest  <- cbind(subjectTest,  yTest,  xTest)
    dataTrain <- cbind(subjectTrain, yTrain, xTrain)
    
# Combine the data together.
    
    dataAll <- rbind(dataTest, dataTrain)  
    
#####
#
#   Thus completing assignment requirement:
#
#       1. Merges the training and the test sets to create one data set.
#       3. Uses descriptive activity names to name the activities in the data set.
#       4. Appropriately labels the data set with descriptive variable names.
#
#####
    
# Reduce columns to only those that represent a mean or standard deviation function for each measurement
    
    searchString <- "mean\\(\\)|std\\(\\)"
    dataSome <- dataAll[, c(1,2,grep(searchString, names(dataAll), ignore.case = TRUE))]
    
#####
#
#   Thus completing assignment requirement:
#
#       2. Extracts only the measurements on the mean and standard deviation for each measurement.
#
#####
    
# Calculate average of each variable for each activity and each subject.
    
    dataAverage <- aggregate(.~(subject+activity), data=dataSome, FUN=mean)   
    
# Update the column names to show they are now the mean adding more descriptive names for the columns
    
    names(dataAverage) <- c(names(dataAverage[1:2]), paste("mean(", names(dataAverage[3:ncol(dataAverage)]), ")", sep=""))

# Tidy up the ordering by subject and activity.

    dataAverage <- arrange(dataAverage, subject, activity)

####
#
#  Thus completing assignment requirement:
#
#      3. Uses descriptive activity names to name the activities in the data set.
#      5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.
#
#####
    
#####
#
# Write the data set to the working directory to save the results and return the full data set.
#
#####
    
    write.table(dataAverage, dataAverage_filename, row.name=FALSE)
    dataAverage

}