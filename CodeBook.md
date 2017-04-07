Here are the steps taken to create 2 tidy data frames as required


The Preparation

Read feature.txt that contains the names of the columns for X_train.txt, Y_test.txt.

 list_features 
 names(list_features) 

Reads the test data

 subject_tst: #ID of the subject who carry out the activity 
 x_tst: #variables to predict.
 y_tst: #predicts one of the activity labels

Read all the train data

 subject_trn:  #ID of the subject who carry out the activity
 x_trn:  #variables to predict.
 y_trn: #predicts one of the activity labels

1. Merges the training and the test sets to create one data set.

 subjects: #join into one data the train and test ones the ID from which the obs comes from.
 prediction: #join into one data the results for the predictions 
 predictors: #join into one data the variables to use to make the prediction.

Name columns of predictors that is the data frame that contains merged X_train.txt and Y_test.txt files.
name column of subjects and precition as well.

 names(subjects)
 names(prediction)
 names(predictors) 

all_data: bind subject, prediction and predictors in one data frame.


2. Extracts only the measurements on the mean and standard deviation for each measurement.

 mean_columns: #index of columns with mean() variable estimated as per features_info.txt.

 std_columns: #index of columns with std() variable estimated as per features_info.txt.

 mean_std: #select only the columns that has mean and standard deviation


3.  Uses descriptive activity names to name the activities in the data set

    First, Read activity_labels.txt 

      activity_labels 
      names(activity_labels)
      activity_labels$activity 

    activity: #Set up labels for activity column in all_data.

    data_selected: #bind again wanted data with appropiate label for activity.

4. Appropriately labels the data set with descriptive variable names.


    names(data_selected) 
    names(data_selected)

5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.

    melt_data_selected <- melt(data_selected, id.vars = c("id", "activity"), measure.vars = c(3:68))
    summary_table <- dcast(tmp0, id+activity~ variable,  mean)




