##HUMAN ACTIVITY RECOGNITION - this script creates a tidy dataset summarising the means and stds of 33 features
##for 30 subjects performing 6 different activities: Data from https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip 


##reading data (the unzipped folder needs to be in your working directory)

features<-read.table("UCI HAR Dataset/features.txt")                  ##list of features (variables measured)
subjects_test<-read.table("UCI HAR Dataset/test/subject_test.txt")    ##test group - subject corresponding to rows in X_test
X_test<-read.table("UCI HAR Dataset/test/X_test.txt")                 ## test group main body of data (measurements of variables)
activity_test<-read.table("UCI HAR Dataset/test/y_test.txt")          ## test group - activity corresponding to rows in X_test
subjects_train<-read.table("UCI HAR Dataset/train/subject_train.txt") ##train group - subject corresponding to rows in X_train
X_train<-read.table("UCI HAR Dataset/train/X_train.txt")              ## train group main body of data (measurements of variables)
activity_train<-read.table("UCI HAR Dataset/train/y_train.txt")       ##train group - activity corresponding to rows in X_train


##combining test and training groups

subjects<-rbind(subjects_test,subjects_train)
activity<-rbind(activity_test,activity_train)
X<-rbind(X_test,X_train)


##descriptive activity names

act_names<-c("WALKING","WALKING_UPSTAIRS","WALKING_DOWNSTAIRS","SITTING","STANDING","LAYING")
activity<-sapply(activity, function(x) {x<-act_names[x]})
  


##creating wide data frame of required measurements (activity, subject, means and stds of 33 features)

mean_col<-grep("mean()", as.character(features[,2]),fixed=TRUE) ##finds column indices of X which correspond to mean 
std_col<-grep("std()", as.character(features[,2]),fixed=TRUE) ##finds column indices of X which correspond to std
wide_data<-cbind(activity,subjects,X[mean_col],X[std_col]) ##creates data frame
features_list<-make.names(gsub("mean()","",as.character(features[,2][mean_col]),fixed=TRUE))
colnames(wide_data)<-c("activity","subject",paste(features_list,"MEAN"),paste(features_list,"STD")) ##assigns appropriate column names


##summmarising the data (finding the average of the means ans stds by activity and subject)
##the plyr package needs to be installed

library(plyr)
wide_averaged<-ddply(wide_data, .(activity,subject),colwise(mean)) ## takes the average of all our means and stds


## puts it in a "narrow" tidy data form

narrow_averaged<-data.frame(c(),c(),c(),c(),c()) 
for(i in 1:33) {
        given_feature<-cbind(wide_averaged[,c(1,2)],"feature"=features_list[i],"average MEAN"=wide_averaged[,i+2],"average STD"=wide_averaged[,i+35])
        narrow_averaged<-rbind(narrow_averaged,given_feature)
}
narrow_averaged<-arrange(narrow_averaged,activity,subject) ##rearranges the data by activity,subject,feature.


## outputs the narrow tidy data set to your working directory

write.table(narrow_averaged,file="HUMAN ACTIVITY RECOGNITION-means and stds.txt",row.names=FALSE)
## end of script


