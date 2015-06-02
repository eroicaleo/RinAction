rankall <- function(outcome, num = "best") {
  ## Read outcome data
  data <- read.csv("outcome-of-care-measures.csv", colClasses = "character")
  
  ## Check that state and outcome are valid
  stateList <- unique(data$State)
    
  ## Check the outcome
  outcomeList <- list("heart attack", "heart failure", "pneumonia")
  outcomeIndex <- list("heart attack" = 11, "heart failure" = 17, "pneumonia" = 23)
  if (! outcome %in% outcomeList) {
    stop("invalid outcome")
  } else {
    index = outcomeIndex[[outcome]]
  }
  
  ## Return hospital name in that state with lowest 30-day death rate
  stateData <- data[, c("State", "Hospital.Name", names(data)[index])]
  stateData[,3] <- as.numeric(stateData[,3])
  stateData <- stateData[complete.cases(stateData),]
  
  ## helper function to process data
  processStateData <- function(stateData, num) {
    stateData <- stateData[order(stateData[, 3], stateData[,2]),]
    if (num == "best") {
      num <- 1
    } else if (num == "worst") {
      num <- nrow(stateData)
    }
    
    if (num > nrow(stateData)) {
      res = list("hospital" = NA, "state" = stateData[1, "State"])
    } else {
      res = list("hospital" = stateData[num, "Hospital.Name"], "state" = stateData[num, "State"])
    }
    res
  }
  
  s <- split(stateData, stateData$State)
  t <- sapply(s, processStateData, num)
  m <- t(matrix(unlist(t), nrow = 2, byrow = FALSE))
  output <- as.data.frame(m)
  colnames(output) <- c("hospital", "state")
  rownames(output) <- output$state
  output
  
}

# head(rankall("heart attack", 20), 10)
# tail(rankall("pneumonia", "worst"), 3)
# tail(rankall("heart failure"), 10)
