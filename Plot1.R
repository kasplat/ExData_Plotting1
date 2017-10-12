#Plot1.R
#Author: Kesavan Kushalnagar

library(lubridate)

data <- read.table("household_power_consumption.txt", sep = ";", header = TRUE)

data$datetime <- strptime(x = paste(data$Date, data$Time, sep = ","), format = "%d/%m/%Y,%H:%M:%S")
data$Date <- dmy(data$Date)
#subset to all data on feb 1 and 2, 2007
feb1 <- subset(data, Date == "2007-02-01")
feb2 <- subset(data, Date == "2007-02-02")
feb <- rbind(feb1, feb2)

#PNG plot
png("plot1.png", height = 480, width = 480)
hist(as.numeric(feb$Global_active_power)/500, col = "red", breaks = 20, xlab = "Global Active Power (kilowatts)", main = "Global Active Power")
dev.off()

