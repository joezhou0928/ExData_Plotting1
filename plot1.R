rm(list=ls())
library(dplyr)
data <- read.table('./household_power_consumption.txt',
                   sep = ';', header = TRUE, stringsAsFactors = FALSE)
data$Date <- as.Date(data$Date, format= "%d/%m/%Y")
# Filter to only 2007-02-01 and 2007-02-02 data
subdata <- subset(data, Date == "2007-02-01"|Date == "2007-02-02")
# Plot 1
subdata$Global_active_power <- as.numeric(subdata$Global_active_power)
png('plot1.png',width = 480, height = 480)
hist(subdata$Global_active_power,
     xlab="Global Active Power (kilowatts)", 
     main="Global Active Power",
     col = 'red')

dev.off()
