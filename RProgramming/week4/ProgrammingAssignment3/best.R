best <- function(state, outcome) {
  ## Read outcome data
  data <- read.csv("outcome-of-care-measures.csv", colClasses = "character")
  
  ## Check that state and outcome are valid
  stateList <- unique(data$State)
  if (!state %in% stateList) {
    stop("invalid state")
  }
  
  outcomeList <- list("heart attack", "heart failure", "pneumonia")
  outcomeIndex <- list("heart attack" = 11, "heart failure" = 17, "pneumonia" = 23)
  if (! outcome %in% outcomeList) {
    stop("invalid outcome")
  } else {
    index = outcomeIndex[[outcome]]
  }
  
  ## Return hospital name in that state with lowest 30-day death rate
  stateData <- data[grep(state,data$State), c("State", "Hospital.Name", names(data)[index])]
  stateData[,3] <- as.numeric(stateData[,3])
  stateData <- stateData[complete.cases(stateData),]
  stateData <- stateData[order(stateData[, 3], stateData[,2]),]
  stateData[1, "Hospital.Name"]
}

# best("TX", "heart attack")
# best("TX", "heart failure")
# best("MD", "heart attack")
# best("MD", "pneumonia")
# best("BB", "heart attack")
# best("NY", "hert attack")
