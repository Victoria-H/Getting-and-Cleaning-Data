##Human Activity Recognition (Getting and Cleaning Data project)
#Code Book

####Objective
This document describes the transformation of data from experiments on Human Activity Recognition Using Smartphones.
The objective was to produce a tidy data set of the means and standard deviations (std) of the variables measured by the Smartphones while certain activities were performed.

More information is available at the site where the data was obtained: 

http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones 

The data can be downloaded here. Consult the README.txt , features.info.txt and features.txt files included.

https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip 


###CONTENTS
1. Description of the raw data and experiment
2. Explanation of the raw data transformation to produce a tidy data set.

(NOTE: No attempt is given here to justify experimental design, explain the signification or interpretation of the measurements nor analyse the results)


###1 THE RAW DATA AND EXPERIMENT

The experiment was carried out with 30 subjects within an age bracket of 19-48 years.  Each person performed six activities (WALKING, WALKING UPSTAIRS, WALKING DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope,  3-axial linear acceleration and 3-axial angular velocity measures were recorded.

From these measurements, a set of variables were estimated corresponding to certain 'features' such as body acceleration, body jerk etc. (see features_info.txt) Counting XYZ direction separately we have a list of 33 features.
These variables given for these features included the mean and standard deviation for each measure. These were normalised (therefore NO UNITS).


Details of the features are provided in the files features_info.txt and features.txt included in the downloaded dataset.

The raw data was organised as follows.

 * The obtained dataset was randomly partitioned into two sets, where 70% of the volunteer subjects was selected for generating the training data and 30% the test data. 
 * For each set 'test' and 'train' we have the unprocessed measurements  (folder 'inertial signals')
 * For each set we have the 'features' data (estimated variables) with corresponding files giving the subject and activity performed. e.g. For the training set :'X_train.txt' -table of normalised feature data,  'y_train.text' - activity references, and 'subject_train.txt' -subject references
 * 'features.txt' contains the corresponding column labels for both the 'X_train' and 'X_test' tables. 

(NOTE ON NOMENCLATURE : In the column labels 'features.txt' fBodyBodyAccJerkMag fBodyBodyGyroMag fBodyBodyGyroJerkMag seem to correspond to fBodyAccJerkMag fBodyGyroMag fBodyGyroJerkMag as given in 'features_info.txt')


 

 

###2 DATA TRANSFORMATION

**Objective :** To provide a tidy data set summarising the means and standard deviations (std) for the features by subject and activity performed. 

*Hadley Wickham describes tidy data as....  (http://vita.had.co.nz/papers/tidy-data.pdf)*


Tidy data is a standard way of mapping the meaning of a dataset to its structure. A dataset is
messy or tidy depending on how rows, columns and tables are matched up with observations,
variables and types. In tidy data:

* Each variable forms a column.
* Each observation forms a row.
* Each type of observational unit forms a table.

.

**Procedure :**  Write an R script 'run_analysis.R' to do the following...

Step 1 - Merge the two data sets (test and training) and associate the corresponding activity,subject labels as well as the feature variable column names

Step 2 - transform the activity labels (1-6) into descriptive labels

Step 3 - Extract only the columns corresponding to the means and stds 

Step 4 - For each activity performed by a given subject there are several entries. Summarise these by finding the average of the selected features (i.e. means and standard deviations) by activity and subject.

Step 5 - Arrange these according to tidy data principals. Here a 'narrow' form was chosen with 5 columns corresponding to 
 * 'activity'  6 activites WALKING, WALKING UPSTAIRS, WALKING DOWNSTAIRS, SITTING, STANDING, LAYING
 * 'subject'   range 1-30 references the 30 people who took part in the experiment
 * 'feature'   the 33 feature variables (nomenclature as given in the raw data) (NOTE1)
 * 'averageMEAN' the average normalised mean of the feature variable for the subject performing the given activty
 * 'averageSTD' the average normalised standard deviation of the feature variable for the subject performing the activity.

(NOTE1 : Feature names correspond to those used in the file 'features.txt' see note on nomenclature above. This decision was taken to ease name matching in further analysis)

**Thus the output of the R script is a table with 6x30x33 =5940 rows and 5 columns**









