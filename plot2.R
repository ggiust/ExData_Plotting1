plot2 <- function() {
    
    ## read data file
    fp1 <- "../../AllMyMacbookStuff/DataScience/Courses/"
    fp2 <- "Coursera_DataScienceSpecialization/4_ExploratoryDataAnalysis/"
    fp3 <- "WorkingDirectory/"
    fname <- "household_power_consumption.txt"
    filename <- paste(fp1, fp2, fp3, fname , sep="")
    DF <- read.table(filename, sep=";", header=TRUE)
    
    ## extract relevant time frame
    DF2 <- subset(DF, Date == "1/2/2007" | Date == "2/2/2007")
    
    ## add column for datetime
    DF2$datetime <- paste(DF2[,1], DF2[,2], sep=", ")
    
    ## format datetime column as POSIXlt POSIXt
    DF2$datetime <- strptime(DF2$datetime, format="%d/%m/%Y, %H:%M:%S")
    
    ## convert columns to numeric data
    DF2$Global_active_power <- as.numeric(as.character(DF2$Global_active_power))
    
    # export PDF image
    png(filename="plot2.png", width=480, height=480)
    plot(DF2$datetime, DF2$Global_active_power, ylab="Global Active Power (kilowatts)", 
         type="l", xlab="")
    dev.off()
}