# Code Book

This code book summarizes the resulting data fields in `tidy.txt`.

## Identifiers

* `SubjectID` - The ID of the test subject
* `ActivityID` - The ID of the Activity performed
* `ActivityName` - The type of activity performed when the corresponding measurements were taken

## Measurements

[1] "SubjectID"                                      "ActivityName"                                   "ActivityID"                                    
 [4] "timeBodyAccelerometer-mean()-X"                 "timeBodyAccelerometer-mean()-Y"                 "timeBodyAccelerometer-mean()-Z"                
 [7] "timeBodyAccelerometer-std()-X"                  "timeBodyAccelerometer-std()-Y"                  "timeBodyAccelerometer-std()-Z"                 
[10] "timeGravityAccelerometer-mean()-X"              "timeGravityAccelerometer-mean()-Y"              "timeGravityAccelerometer-mean()-Z"             
[13] "timeGravityAccelerometer-std()-X"               "timeGravityAccelerometer-std()-Y"               "timeGravityAccelerometer-std()-Z"              
[16] "timeBodyAccelerometerJerk-mean()-X"             "timeBodyAccelerometerJerk-mean()-Y"             "timeBodyAccelerometerJerk-mean()-Z"            
[19] "timeBodyAccelerometerJerk-std()-X"              "timeBodyAccelerometerJerk-std()-Y"              "timeBodyAccelerometerJerk-std()-Z"             
[22] "timeBodyGyroscope-mean()-X"                     "timeBodyGyroscope-mean()-Y"                     "timeBodyGyroscope-mean()-Z"                    
[25] "timeBodyGyroscope-std()-X"                      "timeBodyGyroscope-std()-Y"                      "timeBodyGyroscope-std()-Z"                     
[28] "timeBodyGyroscopeJerk-mean()-X"                 "timeBodyGyroscopeJerk-mean()-Y"                 "timeBodyGyroscopeJerk-mean()-Z"                
[31] "timeBodyGyroscopeJerk-std()-X"                  "timeBodyGyroscopeJerk-std()-Y"                  "timeBodyGyroscopeJerk-std()-Z"                 
[34] "timeBodyAccelerometerMagnitude-mean()"          "timeBodyAccelerometerMagnitude-std()"           "timeGravityAccelerometerMagnitude-mean()"      
[37] "timeGravityAccelerometerMagnitude-std()"        "timeBodyAccelerometerJerkMagnitude-mean()"      "timeBodyAccelerometerJerkMagnitude-std()"      
[40] "timeBodyGyroscopeMagnitude-mean()"              "timeBodyGyroscopeMagnitude-std()"               "timeBodyGyroscopeJerkMagnitude-mean()"         
[43] "timeBodyGyroscopeJerkMagnitude-std()"           "frequencyBodyAccelerometer-mean()-X"            "frequencyBodyAccelerometer-mean()-Y"           
[46] "frequencyBodyAccelerometer-mean()-Z"            "frequencyBodyAccelerometer-std()-X"             "frequencyBodyAccelerometer-std()-Y"            
[49] "frequencyBodyAccelerometer-std()-Z"             "frequencyBodyAccelerometerJerk-mean()-X"        "frequencyBodyAccelerometerJerk-mean()-Y"       
[52] "frequencyBodyAccelerometerJerk-mean()-Z"        "frequencyBodyAccelerometerJerk-std()-X"         "frequencyBodyAccelerometerJerk-std()-Y"        
[55] "frequencyBodyAccelerometerJerk-std()-Z"         "frequencyBodyGyroscope-mean()-X"                "frequencyBodyGyroscope-mean()-Y"               
[58] "frequencyBodyGyroscope-mean()-Z"                "frequencyBodyGyroscope-std()-X"                 "frequencyBodyGyroscope-std()-Y"                
[61] "frequencyBodyGyroscope-std()-Z"                 "frequencyBodyAccelerometerMagnitude-mean()"     "frequencyBodyAccelerometerMagnitude-std()"     
[64] "frequencyBodyAccelerometerJerkMagnitude-mean()" "frequencyBodyAccelerometerJerkMagnitude-std()"  "frequencyBodyGyroscopeMagnitude-mean()"        
[67] "frequencyBodyGyroscopeMagnitude-std()"          "frequencyBodyGyroscopeJerkMagnitude-mean()"     "frequencyBodyGyroscopeJerkMagnitude-std()"     

## Activity IDs

* `WALKING` (value `1`): subject was walking during the test
* `WALKING_UPSTAIRS` (value `2`): subject was walking up a staircase during the test
* `WALKING_DOWNSTAIRS` (value `3`): subject was walking down a staircase during the test
* `SITTING` (value `4`): subject was sitting during the test
* `STANDING` (value `5`): subject was standing during the test
* `LAYING` (value `6`): subject was laying down during the test
