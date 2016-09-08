complete <- function(directory, id = 1:332){
	# 'directory' is a character vercor of legth 1 indicating the location of the CSV file
	# 'id' is an integer vector indicating the monitor ID numbeers to be used
	
	#Return a data frame of the borm :
	#id nobs
	#1  117
	#2  1041
	#...
	#where 'id' is the monitor ID number and 'nobs' is the number of comlete cases.
	
	allCSVfiles <- list.files(directory);
	
	# creates a list
	specDataDocuments <- list() 
	
	# creates a list
	 nobs = numeric()
	
	for (i in id){
		csvPath <- paste(directory, "/", allCSVfiles[i], sep="")
	
		currentFic <- read.csv(csvPath)
		cc <- complete.cases(currentFic)
		nobs = c(nobs, sum(cc))
	
		#debug
		#print(nobs)	
	}	
	
	return(data.frame(id, nobs))
}
