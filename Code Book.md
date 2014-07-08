##Human Activity Recognition (Getting and Cleaning Data project)
#Code Book

####Objective
This document describes the transformation of data from experiments on Human Activity Recognition Using Smartphones.
The objective was to produce a tidy data set of the means and standard deviations (std) of the variables measured by the Smartphones while certain activities were performed.

More information is available at the site where the data was obtained: 

http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones 

The data can be downloaded here. Consult the README.txt , features.info.txt and features.txt files.

https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip 


###CONTENTS
1. Description of the raw data and experiment
2. Explanation of the raw data transformation to produce a tidy data set.



###THE RAW DATA AND EXPERIMENT

The experiment was carried out with 30 subjects within an age bracket of 19-48 years.  Each person performed six activities (WALKING, WALKING UPSTAIRS, WALKING DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope,  3-axial linear acceleration and 3-axial angular velocity measures were recorded.

From these measurements, a set of variables were estimated 'features'. These features included the mean and standard deviation for each measure. These were normalised (therefore no units).


Details of the features are provided in the files features_info.txt and features.txt

The raw data was organised as follows.
 * The obtained dataset was randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data. 
 * For each set 'test' and 'train' we have the measurements (folder 'inertial signals')
 * For each set we have the 'features data' with corresponding files giving the subject and activity performed. 'X_train.txt'   'y_train.text' - activity references, and 'subject_train.txt' 

###2 DATA TRANSFORMATION



Hadley Wickham describes tidy data as....  (http://vita.had.co.nz/papers/tidy-data.pdf)


Tidy data is a standard way of mapping the meaning of a dataset to its structure. A dataset is
messy or tidy depending on how rows, columns and tables are matched up with observations,
variables and types. In tidy data:
1. Each variable forms a column.
2. Each observation forms a row.
3. Each type of observational unit forms a table.
4. 
talk about the steps to providing a tidy data set




