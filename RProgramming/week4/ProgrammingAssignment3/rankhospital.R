rankhospital <- function(state, outcome, num = "best") {
  ## Read outcome data
  data <- read.csv("outcome-of-care-measures.csv", colClasses = "character")
  
  ## Check that state and outcome are valid
  stateList <- unique(data$State)
  if (!state %in% stateList) {
    stop("invalid state")
  }
  
  ## Check the outcome
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
  
  ## Check the num, it can be either best/worst/number
  if (num == "best") {
    num <- 1
  } else if (num == "worst") {
    num <- nrow(stateData)
  } else if (num > nrow(stateData)) {
    NA
    return
  }
  
  stateData[num, "Hospital.Name"]
  
}

# rankhospital("TX", "heart failure", 4)
# rankhospital("MD", "heart attack", "worst")
# rankhospital("MN", "heart attack", 5000)
