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

## The variables is converted to numerical.

globalActivePower <- as.numeric(subSetData$Global_active_power)
globalReactivePower <- as.numeric(subSetData$Global_reactive_power)
voltage <- as.numeric(subSetData$Voltage)
subMetering1 <- as.numeric(subSetData$Sub_metering_1)
subMetering2 <- as.numeric(subSetData$Sub_metering_2)
subMetering3 <- as.numeric(subSetData$Sub_metering_3)


## Save the graphic in a png file.

png("plot4.png", width=480, height=480)

## Divide the area of graphics in 4 parts.

par(mfcol=c(2, 2))


plot(x=Data2, y=globalActivePower, type="l", xlab="", ylab="Global Active Power", cex=0.2)

plot(x=Data2, y=subMetering1, type="l", xlab="", ylab="Energy sub metering")
lines(x=Data2, y=subMetering2, type="l", col="red")
lines(x=Data2, y=subMetering3, type="l", col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=, lwd=2.5, col=c("black", "red", "blue"), bty="o")


plot(x=Data2, y=voltage, type="l", xlab="datetime", ylab="Voltage")

plot(x=Data2, y=globalReactivePower, type="l", xlab="datetime", ylab="Energy_reactive_power")


dev.off()

## Return the graphics area to one section.
par(mfcol=c(1, 1))


