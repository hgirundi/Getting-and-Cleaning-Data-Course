#setting working directory

setwd('D:/Estudo/data_analisys/Cursos/Coursera/Getting and Cleaning Data/week4/project/UCI HAR Dataset')

#loading the activity labels
activity_labels <- read.table('activity_labels.txt')

#loading the activity features (names of columns)
features <- read.table('features.txt')

#Test data to dataframes
subject_test <- read.table('test/subject_test.txt')
X_test <- read.table('test/X_test.txt')
y_test <- read.table('test/y_test.txt')

#Training data to dataframes
subject_train <- read.table('train/subject_train.txt')
X_train <- read.table('train/X_train.txt')
y_train <- read.table('train/y_train.txt')

#add column name for subject files
names(subject_train)  <- "SubjectNum"
names(subject_test)  <- "SubjectNum"


#add column names for measurement files
featureNames <- read.table("features.txt")
names(X_train) <- featureNames$V2
names(X_test) <- featureNames$V2

# add column name for label files
names(y_train) <- "activity"
names(y_test) <- "activity"


#merging all files into one dataset
trainDt <- cbind(subject_train, y_train, X_train)
testDt <- cbind(subject_test, y_test, X_test)
Df <- rbind(trainDt, testDt)

#getting only the collumns that contains "mean()" or "std()" 
meanstdcol <- grepl("mean\\(\\)", names(Df)) | grepl("std\\(\\)", names(Df))

#keep the first two columns (activity and features) in the data set, otherwise R will remove them and remove the columns that doesn't contain "mean()" or "std()"
meanstdcol[1:2] <- TRUE
Df <- Df[, meanstdcol]

# convert the activity column from integer to factor associating the activity labels to its own respective numbers. 
Df$activity <- factor(Df$activity, labels=c("WALKING","WALKING_UPSTAIRS", "WALKING_DOWNSTAIRS", "SITTING", "STANDING", "LAYING"))

# load the reshape to use melt
library(reshape2)


# creating the final data set
df_2 <- melt(Df, id=c("SubjectNum","activity"))
tidy_data <- dcast(df_2, SubjectNum+activity ~ variable, mean)

write.csv(tidy_data, "tidy_data.csv", row.names=FALSE)

