rm(list=ls())
library(dplyr)
data <- read.table('./household_power_consumption.txt',
                   sep = ';', header = TRUE, stringsAsFactors = FALSE)
data$Date <- as.Date(data$Date, format= "%d/%m/%Y")
# Filter to only 2007-02-01 and 2007-02-02 data
subdata <- subset(data, Date == "2007-02-01"|Date == "2007-02-02")
subdata$Datetime <- paste(subdata$Date, subdata$Time)
subdata$Datetime <- as.POSIXlt(subdata$Datetime)
# Plot 4
subdata$Global_active_power <- as.numeric(subdata$Global_active_power)
subdata$Global_reactive_power <- as.numeric(subdata$Global_reactive_power)
subdata$Voltage <- as.numeric(subdata$Voltage)

png('plot4.png',width = 480, height = 480)

par(mfrow=c(2,2))
# 1st subplot
plot(x = subdata$Datetime, 
     y = subdata$Global_active_power,
     type = "l",
     ylab = "Global Active Power",
     xlab ='')
# 2nd subplot
plot(x = subdata$Datetime, 
     y = subdata$Voltage,
     type = "l",
     ylab = "Voltage",
     xlab ='datetime')
# 3rd subplot
plot(x = subdata$Datetime, 
     y = subdata$Sub_metering_1,
     type = "l",
     ylab = "Energy sub metering",
     xlab ='')

lines(x = subdata$Datetime, 
      y = subdata$Sub_metering_2,
      type = "l",
      col = 'red')

lines(x = subdata$Datetime, 
      y = subdata$Sub_metering_3,
      type = "l",
      col = 'blue')

legend('topright', legend=c("Sub_metering_1", 
                            "Sub_metering_2", 
                            "Sub_metering_3"),
       col=c("black","red", "blue"), lty=1, cex=0.7, 
       bty = 'n')
# 4th subplot
plot(x = subdata$Datetime, 
     y = subdata$Global_reactive_power,
     type = "l",
     ylab = "Global Reactive Power",
     xlab ='datetime')
dev.off()