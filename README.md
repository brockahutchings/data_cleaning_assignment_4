###By running the file run_analysis.R the following 5 thing will occur in the stated order:

1. Training and test sets will be Merged to create one data set.

2. Only the measurements on the mean and standard deviation for each measurement will be extracted.

3.  Descriptive activity names will be used as names in the data set

4. The data set will be appropriately named using descriptive variable names.

5. An independent tidied data set will be created with the average of each variable for each activity and each subject.

##please note that for more specific explanation of the data transformation ##process there are apple comments in the code

#The output will be 2 dataframes:

1) data_selected which contains all the observation from selected columns.
2) summary_data which contains an average of the variables that are the predictors ordered by subject id and prediction activity.


#The 2 aforementioned data frames have 68 columns and are divided into three parts:

1) id: which named the subject the data comes from.

2) activity: gives the activity of the person.

3) other columns: contain the selection of the mean and standard deviation of the predictors.


#The measurements of the accelerator and gyroscope
#were shortened into the following abbreviations:

t : time
f: fast Fourier transformation
B: Body
X, Y, Z: the axial acceleration or angular orientation
Gyro: angular velocity from the gyroscope
ACC: acceleration from the accelerator
std: standard deviation

