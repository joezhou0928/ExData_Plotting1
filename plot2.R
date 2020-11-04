rm(list=ls())
library(dplyr)
data <- read.table('./household_power_consumption.txt',
                   sep = ';', header = TRUE, stringsAsFactors = FALSE)
data$Date <- as.Date(data$Date, format= "%d/%m/%Y")
# Filter to only 2007-02-01 and 2007-02-02 data
subdata <- subset(data, Date == "2007-02-01"|Date == "2007-02-02")
subdata$Datetime <- paste(subdata$Date, subdata$Time)
subdata$Datetime <- as.POSIXlt(subdata$Datetime)
# Plot 2
subdata$Global_active_power <- as.numeric(subdata$Global_active_power)
png('plot2.png',width = 480, height = 480)
plot(x = subdata$Datetime, 
     y = subdata$Global_active_power,
     type = "l",
     ylab = "Global Active Power (kilowatts)",
     xlab ='')

dev.off()
