Samsung
=======

Samsung project for Coursera Getting and Cleaning Data class 




##How the code works:

The run_Analysis.R file loads data from the "UCI HAR Dataset" folder and transforms it to a tidy dataset through a series of 8 steps:

* Step 1: Load feature data and combine train and test to one dataset with the right labels
	* X_test.txt & X_train.txt is assigned to two variables. 
	* Feature labels from features.txt is assigned to a variable.
	* The labels are added to each dataset through the colnames function.
	* The two datasets are appended using the rbind function. 

* Step 2: Load subject data and combine it to one dataset
	* As in step 1, subject_test.txt and subject_train.txt are stored in two variables.
	* A combined dataset is made using the rbind function.

* Step 3: Find feature columns with mean and std but NOT with meanFreq using the grep and match functions
	* In this step R looks through the column names of the features dataset to find all variables with the word "mean" and "std".
	* Unfortunately - there are some variables in the dataset called meanFreq, which are removed using a match function.
	* the dataset is finally subset with the chosen columns. 

* Step 4: Find meaningfull names for activity variable by matching scores and labels 
	* Data on the activity number for each observation is stored in two different datasets: Y_test.txt and Y_train.txt. These are stored to two variables.
	* The file activity_labels.txt stores the key between a certain activity number and the associated activity labels. These activity labels are loaded to the the test & train dataset using a match function.
	* The two datasets are appended using the rbind function.

* Step 5: Combine activity, subject and feature data to one full dataset
	* A cbind function is used to merge data on features, activities and subjects together to one full dataset

* Step 6: Rename variables to descriptive names using the gsub function 
	* The columns names of the full dataset is stored to a variable for manipulation.
	* Using the gsub function a series of transformations are made to the header strings. For example all headers with the word "acc" is changed to "Accelerometer".
	* The manipulated strings are then used as the new column names of the dataset.

* Step 7: Create tidy dataset with mean values of each variable using the aggregate function.
	* A quite simple aggregate function is used to calculate the mean of all variables in the dataset grouped by the subject and the activity.

* Step 8: Write output to .txt file by write.table

Each step is commented in the R-code for easy tracking.




##Code book:

The original code book description has been altered to fit the new naming and decreased variables of the tidy dataset: 

The features selected for this database come from the accelerometer and gyroscope 3-axial raw signals TimeAccelerometer-XYZ and TimeGyroscope-XYZ. These time domain signals were captured at a constant rate of 50 Hz. Then they were filtered using a median filter and a 3rd order low pass Butterworth filter with a corner frequency of 20 Hz to remove noise. Similarly, the acceleration signal was then separated into body and gravity acceleration signals (TimeBodyAccelerometer-XYZ and TimeGravityAccelerometer-XYZ) using another low pass Butterworth filter with a corner frequency of 0.3 Hz. 

Subsequently, the body linear acceleration and angular velocity were derived in time to obtain Jerk signals (TimeBodyAccelerometerJerk-XYZ and TimeBodyGyroscopeJerk-XYZ). Also the magnitude of these three-dimensional signals were calculated using the Euclidean norm (TimeBodyAccelerometerMagnitude, TimeGravityAccelerometerMagnitude, TimeBodyAccelerometerJerkMagnitude, TimeBodyGyroscopeMagnitude, TimeBodyGyroscopeJerkMagnitude). 

Finally a Fast Fourier Transform (FFT) was applied to some of these signals producing FrequencyBodyAccelerometer-XYZ, FrequencyBodyAccelerometerJerk-XYZ, FrequencyBodyGyroscope-XYZ, FrequencyBodyAccelerometerJerkMagnitude, FrequencyBodyGyroscopeMagnitude, FrequencyBodyGyroscopeJerkMagnitude.  

These signals were used to estimate variables of the feature vector for each pattern:  
'-XYZ' is used to denote 3-axial signals in the X, Y and Z directions.

* TimeBodyAccelerometer-XYZ
* TimeGravityAccelerometer-XYZ
* TimeBodyAccelerometerJerk-XYZ
* TimeBodyGyroscope-XYZ
* TimeBodyGyroscopeJerk-XYZ
* TimeBodyAccelerometerMagnitude
* TimeGravityAccelerometerMagnitude
* TimeBodyAccelerometerJerkMagnitude
* TimeBodyGyroscopeMagnitude
* TimeBodyGyroscopeJerkMagnitude
* FrequencyBodyAccelerometer-XYZ
* FrequencyBodyAccelerometerJerk-XYZ
* FrequencyBodyGyroscope-XYZ
* FrequencyBodyAccelerometerMagnitude
* FrequencyBodyAccelerometerJerkMagnitude
* FrequencyBodyGyroscopeMagnitude
* FrequencyBodyGyroscopeJerkMagnitude

The set of variables that were estimated from these signals are: 

mean: Mean value
std: Standard deviation

Each observation is associated with a test subject being measured. Each subject is given a unique subject number stored under the variable: "Subject".  

Finally each observation is associated with a certain activity that the test subject was performing. The activity can range between these values and is stored under the name "Activity" in the dataset: 
* 1 WALKING
* 2 WALKING_UPSTAIRS
* 3 WALKING_DOWNSTAIRS
* 4 SITTING
* 5 STANDING
* 6 LAYING