Codebook. Assignment project. Getting & Cleaning data.
======================================================

Summary of project details.
The data is from a study assessing human activity recognition using smartphones. The experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz were captured. The experiments have been video-recorded to label the data manually. The obtained dataset has been randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data. 

- Triaxial acceleration from the accelerometer (total acceleration) and the estimated body acceleration.
- Triaxial Angular velocity from the gyroscope. 
- A 561-feature vector with time and frequency domain variables. 
- Its activity label. 
- An identifier of the subject who carried out the experiment.

The dataset includes the following files and their subsequent variable name in R):
=======================================================================================

- 'README.txt'

- 'features_info.txt': Shows information about the variables used on the feature vector.

- 'features.txt': List of all features. (Variable "features").

- 'activity_labels.txt': Links the class labels with their activity name. (Variable "activity_labels").

- 'train/X_train.txt': Training set. (Variable "train_set").

- 'train/y_train.txt': Training labels. (Variable "train_labels").

- 'test/X_test.txt': Test set. (Variable "test_set").

- 'test/y_test.txt': Test labels. (Variable "test_labels").

The following files are available for the train and test data. Their descriptions are equivalent. 

- 'train/subject_train.txt': Each row identifies the subject who performed the activity for each window sample. Its range is from 1 to 30. (Variables "subject_train_id" and "subject_test_id" respectively). 

The accompanying R script will also produce:

- 'merged_train' : Merged training table

- 'merged_test' : Merged test table

- 'mergeddata' : Merged training and test tables to produce a single data frame

- 'completedata' : Data frame containing columns Subjectid, Labels and measurement means and standard deviations. All other data from mergeddata has been extracted

- 'Tidydata' : An independent data set containing the mean of each variable (measurement) for each subject and activity. Sorted by subjectid then activity. 

Code for variable columns
=========================

- "Subjectid" : This is the subject's unique identifying number
- "Labels" : This column contains the name for the activity the subject was undertaking at the time of analysis including 6 labels: Lying, Sitting, Standing, Walking, Walking Upstairs, Walking downstairs                                          
- Data from accelerometer from 3 different planes (X, Y, Z). "TotalBodyAcceleration-Mean()-X", "TotalBodyAcceleration-Mean()-Y", "TotalBodyAcceleration-Mean()-Z", "TotalBodyAcceleration-STD()-X", "TotalBodyAcceleration-STD()-Y", "TotalBodyAcceleration-STD()-Z", "Total GravityAcceleration-Mean()-X", "TotalGravityAcceleration-Mean()-Y", "TotalGravityAcceleration-Mean()-Z", "TotalGravityAcceleration-STD()-X", "TotalGravityAcceleration-STD()-Y", "TotalGravityAcceleration-STD()-Z", "TotalBodyAccelerationJerk-Mean()-X", "TotalBodyAccelerationJerk-Mean()-Y", "TotalBodyAccelerationJerk-Mean()-Z", "TotalBodyAccelerationJerk-STD()-X", "TotalBodyAccelerationJerk-STD()-Y", "TotalBodyAccelerationJerk-STD()-Z", TotalBodyAccelerationMagnitude-Mean()", "TotalBodyAccelerationMagnitude-STD()", "Total GravityAccelerationMagnitude-Mean()", "TotalGravityAccelerationMagnitude-STD()", "TotalBodyAccelerationJerkMagnitude-Mean()", "TotalBodyAccelerationJerkMagnitude-STD()",                
- Data from gyroscope from 3 different planes (X, Y, Z). "TotalBodyGyroscope-Mean()-X", "TotalBodyGyroscope-Mean()-Y", "TotalBodyGyroscope-Mean()-Z", "TotalBodyGyroscope-STD()-X", "TotalBodyGyroscope-STD()-Y", "TotalBodyGyroscope-STD()-Z", "TotalBodyGyroscopeJerk-Mean()-X", "TotalBodyGyroscopeJerk-Mean()-Y", "TotalBodyGyroscopeJerk-Mean()-Z", "TotalBodyGyroscopeJerk-STD()-X", "TotalBodyGyroscopeJerk-STD()-Y", "TotalBodyGyroscopeJerk-STD()-Z", "TotalBodyGyroscopeMagnitude-Mean()", "TotalBodyGyroscopeMagnitude-STD()", "TotalBodyGyroscopeJerkMagnitude-Mean()", "TotalBodyGyroscopeJerkMagnitude-STD()",                   
- Frequency data from acclerometer 3 different planes (X, Y, Z). "FrequencyBodyAcceleration-Mean()-X", "FrequencyBodyAcceleration-Mean()-Y", "FrequencyBodyAcceleration-Mean()-Z", "FrequencyBodyAcceleration-STD()-X", "FrequencyBodyAcceleration-STD()-Y", "FrequencyBodyAcceleration-STD()-Z", "FrequencyBodyAccelerationMagnitude-Mean()", "FrequencyBodyAccelerationMagnitude-STD()", "FrequencyBodyAccelerationMagnitude-MeanFreq()", "FrequencyBodyAccelerationJerkMagnitude-Mean()", "FrequencyBodyAccelerationJerkMagnitude-STD()", "FrequencyBodyAccelerationJerkMagnitude-MeanFreq()", "FrequencyBodyAcceleration-MeanFreq()-X", "FrequencyBodyAcceleration-MeanFreq()-Y", "FrequencyBodyAcceleration-MeanFreq()-Z", "FrequencyBodyAccelerationJerk-Mean()-X", "FrequencyBodyAccelerationJerk-Mean()-Y", "FrequencyBodyAccelerationJerk-Mean()-Z", "FrequencyBodyAccelerationJerk-STD()-X", "FrequencyBodyAccelerationJerk-STD()-Y", "FrequencyBodyAccelerationJerk-STD()-Z", "FrequencyBodyAccelerationJerk-MeanFreq()-X", "FrequencyBodyAccelerationJerk-MeanFreq()-Y", "FrequencyBodyAccelerationJerk-MeanFreq()-Z"       
- Frequency data from Gyroscope 3 different planes (X, Y, Z). "FrequencyBodyGyroscope-Mean()-X", "FrequencyBodyGyroscope-Mean()-Y", "FrequencyBodyGyroscope-Mean()-Z", "FrequencyBodyGyroscope-STD()-X", "FrequencyBodyGyroscope-STD()-Y", "FrequencyBodyGyroscope-STD()-Z", "FrequencyBodyGyroscope-MeanFreq()-X", "FrequencyBodyGyroscope-MeanFreq()-Y", "FrequencyBodyGyroscope-MeanFreq()-Z", "FrequencyBodyGyroscopeMagnitude-Mean()", "FrequencyBodyGyroscopeMagnitude-STD()", "FrequencyBodyGyroscopeMagnitude-MeanFreq()", "FrequencyBodyGyroscopeJerkMagnitude-Mean()", "FrequencyBodyGyroscopeJerkMagnitude-STD()", "FrequencyBodyGyroscopeJerkMagnitude-MeanFreq()", "Angle(tBodyAccelerationMean,Gravity)"             
- Angle variable from averaging the signals in the signal window sample. "Angle(tBodyAccelerationJerkMean),GravityMean)", "Angle(tBodyGyroscopeMean,GravityMean)", "Angle(tBodyGyroscopeJerkMean,GravityMean)", "Angle(X,GravityMean)", "Angle(Y,GravityMean)", "Angle(Z,GravityMean)"  

The set of variables that were estimated from these signals are: 

Mean(): Mean value
STD(): Standard deviation



