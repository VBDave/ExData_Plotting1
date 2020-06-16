## Load power table from data file
power <- read.table("household_power_consumption.txt", sep = ";",header=TRUE)
## Create new table for two desired dates
power070102 <- subset(power, Date %in% c("1/2/2007","2/2/2007"))
## Format data
power070102$Date <- as.Date(power070102$Date, format="%d/%m/%Y")
DateTime <- paste(as.Date(power070102$Date), power070102$Time)
power070102$DateTime <- as.POSIXct(DateTime)
power070102$Global_active_power <- as.numeric(power070102$Global_active_power)
power070102$Global_reactive_power <- as.numeric(power070102$Global_reactive_power)
power070102$Voltage <- as.numeric(power070102$Voltage)
power070102$Global_intensity <- as.numeric(power070102$Global_intensity)
power070102$Sub_metering_1 <- as.numeric(power070102$Sub_metering_1)
power070102$Sub_metering_2 <- as.numeric(power070102$Sub_metering_2)
power070102$Sub_metering_3 <- as.integer(power070102$Sub_metering_3)
## Reproduce Plot 2
png("plot2.png", width=480, height=480)
with(power070102, {
  plot(Global_active_power~DateTime, type="l",
       ylab="Global Active Power (kilowatts)", xlab="")
})
dev.off()
