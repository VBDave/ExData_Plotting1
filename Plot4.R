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

## Reproduce Plot 4
png("plot4.png", width=480, height=480)
par(mfrow=c(2,2), mar=c(4,4,2,1), oma=c(0,0,2,0))
with(power070102, {
  plot(Global_active_power~DateTime, type="l", 
       ylab="Global Active Power (kilowatts)", xlab="")
  plot(Voltage~DateTime, type="l", 
       ylab="Voltage (volt)", xlab="")
  plot(Sub_metering_1~DateTime, type="l", 
       ylab="Global Active Power (kilowatts)", xlab="")
  lines(Sub_metering_2~DateTime,col='Red')
  lines(Sub_metering_3~DateTime,col='Blue')
  legend("topright", col=c("black", "red", "blue"), lty=1, lwd=2, bty="n",
         legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
  plot(Global_reactive_power~DateTime, type="l", 
       ylab="Global Rective Power (kilowatts)",xlab="")
})

dev.off()
