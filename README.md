## Getting and Cleaning Data Course Project

### Introduction

This is an introduction to a simple R script running basic cleanup and simplification of results of a research initiative performed at UCI.

For more information see the original [README.txt](https://github.com/bilus/getdata-006/blob/master/README.txt).

### How to run

Unfortunately, due to GitHub limations, this repository isn't self-contained, the train/ and test/ directories are deliberately empty and you have to follow this more cumbersome procedure:

1. Download the data from https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

2. Extract it to a folder.

3. Copy the [run_analysis.R](https://raw.githubusercontent.com/bilus/getdata-006/master/run_analysis.R) script to the folder. (Either copy the Raw version of the script from this GitHub repository or clone it from the command line using `git clone https://github.com/bilus/getdata-005.git`.)

4. Load the script into R Studio or run the script from command line. 

*Note: When using R Studio, make sure to set working directory to the script's location (on OS/X, it's "Session" > "Set Working Directory" > "To Source File Location")*

The result will be saved to clean_data.csv.

### Analysis overview

1. Read in feature and activity labels from "features.txt" and "activity_labels.txt".

2. Read training and test data from the revelant files.

3. Clean training & test data.

- Combine the column containing the identifiers of subjects with columns holding the training data and activities. Name the new columns "Subject" and "Activity".
- Make column labels into valid, descriptive variable names.
- Select only the columns we're interested in: Subject, Activity, mean and standard deviation.

4. Merge test & training data row-wise.

5. Make column names user-friendly by converting dots to spaces. 

6. Aggregate rows by Subject and Activity.

7. Save the resulting data set to [tidy_dataset.txt](https://raw.githubusercontent.com/bilus/getdata-006/master/tidy_dataset.txt).

### CodeBook for the tidy dataset

The CodeBook is in a [separate file](CodeBook.md).
