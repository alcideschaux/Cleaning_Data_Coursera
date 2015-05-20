# This script assumes that the Samsung data is located in a folder named DATA in the working directory

# FIRST PART
# Merges the training and the test sets to create one data set.
# Extracts only the measurements on the mean and standard deviation for each measurement. 
# Uses descriptive activity names to name the activities in the data set
# Appropriately labels the data set with descriptive activity names. 

# Loading test and training sets
## Subjects ID
Subject_Test <- read.table(file = "./DATA/test/subject_test.txt")
Subject_Train <- read.table(file = "./DATA/train/subject_train.txt")
## Variables measured
X_Test <- read.table(file = "./DATA/test/X_test.txt")
X_Train <- read.table(file = "./DATA/train/X_train.txt")
## Activities
Y_Test <- read.table(file = "./DATA/test/y_test.txt")
Y_Train <- read.table(file = "./DATA/train/y_train.txt")
# Selecting only mean and std for each measurement, using DATA/features.txt
library(dplyr)
Features <- read.table(file = "DATA/features.txt")
Mean_Std <- with(Features, c(grep("mean", V2), grep("std", V2)))
X_Test <- X_Test[, Mean_Std]
X_Train <- X_Train[, Mean_Std]
# Merging all variables into one data.frame
Test_Set <- cbind(Subject_Test, Y_Test, X_Test)
Train_Set <- cbind(Subject_Train, Y_Train, X_Train)
Data_Set <- rbind(Test_Set, Train_Set)        
# Labeling variables
Selected_Var <- Features[Mean_Std, ]
Selected_Var <- as.character(Selected_Var[, 2])
library(stringr)
Selected_Var <- Selected_Var %>%
  str_replace_all("-", "_") %>%
  str_replace_all("tBody", "T_Body") %>%
  str_replace_all("fBody", "F_Body") %>%
  str_replace_all("tGravity", "T_Gravity") %>%
  str_replace_all("Acc", "_Accelerometer") %>%  
  str_replace_all("Gyro", "_Gyroscope") %>%
  str_replace_all("Jerk", "_Jerk") %>%
  str_replace_all("Mag", "_Magnitude") %>%
  str_replace_all("BodyBody", "Body") %>%
  str_replace_all("()", "")
names(Data_Set) <- c("Subject_ID", "Activity", Selected_Var)
Data_Set$Subject_ID <- as.factor(Data_Set$Subject_ID)
Data_Set$Activity <- as.factor(Data_Set$Activity)
levels(Data_Set$Activity) <- list(
  "Walking" = "1",
  "Walking upstairs" = "2",
  "Walking downstairs" = "3",
  "Sitting" = "4",
  "Standing" = "5",
  "Laying" = "6"
)
# Removing all objects from the workspace except Data_Set
rm(list = (ls()[ls() != "Data_Set"]))

# SECOND PART
# Creates a second, independent tidy data set with the average of each variable for each activity and each subject. 
library(plyr)
Tidy_Set <- ddply(Data_Set, .(Subject_ID, Activity), numcolwise(mean))
write.csv(Tidy_Set, "Tidy_Set.csv", row.names = FALSE)
