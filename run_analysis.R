#note that plyr & dplyr package must be installed
library(plyr)
library(dplyr)

# if the data doesn't already exist in the working directory, then get the data
if (!file.exists("UCI HAR Dataset")) {
    fileUrl <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
    zipFname <- "movementData.zip"
    download.file(fileUrl, destfile = zipFname)
    unzip(zipFname)
}

#==========================================
#Parts 1 & 3 of the assignment specification are completed below
#==========================================

#bind the activity train and test data together
actData <- rbind(read.table("./UCI HAR Dataset/train/y_train.txt"), 
                 read.table("./UCI HAR Dataset/test/y_test.txt"))

#add the activity descriptors (note: join function doesn't reorder data like 
#merge does)
actData <- join(actData, read.table("./UCI HAR Dataset/activity_labels.txt"))

#add the subject train and test data
actData <- cbind(actData, 
                 rbind(read.table("./UCI HAR Dataset/train/subject_train.txt"), 
                       read.table("./UCI HAR Dataset/test/subject_test.txt")))

#add the measurement train and test data
actData <- cbind(actData, 
                 rbind(read.table("./UCI HAR Dataset/train/X_train.txt"), 
                       read.table("./UCI HAR Dataset/test/X_test.txt")))

#==========================================
#Part 4 of the assignment specification is completed below
#==========================================

#get the descriptive feature names and
#replace any hyphens "-" in these names with periods "."
features <- gsub("-", ".", read.table("./UCI HAR Dataset/features.txt")[,2])

#add descriptive variable names to the dataset
names(actData) <- c("ActId", "ActDesc", "Subject", features)

#==========================================
#Part 2 of the assignment specification is completed below
#==========================================

#only select the activity id, activity description and subject columns, along
#with measurement columns that contain mean() and std()
selectCols <- c(TRUE, TRUE, TRUE, grepl("mean\\(\\)|std\\(\\)", features))
actData <- actData[,selectCols]

#==========================================
#Part 5 of the assignment specification is completed below
#==========================================

#create the tidy dataset
#this dataset consist of averaging each measurement
#variable for each combination of activity and subject
tidyData <- actData %>% 
            group_by(ActDesc, ActId, Subject) %>% 
            summarise_each(funs(mean))

write.csv(tidyData, file = "tidyData.csv", row.names = FALSE)