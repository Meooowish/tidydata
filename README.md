# tidydata

Steps of run_analysis.R script

1. read all the necessary text files as data tables, and assign them to variables. Rename columns at the same time 
in prevision of merging. 

2. Merge all data tables:
  2.1 First the X train and test tables
  2.2 Second the y train and test tables
  2.3 Third the subject train and test tables
  2.4 Bind all three.

3. Create a new table that only contains the mean and standard deviation measurements. 

4. Use the activity label table to name the activities in the data set. 

5. Rename columns with clearer names

6. Create a second, independent tidy data set with the average of each variable for each activity and each subject.

