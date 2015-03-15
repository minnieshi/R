corr <- function(directory, threshold = 0) {
  ## 'directory' is a character vector of length 1 indicating
  ## the location of the CSV files
  
  ## 'threshold' is a numeric vector of length 1 indicating the
  ## number of completely observed observations (on all
  ## variables) required to compute the correlation between
  ## nitrate and sulfate; the default is 0
  
  ## Return a numeric vector of correlations
  
  completeObs <- complete(directory, id = 1:332)
  filteredid <- subset(completeObs,nobs>threshold, drop=TRUE, select=id)

  result <- vector(mode = "numeric")
  
  ## how to avoid reading data twice??
  for(i in filteredid) {
    fname <- paste(directory,"/",sprintf("%03d.csv", i), sep="")
    data <- read.csv(fname)
    idcor <- cor(data$sulfate, data$nitrate, use="complete.obs")
    result <- c(result,idcor)
  }
  result ## when you see NULL got returned from a function, it is a hint that the value is not set!!!
}