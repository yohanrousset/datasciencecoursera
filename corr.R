corr <- function(directory, threshold = 0)
{
	# 'directory' is a character vercor of legth 1 indicating the location of the CSV file
	# 'threshold' is a numeric vector of length 1 indicating the number of completely observed observations (on all variables) required to compute the correlation between nitrate ans sulfate; the default is 0)
	
	#Return a numeric vector of correlations 
	# NOTE : DO not round the result!
	
	allCSVfiles <- list.files(directory)
	
	# creates variable
	vCor <- c()
	nobs <- numeric()
	
	for (i in 1:length(allCSVfiles))
	{
	
		currentFic <- read.csv(paste(directory, "/", allCSVfiles[i], sep=""))
		#print(currentFic)
		
		#Number of observations
		nobs <- sum(complete.cases(currentFic))

		#Number of observations vs threshold test
		if(nobs > threshold)
		{
			#print(paste("nbos = ",nobs," > ",threshold))
			
			#Calculation of correlation (remove NA)
			correlation <- cor(currentFic[2],currentFic[3],use="complete.obs")
			#print(paste("correlation = ",correlation))

			#Append correlation
			vCor <- c(vCor, correlation) 
		}		
	}	
	
	#print(vCor)
	
	#return vector of correlations
	return(vCor)
}

	
