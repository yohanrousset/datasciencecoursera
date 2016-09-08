pollutantmean <- function(directory, pollutant, id = 1:332){
	# 'directory' is a character vercor of legth 1 indicating the location of the CSV file
	# 'pollutant' is a character vector of legth 1 indicating the name of the pollutant for which will calculate the mean; either "sulfate" or "nitrate"
	# 'id' is an integer vector indicating the monitor ID numbeers to be used
	
	#Return the mean of the pollutant across all monitors list in the 'id' vector (ignoring NA values)
	# NOTE : DO not round the result!
	
	allCSVfiles <- list.files(directory);
	
	# creates a list
	specDataDocuments <- list() 
	
	# creates a list
	sulfate <- vector()
	nitrate <- vector()
	
	
	for (i in id){
		currentFic <- read.csv(paste(directory, "/", allCSVfiles[i], sep=""))
		#Add "SULFATE" data to the list [2]
		sulfate <- rbind(sulfate ,currentFic[2])
		#Add "NITRATE" data to the list [3]
		nitrate <- rbind(nitrate,currentFic[3])
		
	}	
	
	#Cleaning vector sulfate/nitrate from "NA' values
	sulfateClean <- lapply(sulfate, function(x) x[!is.na(x)])
	nitrateClean <- lapply(nitrate, function(x) x[!is.na(x)])

	#Calculate mean values of data
	sulfateMean <- mean(sulfateClean$sulfate,na.rm = TRUE)
	nitrateMean <- mean(nitrateClean$nitrate,na.rm = TRUE)
	
	#return arguments
	if(pollutant == "sulfate"){
		return(sulfateMean)
	}
	if(pollutant == "nitrate"){
		return(nitrateMean)
	}
}
