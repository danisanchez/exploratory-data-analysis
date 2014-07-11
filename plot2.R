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

## Plot 2
plot(data$Global_active_power~data$dateTime, type = "l", 
     ylab = "Global Acitve Power (Kilowatts", xlab = "")

## Saving to file png
dev.copy(png, file = "plot2.png")
dev.off()