#State : iso2 abbreviated name of a state
#Outcome : outcome name
best <- function(state, outcome) {
	## Read outcome data
	outcomeFile <- read.csv("outcome-of-care-measures.csv", colClasses = "character")

	## Check that state and outcome are valid
	validState <- unique(outcomeFile$State)
	validOutcome <- c("heart attack","heart failure","pneumonia")
	
	#print(validState)
	#print(validOutcome)
	
	#Check if input values are authorized
	isStateMatch <- match(state, validState)
	isOutcomeMatch <- match(outcome, validOutcome)
	
	if(is.na(isStateMatch)){stop("invalid state")}
	if(is.na(isOutcomeMatch)){stop("invalid outcome")}
	
	filterStateMatrix2 <- subset(outcomeFile,outcomeFile$State == state)

	#print(paste("debug - nrow(filterStateMatrix2) in State =",nrow(filterStateMatrix2)))
		
	## Return hospital name in that state with lowest 30-day death rate
	if(outcome == "heart attack"){
		# 11 - Hospital.30.Day.Death..Mortality..Rates.from.Heart.Attack
		#Cast in numeric value
		filterStateMatrix2$Hospital.30.Day.Death..Mortality..Rates.from.Heart.Attack <- suppressWarnings( as.numeric(filterStateMatrix2$Hospital.30.Day.Death..Mortality..Rates.from.Heart.Attack))
		#Remove NA
		filterStateMatrix2 = filterStateMatrix2[!is.na(filterStateMatrix2$Hospital.30.Day.Death..Mortality..Rates.from.Heart.Attack),]
		#Order the list
		filterStateMatrix2 = filterStateMatrix2[order(filterStateMatrix2$Hospital.30.Day.Death..Mortality..Rates.from.Heart.Attack, filterStateMatrix2$Hospital.Name),]
		
	}
	if(outcome == "heart failure"){
		# 17 - Hospital.30.Day.Death..Mortality..Rates.from.Heart.Failure
		#Cast in numeric value
		filterStateMatrix2$Hospital.30.Day.Death..Mortality..Rates.from.Heart.Failure <- suppressWarnings( as.numeric(filterStateMatrix2$Hospital.30.Day.Death..Mortality..Rates.from.Heart.Failure))
		#Remove NA
		filterStateMatrix2 = filterStateMatrix2[!is.na(filterStateMatrix2$Hospital.30.Day.Death..Mortality..Rates.from.Heart.Failure),]
		#Order the list
		filterStateMatrix2 = filterStateMatrix2[order(filterStateMatrix2$Hospital.30.Day.Death..Mortality..Rates.from.Heart.Failure, filterStateMatrix2$Hospital.Name),]
		
	}
	if(outcome == "pneumonia"){
		# column 23 - Hospital.30.Day.Death..Mortality..Rates.from.Pneumonia
		#Cast in numeric value
		filterStateMatrix2$Hospital.30.Day.Death..Mortality..Rates.from.Pneumonia <- suppressWarnings( as.numeric(filterStateMatrix2$Hospital.30.Day.Death..Mortality..Rates.from.Pneumonia))
		#Remove NA
		filterStateMatrix2 = filterStateMatrix2[!is.na(filterStateMatrix2$Hospital.30.Day.Death..Mortality..Rates.from.Pneumonia),]
		#Order the list
		filterStateMatrix2 = filterStateMatrix2[order(filterStateMatrix2$Hospital.30.Day.Death..Mortality..Rates.from.Pneumonia, filterStateMatrix2$Hospital.Name),]
		
	}
	
	#print(paste("debug - nrow(filterStateMatrix2) not NA =",nrow(filterStateMatrix2)))
	#print(paste("debug - head(filterStateMatrix2)  =",head(filterStateMatrix2)))
	
	return (filterStateMatrix2$Hospital.Name[1])
}

# TEST
# > source("best.R")
# > best("TX", "heart attack")
# [1] "CYPRESS FAIRBANKS MEDICAL CENTER"
# > best("TX", "heart failure")
# [1] "FORT DUNCAN MEDICAL CENTER"
# > best("MD", "heart attack")
# [1] "JOHNS HOPKINS HOSPITAL, THE"
# > best("MD", "pneumonia")
# [1] "GREATER BALTIMORE MEDICAL CENTER"
# > best("BB", "heart attack")
# Error in best("BB", "heart attack") : invalid state
# > best("NY", "hert attack")
# Error in best("NY", "hert attack") : invalid outcome

