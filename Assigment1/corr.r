corr <- function (directory,threshold=0){
##Write a function that takes a directory of data files and a threshold for complete cases and calculates the correlation between sulfate and nitrate for monitor locations where the number of completely observed cases (on all variables) is greater than the threshold. The function should return a vector of correlations for the monitors that meet the threshold requirement. If no monitors meet the threshold requirement, then the function should return a numeric vector of length 0. A prototype of this function follows
    
    
    wd <- "G:\\Data\\rprog-data-specdata\\"
    path <- paste(wd,directory, sep = "", collapse = NULL)
    
    ##print(path)
    
    setwd(path)
    filelist <- list.files(path=".")
    x <- length(filelist)
    i<-1
    
    dataset <- data.frame()
    rowcount <- data.frame()
    corrdata <- data.frame()
    sulfate <- vector()
    nitrate <- vector()
    corr <- vector()
    
    while (i <= x) {
        

        dataset <- read.csv(filelist[i])
        rowcount<- NROW(na.omit(dataset))
        
        
        if(rowcount > threshold){
            corrdata <- read.csv(filelist[i])
            corrdata <- na.omit(corrdata)
            
            sulfate=corrdata$sulfate
            nitrate=corrdata$nitrate
            
            corr <- cbind(corr,cor(sulfate,nitrate))
        }
        i <- i+1
    }

    print(corr)
}