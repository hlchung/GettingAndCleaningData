data_link <- 'https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip'
folderName <- 'UCI HAR Dataset'

if(!file.exists("./dataset.zip"))
    download.file(data_link, destfile = "./dataset.zip")

if(!file.exists(folderName))
    unzip("./dataset.zip")

library(dplyr)

activity_labels <- read.table(paste(folderName,"/activity_labels.txt", sep = ""), col.names = c("class","activity"))
features <- read.table(paste(folderName,"/features.txt", sep = ""), col.names = c("n", "function"))
subject_test <- read.table(paste(folderName,"/test/subject_test.txt", sep = ""), col.names = "subject")
x_test <- read.table(paste(folderName,"/test/X_test.txt", sep = ""), col.names = features$function.)
y_test <- read.table(paste(folderName,"/test/y_test.txt", sep = ""), col.names = "class")
subject_train <- read.table(paste(folderName,"/train/subject_train.txt", sep = ""), col.names = "subject")
x_train <- read.table(paste(folderName,"/train/X_train.txt", sep = ""), col.names = features$function.)
y_train <- read.table(paste(folderName,"/train/y_train.txt", sep = ""), col.names = "class")

x_data <- rbind(x_test, x_train)
y_data <- rbind(y_test, y_train)
subject_data <- rbind(subject_test, subject_train)
full_data <- cbind(subject_data, x_data, y_data)

clean_data <- full_data %>%
    select(subject,class,contains("mean"), contains("std"))

clean_data$class <- activity_labels[clean_data$class,2]

names(clean_data)[2] <- "activity"
names(clean_data) <- gsub("Acc", "Accelerometer", names(clean_data))
names(clean_data) <- gsub("Gyro", "Gyroscope", names(clean_data))
names(clean_data) <- gsub("Mag", "Magnitude", names(clean_data))
names(clean_data) <- gsub("BodyBody", "Body", names(clean_data))
names(clean_data) <- gsub("^t", "Time", names(clean_data))
names(clean_data) <- gsub("^f", "Frequency", names(clean_data))
names(clean_data) <- gsub("-std()", "STD", names(clean_data), ignore.case = T)
names(clean_data) <- gsub("-mean()", "Mean", names(clean_data), ignore.case = T)
names(clean_data) <- gsub("-freq()", "Frequency", names(clean_data), ignore.case = T)
names(clean_data) <- gsub("tBody", "TimeBody", names(clean_data))

Dataset <- group_by(clean_data, subject, activity) %>%
    summarise_all(list(mean))
write.table(Dataset, "Dataset.txt")

View(Dataset)