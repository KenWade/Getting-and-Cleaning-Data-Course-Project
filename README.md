# Getting-and-Cleaning-Data-Course-Project
Getting and Cleaning Data Course Project

These files represent the completion of the Getting and Cleaning Data Course Project to create an R script called **run_analysis.R** that does the following:

  1.  Merges the training and the test sets to create one data set.
  2.  Extracts only the measurements on the mean and standard deviation for each measurement. 
  3.  Uses descriptive activity names to name the activities in the data set
  4.  Appropriately labels the data set with descriptive variable names. 
  5.  From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.

Additionally:
  6.  The final tidy data set is written to the appropriate folder as a simple text file.  The file is named: "dataAverage.txt"
  7.  The final tidy data set is returned from the **run_analysis.R** script function *run_analysis*.

## Specifically, the **run_analysis.R** script does the following:

Load Libraries
Build the proper paths and filenames
Read all the files
cleanup the individual data tables
Add subject and activity column to test data
Combine the data together.
   Thus completing assignment requirement:
      1. Merges the training and the test sets to create one data set.
      3. Uses descriptive activity names to name the activities in the data set.
      4. Appropriately labels the data set with descriptive variable names.
Reduce columns to only those that represent a mean or standard deviation function for each measurement
   Thus completing assignment requirement:
      2. Extracts only the measurements on the mean and standard deviation for each measurement.
Calculate average of each variable for each activity and each subject.
Update the column names to show they are now the mean adding more descriptive names for the columns
Tidy up the ordering by subject and activity.
   Thus completing assignment requirement:
      3. Uses descriptive activity names to name the activities in the data set.
      5. From the data set in step 4, creates a second, independent tidy data set with the average of each
         variable for each activity and each subject.
Write the data set to the working directory to save the results and return the full data set.
