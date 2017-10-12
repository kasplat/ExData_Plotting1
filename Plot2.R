#Plot2.R
#Author: Kesavan Kushalnagar
data <- read.table("household_power_consumption.txt", sep = ";", header = TRUE)

data$datetime <- strptime(x = paste(data$Date, data$Time, sep = ","), format = "%d/%m/%Y,%H:%M:%S")
data$Date <- dmy(data$Date)

#NAs are ?. Could also include this in the read.table but I didn't
clean <- subset(feb, Global_active_power != "?")

png("plot2.png", height = 480, width = 480)
plot( as.numeric(as.character(clean$Global_active_power)) ~ as.POSIXct(clean$datetime),  type = "l", ylab = "Global Active Power (kilowatts)", xlab = "")
dev.off()