pollutantmean <- function(directory, pollutant, id = 1:332) {
        ## 'directory' is a character vector of length 1 indicating
        ## the location of the CSV files

        ## 'pollutant' is a character vector of length 1 indicating
        ## the name of the pollutant for which we will calculate the
        ## mean; either "sulfate" or "nitrate".

        ## 'id' is an integer vector indicating the monitor ID numbers
        ## to be used

        ## Return the mean of the pollutant across all monitors list
        ## in the 'id' vector (ignoring NA values)
  
  #setwd("d:/DataScience/R/week2/")
  #setwd("d:/DataScience/R/week2/specdata/")
  #setwd(directory)
  
  temp<-vector(mode = "numeric")
  
  for(i in id) {
    fname <- paste(directory,"/",sprintf("%03d.csv", i), sep="")
    data <- read.csv(fname)
    #data$pollutant
    nas<-is.na(data[[pollutant]])
    filedata <- data[[pollutant]][!nas]
    temp <- c(temp,filedata)
  }
  mean(temp)
}