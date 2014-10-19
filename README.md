Samsung
=======

Samsung project for Coursera Getting and Cleaning Data class 



##How the code works:

The run_Analysis.R file loads data from the "UCI HAR Dataset" folder and transforms it to a tidy dataset through a series of 8 steps:

-Step 1: Load feature data and combine train and test to one dataset with the rigth labels
-Step 2: Load subject data and combine it to one dataset
-Step 3: Find feature columns with mean and std but NOT with meanFreq using the grep and match functions
-Step 4: Find meaningfull names for activity variable by matching scores and labels 
-Step 5: Combine activity, subject and feature data to one full dataset
-Step 6: Rename variables to descriptive names using the gsub function 
-Step 7: Create tidy dataset with mean values of each variable using the aggregate function.
-Step 8: Write output to .txt file by write.table

Each step is clearly commented in the R-code.



##Code book:

