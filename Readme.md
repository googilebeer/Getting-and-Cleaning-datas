Getting and Cleaning Data - Assignment project.

This is the assignment project for the 'Getting & Cleaning Data' course, part of the Data Speciialisations program on http://coursera.org

The codebook: codebook.md describes the variables, the data and transformations made to clean up the data. 

Please ensure your working directory is set appropriately. 

The R script (run_analysis.R) will:

1. Download an unzip file creating new folder "UCI HAIR DATASET" containing all required data for the project
2. Open relavnt packages require to complete tasks
	- Data.table and dplyr (aggregate function)
3. Load in relevant data to R
	- Not all data in the zip is required for this project. Unnecessary data (from the inertial signals folder) will not be loaded for efficency purposes. The variables: "features", "activity_labels", "train_set", "train_labels", "subject_train_id", "test_set", "test_labels", "subject_test_id" are produced.  
4. Apply column names to the data
	- Column names for the variables are found in the second columm of the features document. Activity labels were simply labelled "Labels" while students are identified from "Studentid".
5. Merge the training and test data sets into one complete data set (mergeddata)
	- This produces a data frame "mergeddata" which contrains data from all test and training tables.
6. Extract required measurements (mean and standard deviation) to create final data set (completedata)
	- This produces a completed data frame containing Subjectid and activity labels columns along with only variables containing the mean or standard deviation for each measurment. 
7. Applies descriptive activity labels to data set
	- Activity labels are applied to the labels columns as supplied by the zipped file. 
8. Relabels descriptive variable names to improve understanding
	- Where possible, variable names altered to include descriptive terms improving understanding. The codebook contains further data on each variable.
9. Creates an independent tidy data with the mean of each variable for each subject and activity. The data has been sorted in order first by subjectid then activity label.
	- The tidy data set arranges the data according to subject and activity with the mean for each variable. 
10. A text version of this independent data set has been uploaded

