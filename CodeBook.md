## CodeBook for the tidy dataset

The features selected for this database include triaxial acceleration from the accelerometer (total acceleration) and the estimated body acceleration and triaxial Angular velocity from the gyroscope along with identifiers of all subjects and the name of the activity performed during the measurement.

The resulting file contains only means and standard deviations aggregated by subject and activity.

For more information about the experiment see the original [README.txt](https://raw.githubusercontent.com/bilus/getdata-006/master/README.txt).

Please see the original [description of features](https://raw.githubusercontent.com/bilus/getdata-006/master/features_info.txt) for details.

### Column names

Subject - numerical identifiers of subjects participating in this experiment.

Activity - activity labels, one of: WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING.

Columns containing averages of column values obtained from the original data set, aggregated by subject and activity.

Example:

- tBodyAcc mean X - body acceleration X axis mean
- tBodyAcc std X - body acceleration X axis standard deviation

### Description of features

The features selected for this database come from the accelerometer and gyroscope 3-axial raw signals tAcc-XYZ and tGyro-XYZ. These time domain signals (prefix 't' to denote time) were captured at a constant rate of 50 Hz. Then they were filtered using a median filter and a 3rd order low pass Butterworth filter with a corner frequency of 20 Hz to remove noise. Similarly, the acceleration signal was then separated into body and gravity acceleration signals (tBodyAcc-XYZ and tGravityAcc-XYZ) using another low pass Butterworth filter with a corner frequency of 0.3 Hz. 

Subsequently, the body linear acceleration and angular velocity were derived in time to obtain Jerk signals (tBodyAccJerk-XYZ and tBodyGyroJerk-XYZ). Also the magnitude of these three-dimensional signals were calculated using the Euclidean norm (tBodyAccMag, tGravityAccMag, tBodyAccJerkMag, tBodyGyroMag, tBodyGyroJerkMag). 

Finally a Fast Fourier Transform (FFT) was applied to some of these signals producing fBodyAcc-XYZ, fBodyAccJerk-XYZ, fBodyGyro-XYZ, fBodyAccJerkMag, fBodyGyroMag, fBodyGyroJerkMag. (Note the 'f' to indicate frequency domain signals). 

These signals were used to estimate variables of the feature vector for each pattern:  
'-XYZ' is used to denote 3-axial signals in the X, Y and Z directions.

Here's a completed list
- tBodyAcc-XYZ
- tGravi- tyAcc-XYZ
- tBodyAccJerk-XYZ
- tBodyGyro-XYZ
- tBodyGyroJerk-XYZ
- tBodyAccMag
- tGravi- tyAccMag
- tBodyAccJerkMag
- tBodyGyroMag
- tBodyGyroJerkMag
- fBodyAcc-XYZ
- fBodyAccJerk-XYZ
- fBodyGyro-XYZ
- fBodyAccMag
- fBodyAccJerkMag
- fBodyGyroMag
- fBodyGyroJerkMag
