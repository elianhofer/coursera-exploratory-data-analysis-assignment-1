## Load package "data.table"
library(data.table)

## Download and unzip the dataset:
filename <- "electricpowerconsumption.zip"
if (!file.exists("filename")){
        fileURL <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
        download.file(fileURL, filename, method="curl")
}
if (!file.exists("household_power_consumption.txt")) { 
        unzip(filename)
}

## Load data into R
epc_data <- fread("household_power_consumption.txt", na.strings = "?")

## Convert date format and subset data
epc_data$Date <- as.Date(epc_data$Date, format = "%d/%m/%Y")
epc <- subset(epc_data, Date == as.Date("2007-02-01") | Date == as.Date("2007-02-02"))


## Create histogram of Global_active_power and save it as a png file
hist(epc$Global_active_power, col = "red", main = "Global Active Power", xlab = "Global Active Power (kilowatts)", ylab = "Frequency")
dev.copy(png, file = "plot1.png", width=480, height=480)
dev.off()
