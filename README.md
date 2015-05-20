# Human Activity Recognition Using Smartphones Data Set 

This repository describes how the script for the Project in the Coursera "Getting and Cleaning Data" Course works. The script is located in the main directory of this repository, and can be accesed from [here](https://github.com/alcideschaux/Cleaning_Data_Coursera/blob/master/run_analysis.R).

## Requirements
This script assumes that the Samsung data is located in a folder named `DATA` in the working directory. Specifically, the structure of folders and files must match *at least* the following files:

run_analysis.R  
DATA/test/subject_test.txt  
DATA/test/X_test.txt  
DATA/test/y_test.txt  
DATA/train/subject_train.txt  
DATA/train/X_train.txt  
DATA/train/y_train.txt  
DATA/activity_labels.txt  
DATA/features_info.txt  
DATA/features.txt  

Details regarding the content of each files can be found in the [README.txt](https://github.com/alcideschaux/Cleaning_Data_Coursera/blob/master/DATA/README.txt) file describing the dataset.

## Running the script
This script is composed of 2 parts, each one delivering a specific output.

### First part
This first part does the following:
* __Merges the training and the test sets to create one data set:__ the files merged correspond to all tables located in the `test` and `train` folders. These tables include the subject ID, activity type (Y), and measured variables (X).

* __Extracts only the measurements on the mean and standard deviation for each measurement:__ these variables were selected using the [features.txt](https://github.com/alcideschaux/Cleaning_Data_Coursera/blob/master/DATA/features.txt) file.

* __Uses descriptive activity names to name the activities in the data set:__ the levels of the `Activity` variable were renamed taking into account the specifications given in the [activity_labels.txt](https://github.com/alcideschaux/Cleaning_Data_Coursera/blob/master/DATA/activity_labels.txt) file. 

* __Appropriately labels the data set with descriptive activity names:__ the variable names in the columns were changed to more descriptive albeit longer names.

This first part delivers a data.frame named `Data_Set` which contains all the Samsung data (10299 observations of 68 variables).

### Second part
The second part of the scrip creates a second, independent tidy data set with the average of each variable for each activity and each subject. This second part delivers a data.frame named `Tidy_Set` which is written into a .csv file in the working directory. This second dataset can be accessed from [here](https://github.com/alcideschaux/Cleaning_Data_Coursera/blob/master/Tidy_Set.csv).

## Codebook
The codebook describing the variables included in the tidy datasets can be accessed from [here](https://github.com/alcideschaux/Cleaning_Data_Coursera/blob/master/CODEBOOK.Rmd).
