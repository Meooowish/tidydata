# assigning all files to variables

features <- read.table("./features.txt", col.names = c("n", "feature"))
activity <- read.table("./activity_labels.txt", col.names = c("id", "activity"))
subject_test <- read.table("./test/subject_test.txt", col.names = "subject")
xtest <- read.table("./test/X_test.txt", col.names = features$feature)
ytest <- read.table("./test/Y_test.txt", col.names = "id")  
subject_train <- read.table("./train/subject_train.txt", col.names = "subject")
xtrain <- read.table("./train/X_train.txt", col.names =features$feature )
ytrain <- read.table("./train/Y_train.txt", col.names = "id" )

# merge all data tables

x <- rbind(xtrain, xtest)
y <- rbind(ytrain, ytest)
subject <- rbind(subject_train, subject_test)
complete_data <- cbind(subject, x, y)

# Extracts only the measurements on the mean and standard deviation for each measurement.

data_mean_std <- complete_data %>% select( subject, id, contains("mean"), contains("std"))

# Uses descriptive activity names to name the activities in the data set.

data_mean_std$id <- activity[data_mean_std$id, 2]

# Appropriately labels the data set with descriptive variable names

names(data_mean_std) = gsub("id", "Activity", names(data_mean_std))
names(data_mean_std) = gsub("^t", "Time", names(data_mean_std))
names(data_mean_std) = gsub("Acc", "Accelerometer", names(data_mean_std))
names(data_mean_std) = gsub("Gyro", "Gyroscope", names(data_mean_std))
names(data_mean_std) = gsub("^f", "Frequency", names(data_mean_std))
names(data_mean_std) = gsub("BodyBody", "Body", names(data_mean_std))

# creates a second, independent tidy data set with the average of each variable for each activity and each subject.

FinalData <- data_mean_std %>%
  group_by(subject, Activity) %>%
  summarise_all(list(mean))
write.table(FinalData, "FinalData.txt", row.name=FALSE)
