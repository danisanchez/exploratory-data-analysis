## getting the full dataset
setwd("./R/workspace")
dataset <- read.table("./data/household_power_consumption.txt", header = TRUE, sep = ";", na.strings = "?")

dataset$Date <- as.Date(dataset$Date, format = "%d/%m/%Y")

## Subsetting the data take only the two days
data <- subset(dataset, subset = ( Date >= "2007-02-01" & Date <= "2007-02-02"))
rm(dataset)

## converting the dates
dateTime <- paste(as.Date(data$Date), data$Time)
data$dateTime <- as.POSIXct(dateTime)

## Plot 3
with(data, {
        plot(Sub_metering_1~dateTime, type="l",
             ylab="Global Active Power (kilowatts)", xlab="")
        lines(Sub_metering_2~dateTime,col='Red')
        lines(Sub_metering_3~dateTime,col='Blue')
})
legend("topright", col=c("black", "red", "blue"), lty=1, lwd=1, 
       legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

## Saving to file
dev.copy(png, file="plot3.png")
dev.off()