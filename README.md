Getting-and-Cleaning-Data
=========================

This README outlines the procedure for running the R script run_analysis.R with the objective of outputting a tidy data set
summarising data on Human Activity Recognition using Smartphones.

*Please consult the Code Book for more complete information on the data, details of the data transformation, variable names etc.*

##TO OUTPUT THE TIDY DATA SET

* Download the data from https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip
* Unzip this file into your working directory keeping the folder name 'UCI HAR Dataset'
* Run the script run_analysis.R

The script will....

read the appropriate files from the downloaded folder *(NOTE: Not all the data in the downloaded folder
will be read into the R environment - notably the 'Inertial Signals' data sets are not used)*

merge/combine the training and test data sets

assign descriptive names to the activities

create a 'wide' data frame of required measurements (activity, subject, means and stds of 33 features)

summmarise the data (finds the average of the means and stds by activity and subject)
*(NOTE : the 'plyr' package needs to be installed.)*

put the summarised data in a "narrow" tidy data form

write the narrow tidy data set to your working directory as a text file "HUMAN ACTIVITY RECOGNITION-means and stds.txt"

*The intermediate data frames created will also be available in your R environment if you prefer to use these for analysis*





