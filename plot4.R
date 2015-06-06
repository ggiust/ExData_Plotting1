plot4 <- function() {
    
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
    DF2$Global_reactive_power <- as.numeric(as.character(DF2$Global_reactive_power))
    DF2$Voltage <- as.numeric(as.character(DF2$Voltage))
    DF2$Sub_metering_1 <- as.numeric(as.character(DF2$Sub_metering_1))
    DF2$Sub_metering_2 <- as.numeric(as.character(DF2$Sub_metering_2))
    
    # export PDF image
    png(filename="plot4.png", width=480, height=480)
    
    ## configure 2x2 matrix of panels
    par(mfcol=c(2,2))
    
    ## first plot
    plot(DF2$datetime, DF2$Global_active_power, ylab="Global Active Power", 
         type="l", xlab="")
    
    ## second plot
    plot(DF2$datetime, DF2$Sub_metering_1, ylab="Energy sub metering", type="l", xlab="")
    lines(DF2$datetime, DF2$Sub_metering_2, col="red")
    lines(DF2$datetime, DF2$Sub_metering_3, col="blue")
    legend("topright",   ## legend placement
           legend=c("Sub_metering_1","Sub_metering_2", "Sub_metering_3"),
           lty=c(1,1,1),       ## give legend lines
           lwd=c(1.3,1.3,1.3), col=c("black", "red", "blue"), ## give legend lines color and width
           bty = "n") ## remove border around legend
    
    ## third plot
    plot(DF2$datetime, DF2$Voltage, ylab="Voltage",
         xlab="datetime", type="l")
    
    ## fourth plot
    plot(DF2$datetime, DF2$Global_reactive_power, ylab="Global_reactive_power", 
         xlab="datetime", type="l")

    dev.off()
}