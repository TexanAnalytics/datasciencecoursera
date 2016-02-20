pollutantmean <- function (directory,pollutant,id=1:332){
##Write a function named 'pollutantmean' that calculates the mean of a pollutant (sulfate or nitrate) across a specified list of monitors. The function 'pollutantmean' takes three arguments: 'directory', 'pollutant', and 'id'. Given a vector monitor ID numbers, 'pollutantmean' reads that monitors' particulate matter data from the directory specified in the 'directory' argument and returns the mean of the pollutant across all of the monitors, ignoring any missing values coded as NA. A prototype of the function is as follows
##
    wd <- "G:\\Data\\rprog-data-specdata\\"
    path <- paste(wd,directory, sep = "", collapse = NULL)
    
    ##print(path)
    
    setwd(path)
    filelist <- list.files(path=".")
    
    
    ##Build data frame including each csv file
    ##This method only works when ###.csv matches number of files
    ##This method is not optimized, lapply,rbinds seem to be faster
    ##for(i in id)
    ##{
        
            # if the merged dataset doesn't exist, create it
    ##        if (!exists("dataset")){
    ##            dataset <- read.csv(filelist[i], header=TRUE)
    ##        }
            
            # if the merged dataset does exist, append to it
    ##        if (exists("dataset")){
    ##            temp_dataset <-read.csv(filelist[i], header=TRUE)
    ##            dataset<-rbind(dataset, temp_dataset)
    ##            rm(temp_dataset)
    ##        }
            
            
    ##}
    dataset <- data.frame()
    
    for (i in id) {
        dataset <- rbind(dataset, read.csv(filelist[i]))
    }
    
    mean(dataset[, pollutant], na.rm = TRUE)
    
    

}