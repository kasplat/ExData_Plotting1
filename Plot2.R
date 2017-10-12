#Plot2.R
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

png("plot2.png", height = 480, width = 480)
plot( as.numeric(as.character(clean$Global_active_power)) ~ as.POSIXct(clean$datetime),  type = "l", ylab = "Global Active Power (kilowatts)", xlab = "")
dev.off()
