rawdata <- "./household_power_consumption.txt" # data directory
data <- read.table(rawdata, header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".") # read the whole data.txt file
subdata <- data[data$Date %in% c("1/2/2007","2/2/2007") ,] # Using only data from 2007-02-01 until 2007-02-02

#Plot4
datetime <- strptime(paste(subdata$Date, subdata$Time, sep=" "), "%d/%m/%Y %H:%M:%S") #convert date time to day
globalActivePower <- as.numeric(subdata$Global_active_power)#convert value to numeric
globalReactivePower <- as.numeric(subdata$Global_reactive_power)
voltage <- as.numeric(subdata$Voltage)
subMetering1 <- as.numeric(subdata$Sub_metering_1) #convert value to numeric
subMetering2 <- as.numeric(subdata$Sub_metering_2)#convert value to numeric
subMetering3 <- as.numeric(subdata$Sub_metering_3)#convert value to numeric


png("plot4.png", width=480, height=480) # Save the result as plot4.png
par(mfrow = c(2, 2)) 

plot(datetime, globalActivePower, type="l", xlab="", ylab="Global Active Power", cex=0.2) # plot data
plot(datetime, voltage, type="l", xlab="datetime", ylab="Voltage") # plot data
plot(datetime, subMetering1, type="l", ylab="Energy Submetering", xlab="") # plot data
lines(datetime, subMetering2, type="l", col="red") # lines = add elements to the plot 
lines(datetime, subMetering3, type="l", col="blue") # lines = add elements to the plot 
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=, lwd=2.5, col=c("black", "red", "blue"), bty="o")

plot(datetime, globalReactivePower, type="l", xlab="datetime", ylab="Global_reactive_power")

dev.off()