#Read feature.txt into variable
list_features <- read.table("C:/Users/BAH/Documents/R_working_directory/Coursework/DataVis/Assignment_4/features.txt")

names(list_features) <- c("n", "variable")

#Read subject_test.txt into variable
subject_test <- read.table("C:/Users/BAH/Documents/R_working_directory/Coursework/DataVis/Assignment_4/test/subject_test.txt") 

#read t_test.txt into variable
x_tst <- read.table("C:/Users/BAH/Documents/R_working_directory/Coursework/DataVis/Assignment_4/test/X_test.txt") 

#read y_test.txt into variable
y_tst <- read.table("C:/Users/BAH/Documents/R_working_directory/Coursework/DataVis/Assignment_4/test/y_test.txt")

#read subject_train.txt into variable
subject_trn <- read.table("C:/Users/BAH/Documents/R_working_directory/Coursework/DataVis/Assignment_4/train/subject_train.txt")

#read x_train.txt into variable
x_trn <- read.table("C:/Users/BAH/Documents/R_working_directory/Coursework/DataVis/Assignment_4/train/X_train.txt") 

#read y_train.txt into variable
y_trn <- read.table("C:/Users/BAH/Documents/R_working_directory/Coursework/DataVis/Assignment_4/train/y_train.txt") 


##############MERGE DATA###############

#Merges the training and the test sets to create one data set.

##merge the train and test sets
subjects <- rbind(subject_trn, subject_test)

#merge the data from y_trn and y_tst
prediction <- rbind(y_trn, y_tst) 

#merge the data from x_trn and x_tst
predictors <- rbind(x_trn, x_tst) 

#add headings to subjects
names(subjects) <- c("id")

#add heading to prediction
names(prediction) <- c("activity")

#add heaading to predictord
names(predictors) <- list_features$variable

##bind subject, prediction and predictors
all_data <- cbind(subjects, prediction, predictors)

#Extracts only the measurements on the mean and standard deviation for each measurement

mean_columns <- grep("[Mm][Ee][Aa][Nn]\\(\\)", names(all_data))

std_columns <- grep("[Ss][Tt][Dd]\\(\\)", names(all_data)) 

mean_std <- subset(all_data, select=c( mean_columns, std_columns))

#Uses descriptive activity names to name the activities in the data set

#Read activity_labels.txt 
activity_labels <- read.table("C:/Users/BAH/Documents/R_working_directory/Coursework/DataVis/Assignment_4/activity_labels.txt")

names(activity_labels) <- c("n", "activity")

activity_labels$activity <- tolower(activity_labels$activity)
#Set up labels for activity column
activity <- factor(prediction$activity, levels = c(1, 2, 3, 4, 5, 6),
                   labels = activity_labels$activity)

data_selected <- cbind(subjects, activity, mean_std)

#labels the data set with descriptive variable names.
names(data_selected) <- sub("\\(\\)", "", names(data_selected))

names(data_selected) <- sub("[Body]{2,}", "B", names(data_selected))

#create a second data set with the average of each variable for each activity
#and each subject.
melt_data_selected <- melt(data_selected, id.vars = c("id", "activity"),
                           measure.vars = c(3:68))
##save into summary_table
summary_table <- dcast(tmp0, id+activity~ variable,  mean)

write.table