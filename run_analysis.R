onlyInterestingColumns <- function(columnLabels) {
  # We only want the subject id and mean and standard deviation columns.
  columnLabels[grepl("(^Subject$)|(.mean)|(.std)|(Activity)", columnLabels)]
}

activityNames <- function(activities, activityCodes) {
  activities[activities$Code==activityCodes,]$Label
}

makeDescriptiveNames <- function(columnLabels) {
  make.names(columnLabels)
}

makeColNamesUserFriendly <- function(ds) {
  # FIXME: Repetitive.
  
  # Convert any number of consecutive dots to a single space.
  names(ds) <- gsub(x = names(ds),
                    pattern = "(\\.)+",
                    replacement = " ")
  
  # Drop the trailing spaces.
  names(ds) <- gsub(x = names(ds),
                    pattern = "( )+$",
                    replacement = "")
  
  ds
}

cleanData <- function(features, subjects, featureData, activities, activityData) {
  # Combine the column containing the identifiers of subjects with columns holding the training data and activities.
  normalizedData <- data.frame(subjects, featureData, lapply(activityData$V1, function(activityCode) activities[activities$Code==activityCode,]$Label ))
  # Add labels for columns. 
  # - Prepend the Subject column because we have added it as the first column.
  columnLabels <- c("Subject", features, "Activity")
  # - Make column labels into valid, descriptive variable names.
  columnLabels <- makeDescriptiveNames(columnLabels)
  # - Set column names in the training data frame.
  colnames(normalizedData) <- columnLabels
  # Select only the columns we're interested in.
  normalizedData[onlyInterestingColumns(columnLabels)]
}

saveAverages <- function(mergedData, filename) {
  renameColumn <- function(ds, from, to) {
    names(ds)[names(ds) == from] <- to
    ds
  }
  
  averages <- suppressWarnings(aggregate(mergedData, by=list(mergedData$Subject, mergedData$Activity), FUN=mean))
  cols <- colnames(averages)[cols != "Activity" & cols != "Subject"]
  averages <- averages[, cols]
  averages <- renameColumn(averages, "Group.1", "Subject")
  averages <- renameColumn(averages, "Group.2", "Activity")
  averages <- makeColNamesUserFriendly(averages)
  write.table(averages, file=filename, row.names=FALSE)
}

# Read in feature labels. Do not interpret the strings.
features <- read.table("features.txt", as.is=TRUE)$V2
# Read in activity labels. Do not interpret the strings.
activities <- read.table("activity_labels.txt", as.is=TRUE)
# Use intuitive column names.
colnames(activities) <- c("Code", "Label")

# Read training data & subjects.
trainData <- read.table("train/X_train.txt", header=FALSE)
trainSubjects <- read.table("train/subject_train.txt", header=FALSE)
trainActivityData <- read.table("train/y_train.txt", header=FALSE)

# Read test data & subjects.
testData <- read.table("test/X_test.txt", header=FALSE)
testSubjects <- read.table("test/subject_test.txt", header=FALSE)
testActivityData <- read.table("test/y_test.txt", header=FALSE)

# Clean training & test data.
cleanTrainingData <- cleanData(features, trainSubjects, trainData, activities, trainActivityData)
cleanTestData <- cleanData(features, testSubjects, testData, activities, testActivityData)

# Merge test & training data row-wise.
mergedData <- rbind(cleanTestData, cleanTrainingData)

# Aggregate averages by subject and activity. 
saveAverages(mergedData, "tidy_dataset.txt")

# Save the whole data set.
# mergedData <- makeColNamesUserFriendly(mergedData)
# write.csv(mergedData, file="all_data.csv", row.names=FALSE)
