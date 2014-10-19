# Step 1: Load feature data and combine train and test to one dataset
test <- read.csv("UCI HAR Dataset/test/X_test.txt", header=FALSE, sep="")
train <- read.csv("UCI HAR Dataset/train/X_train.txt", header=FALSE, sep="")
feature_labels <- read.csv("UCI HAR Dataset/features.txt", header=FALSE, sep="")
colnames(test) <- feature_labels[,2]
colnames(train) <- feature_labels[,2]
full <- rbind(test,train)

# Step 2: Load subject data and combine it to one dataset
test_subjects <- read.csv("UCI HAR Dataset/test/subject_test.txt", header=FALSE, sep="")
train_subjects <- read.csv("UCI HAR Dataset/train/subject_train.txt", header=FALSE, sep="")
full_subjects <- rbind(test_subjects,train_subjects)

# Step 3: Find feature columns with mean and std but NOT with meanFreq
a <- grep("mean", names(full))
b <- grep("meanFreq", names(full))
mean_values <- a[-match(b,a)]
mean_std_values <- c(mean_values,grep("std", names(full)))
full_clean <- full[,mean_std_values]

# Step 4: Find meaningfull names for activity variable
test_activity <- read.csv("UCI HAR Dataset/test/Y_test.txt", header=FALSE, sep="")
train_activity <- read.csv("UCI HAR Dataset/train/Y_train.txt", header=FALSE, sep="")
activity_labels <- read.csv("UCI HAR Dataset/activity_labels.txt", header=FALSE, sep="")
test_activity$activity <- activity_labels$V2[match(test_activity$V1,activity_labels$V1)]
train_activity$activity <- activity_labels$V2[match(train_activity$V1,activity_labels$V1)]
full_activity <- rbind(test_activity,train_activity)

# Step 5: Add acitivity and subjects to full_clean dataset
full_clean <- cbind(Subject = full_subjects$V1, Activity = full_activity$activity, full_clean)

# Step 6: Rename variables to descriptive names
full_clean_names <- names(full_clean)
full_clean_names <- gsub("^t", "Time", full_clean_names)
full_clean_names <- gsub("^f", "Frequency", full_clean_names)
full_clean_names <- gsub("Acc", "Accelerometer", full_clean_names)
full_clean_names <- gsub("Gyro", "Gyroscope", full_clean_names)
full_clean_names <- gsub("Mag", "Magnitude", full_clean_names)
full_clean_names <- gsub("\\()", "", full_clean_names)
names(full_clean) <- full_clean_names

# Step 7: Create tidy dataset with mean values grouped by Subject and Activity
full_clean_mean <- aggregate(.~Subject+Activity, full_clean, mean)

# Step 8: Write output to .txt file
write.table(full_clean_mean, file="full_clean_mean.txt", row.name=FALSE)