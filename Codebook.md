#Project Description

The goal of the project is to create a tidy dataset of movement data. The variables in this dataset are described in the third section of this codebook.

The background to how the raw input dataset was created is contained in the following link:

http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

The raw input dataset can be accessed from the following link:

https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip


#Creating the tidy dataset

The tidy dataset was created by following these steps:  
1. If the input data does not exist in the working directory, then it is downloaded and unzipped  
2. The training and test data are combined into one dataset. This includes activity IDs, activity descriptions, subjects and the measurement variables.  
3. Meaningful column names are assigned to the dataset using the names in features.txt (included in the input zip file)  
4. The dataset is then subsetted to include only the activity ID, activity description, subject, mean and standard deviation variables. Mean and standard deviation variables were identified by having mean() and std() in the column name.  
5. The tidy dataset tidyData.csv is created by calculating the averages for the mean and standard deviation variables for each combination of activity and subject.  

The data in tidyData.csv is in wide form and is tidy because:
* each column contains one and only one variable  
* each row contains one and only observation (in this case, an observation is the means of the measurement variables for each combination of activity and subject)  

The dataset in tidyData.csv can be viewed by entering the following lines of code in R (assuming you have downloaded tidyData.csv to your working directory):  
* tidyData2 <- read.csv("tidyData.csv")
* View(tidyData2)

#Variables in the tidy dataset

* ActDesc: a text description of the activity with the following possible values:  
+ WALKING (value 1): subject was walking during the test  
+ WALKING_UPSTAIRS (value 2): subject was walking up a staircase during the test  
+ WALKING_DOWNSTAIRS (value 3): subject was walking down a staircase during the test  
+ SITTING (value 4): subject was sitting during the test  
+ STANDING (value 5): subject was standing during the test  
+ LAYING (value 6): subject was laying down during the test  
* ActId: an integer value between 1 and 6 inclusive corresponding the ActDesc variable  
-Subject: an integer value between 1 and 30 represent the person whose movements produces the measurement values below  
-tBodyAcc.mean().X: this variable and all the variables below are decimal values representing the average of the measurements for the activity and subject identified in the ActDesc and Subject columns.  
-tBodyAcc.mean().Y  
-tBodyAcc.mean().Z  
-tBodyAcc.std().X  
-tBodyAcc.std().Y  
-tBodyAcc.std().Z  
-tGravityAcc.mean().X  
-tGravityAcc.mean().Y  
-tGravityAcc.mean().Z  
-tGravityAcc.std().X  
-tGravityAcc.std().Y  
-tGravityAcc.std().Z  
-tBodyAccJerk.mean().X  
-tBodyAccJerk.mean().Y  
-tBodyAccJerk.mean().Z  
-tBodyAccJerk.std().X  
-tBodyAccJerk.std().Y  
-tBodyAccJerk.std().Z  
-tBodyGyro.mean().X  
-tBodyGyro.mean().Y  
-tBodyGyro.mean().Z  
-tBodyGyro.std().X  
-tBodyGyro.std().Y  
-tBodyGyro.std().Z  
-tBodyGyroJerk.mean().X  
-tBodyGyroJerk.mean().Y  
-tBodyGyroJerk.mean().Z  
-tBodyGyroJerk.std().X  
-tBodyGyroJerk.std().Y  
-tBodyGyroJerk.std().Z  
-tBodyAccMag.mean()  
-tBodyAccMag.std()  
-tGravityAccMag.mean()  
-tGravityAccMag.std()  
-tBodyAccJerkMag.mean()  
-tBodyAccJerkMag.std()  
-tBodyGyroMag.mean()  
-tBodyGyroMag.std()  
-tBodyGyroJerkMag.mean()  
-tBodyGyroJerkMag.std()  
-fBodyAcc.mean().X  
-fBodyAcc.mean().Y  
-fBodyAcc.mean().Z  
-fBodyAcc.std().X  
-fBodyAcc.std().Y  
-fBodyAcc.std().Z  
-fBodyAccJerk.mean().X  
-fBodyAccJerk.mean().Y  
-fBodyAccJerk.mean().Z  
-fBodyAccJerk.std().X  
-fBodyAccJerk.std().Y  
-fBodyAccJerk.std().Z  
-fBodyGyro.mean().X  
-fBodyGyro.mean().Y  
-fBodyGyro.mean().Z  
-fBodyGyro.std().X  
-fBodyGyro.std().Y  
-fBodyGyro.std().Z  
-fBodyAccMag.mean()  
-fBodyAccMag.std()  
-fBodyBodyAccJerkMag.mean()  
-fBodyBodyAccJerkMag.std()  
-fBodyBodyGyroMag.mean()  
-fBodyBodyGyroMag.std()  
-fBodyBodyGyroJerkMag.mean()  
-fBodyBodyGyroJerkMag.std()  