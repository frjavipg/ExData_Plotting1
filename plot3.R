## Unzip file an load data file to data frame, indicating that data has header and that the separator between
## fields is the ";" and that the values "?" in numeric fields convert them to NA.
## If this is not done, all data are obtained as data streams.


unzip("datos.zip")

FileData <- "C:/Users/fprado/Documents/household_power_consumption.txt"

data <- read.table(FileData, header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".",na.strings="?")

## Only using data from the dates 2007-02-01 and 2007-02-02.

subSetData <- data[data$Date %in% c("1/2/2007","2/2/2007") ,]

## convert the Date and Time variables to Date/Time classes in R using the strptime() and as.Date() functions.

Data2 <- strptime(paste(subSetData$Date, subSetData$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 


## Create the plot.
globalActivePower <- as.numeric(subSetData$Global_active_power)
SubMetering1 <- as.numeric(subSetData$Sub_metering_1)
SubMetering2 <- as.numeric(subSetData$Sub_metering_2)
SubMetering3 <- as.numeric(subSetData$Sub_metering_3)

## Save the graphic in a png file.

png("plot3.png", width=480, height=480)

plot(x=Data2, y=SubMetering1, type="l", xlab="", ylab="Energy sub metering")
lines(x=Data2, y=SubMetering2, type="l", col="red")
lines(x=Data2, y=SubMetering3, type="l", col="blue")

## A legend of each of the graphs are created.
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=1, lwd=2.5, col=c("black", "red", "blue"))

dev.off()