#Plot3.R
#Author: Kesavan Kushalnagar
library(lubridate)
data <- read.table("household_power_consumption.txt", sep = ";", header = TRUE)

data$datetime <- strptime(x = paste(data$Date, data$Time, sep = ","), format = "%d/%m/%Y,%H:%M:%S")
data$Date <- dmy(data$Date)

feb1 <- subset(data, Date == "2007-02-01")
feb2 <- subset(data, Date == "2007-02-02")
feb <- rbind(feb1, feb2)

#NAs are ?. Could also include this in the read.table but I didn't
clean <- subset(feb, Global_active_power != "?")
clean <- subset(feb, Global_reactive_power != "?")
clean <- subset(clean, Sub_metering_1 != "?")
clean <- subset(clean, Sub_metering_2 != "?")
clean <- subset(clean, Sub_metering_3 != "?")
clean <- subset(clean, Voltage != "?")

png("plot4.png", height = 480, width = 480)
par(mfrow = c(2,2))
plot( as.numeric(as.character(clean$Global_active_power)) ~ as.POSIXct(clean$datetime),  type = "l", ylab = "Global Active Power (kilowatts)", xlab = "")
plot( as.numeric(as.character(clean$Voltage)) ~ as.POSIXct(clean$datetime),  type = "l", ylab = "Voltage", xlab = "datetime")
plot(as.numeric(as.character(clean$Sub_metering_1)) ~ as.POSIXct(clean$datetime),  type = "l", ylab = "Energy sub metering", xlab = "")
lines(as.numeric(as.character(clean$Sub_metering_2)) ~ as.POSIXct(clean$datetime), col = "red")
lines(as.numeric(as.character(clean$Sub_metering_3)) ~ as.POSIXct(clean$datetime), col = "blue")
legend("topright", legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty = c(1,1,1), col = c("black", "red", "blue"), bty = "n")
plot( as.numeric(as.character(clean$Global_reactive_power)) ~ as.POSIXct(clean$datetime),  type = "l", ylab = "Global_reactive_power", xlab = "datetime")
dev.off()
