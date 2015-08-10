rawdata <- "./household_power_consumption.txt" # data directory
data <- read.table(rawdata, header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".") # read the whole data.txt file
subdata <- data[data$Date %in% c("1/2/2007","2/2/2007") ,] # Using only data from 2007-02-01 until 2007-02-02

globalActivePower <- as.numeric(subdata$Global_active_power) # assign Global_active_power values as numeric
png("plot1.png", width=480, height=480) # Save the result as plot1.png
hist(globalActivePower, col="red", main="Global Active Power", xlab="Global Active Power (kilowatts)") # plotting the histogram
dev.off()