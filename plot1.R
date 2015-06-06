plot1 <- function() {
    
    ## read data file
    fp1 <- "../../AllMyMacbookStuff/DataScience/Courses/"
    fp2 <- "Coursera_DataScienceSpecialization/4_ExploratoryDataAnalysis/"
    fp3 <- "WorkingDirectory/"
    fname <- "household_power_consumption.txt"
    filename <- paste(fp1, fp2, fp3, fname , sep="")
    DF <- read.table(filename, sep=";", header=TRUE)
    
    ## extract relevant time frame
    DF2 <- subset(DF, Date == "1/2/2007" | Date == "2/2/2007")
    
    ## convert Global_active_power to numeric data
    DF2$Global_active_power <- as.numeric(as.character(DF2$Global_active_power))
    
    # export PDF image
    png(filename="plot1.png", width=480, height=480)
    hist(DF2$Global_active_power, col="red", main="Global Active Power", 
        xlab="Global Active Power (kilowatts)")
    dev.off()
}