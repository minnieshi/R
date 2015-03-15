complete <- function(directory, id = 1:332) {
  ## 'directory' is a character vector of length 1 indicating
  ## the location of the CSV files
  
  ## 'id' is an integer vector indicating the monitor ID numbers
  ## to be used
  
  ## Return a data frame of the form:
  ## id nobs
  ## 1  117
  ## 2  1041
  ## ...
  ## where 'id' is the monitor ID number and 'nobs' is the
  ## number of complete cases
  
  nobs <- vector(mode = "numeric")
  
  for(i in id) {
    fname <- paste(directory,"/",sprintf("%03d.csv", i), sep="")
    data <- read.csv(fname)
    good <- complete.cases(data$sulfate, data$nitrate)
    #subset(data,good)
    rows <- nrow(subset(data,good))
    nobs <- c(nobs,rows)  
  }
  #cbind(id, nobs)
  data.frame(id,nobs)
}