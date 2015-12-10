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

## It generates the histogram of frequency data "Global Active Power.

hist(subSetData$Global_active_power, col="red", main="Global Active Power", xlab="Global Active Power (Kilowatts)", ylab="Frequency", freq=TRUE)

# Save the graphic in a png file.
dev.copy(png, file = "plot1.png", width=480, height=480)
dev.off()
