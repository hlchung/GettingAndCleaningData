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
###New Variables
  * x_data
