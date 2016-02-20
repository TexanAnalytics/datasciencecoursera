complete <- function (directory,id=1:332){
##Write a function that reads a directory full of files and reports the number of completely observed cases in each data file. The function should return a data frame where the first column is the name of the file and the second column is the number of complete cases. A prototype of this function follows
    
    
    wd <- "G:\\Data\\rprog-data-specdata\\"
    path <- paste(wd,directory, sep = "", collapse = NULL)
    
    ##print(path)
    
    setwd(path)
    filelist <- list.files(path=".")
    
    dataset <- data.frame()
    rowcount <- data.frame()
    
    for (i in id) {
        ##dataset <- rbind(dataset, read.csv(filelist[i]))
        dataset <- read.csv(filelist[i])
        rowcount<- rbind(rowcount,c(i,NROW(na.omit(dataset))))
    }
    colnames(rowcount) <- c("id", "nobs")
    ##dataset <- na.omit(dataset)
    
    return(rowcount)
    rowcount
}