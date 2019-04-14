# Code Book of Getting and Cleaning Data
In order to perform the different steps stated in the ReadMe.md file, it is necessary to download the data source then analyze the variables in it.
## 1. Getting the Data 
As stated on the project description, the data source is to be downloaded via [zip file](https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip). 
## 2. Analyzing the Data, its Variables, and Reading the Data
After extracting the files, we are given several text files which will be used to merge the data sets. The different text files are the following:
  * activity_labels
  * features
  * test folder, which includes: 
      * x_test
      * y_test
      * subject_test
  * train folder, which includes:
      * x_train
      * y_train
      * subject_train
### Reading the Data
The text files stated above are read and "placed" in RStudio.

## 3. Merging the Data
### New Variables
**For Merging Data**
  * x_data
      * The x_data variable contains both the x_test and x_train datasets which were binded together.
  * y_data
      * The y_data variable contains both the y_test and y_train datasets which were binded together.
  * subject_data
      * The subject_data variable contains both the subject_test and subject_train datasets which were binded together.
  * full_data
      * The full_data variable contains the x_data, y_data, and subject_data datasets.
      
**To Extract the Mean and Standard Deviation for Each Measurement**
  * clean_data
 
 **Transformations Done in Merging** 
  * Merge x_test and x_train using rBind() to create x_data
  * Merge y_test and y_train using rBind() to create y_data
  * Merge subject_train and subject_test using rBind() to create subject_data
  * Merge Subset full_data to have the columns subject, class, and those that contains mean and std then store it in a variable named clean_data
 
## 4. Naming the Activities in the Data Set using Descriptive Activity Names
Read the labels from the activity_labels.txt file
 
## 5. Labeling the data set with descriptive variable names
Using the clean_data data set, do the following:
  * Rename columns with **Acc** in its name to **Accelerometer**
  * Rename columns with **Gyro** in its name to **Gyroscope**
  * Rename columns with **Mag** in its name to **Magnitude**
  * Rename columns with **BodyBody** in its name to **Body**
  * Rename columns that starts with **t** in its name to **Time**
  * Rename columns that starts with **f** in its name to **Frequency**
  * Rename columns with **-std()** in its name to **STD**
  * Rename columns with **-mean()** in its name to **Mean**
  * Rename columns with **-freq()** in its name to **Frequency**
  * Rename columns with **tBody** in its name to **TimeBody**
  
 ## 6. Creating a second, independent tidy data set with the average of each variable for each activity and each subject
Use the **group_by** function to group observations in **clean_data** based on **subject** and **activity** then store it in a variable named **Dataset**, then use **write.table** function to write **Dataset** to a **Dataset.txt** file
