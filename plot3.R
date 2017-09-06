# Reading data 
power_consumption <- read.table("./household_power_consumption.txt", header = T, sep = ";", na.strings = "?")

# Combine date and time into a new column 
power_consumption$DateTime <- paste(power_consumption$Date, power_consumption$Time)

# Convert date column into Date format
power_consumption$Date <- as.Date(power_consumption$Date, "%d/%m/%Y")

# Subset dataset to extract data from February 2007 1st and 2nd
feb_power <- subset(power_consumption, Date == "2007-02-01" | Date == "2007-02-02")

# Convert DateTime column to POSIXlt format
feb_power$DateTime <- strptime(feb_power$DateTime, "%d/%m/%Y %H:%M:%S")

# Launch file device 
png(filename = "plot3.png", width = 480, height = 480)

# Adjust the margins
par(mar = c(5,6,4,2))

# Create plots of Sub metering 1,2 and 3 vs time for the two days 
plot(feb_power$DateTime, feb_power$Sub_metering_1, type= "l", xlab = "", ylab = "Energy sub metering")
lines(feb_power$DateTime, feb_power$Sub_metering_2, col = "red")
lines(feb_power$DateTime, feb_power$Sub_metering_3, col = "blue")

# Add legend to the plot
legend("topright", legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), col = c("black", "red", "blue"), lty = 1)

# Close the graphic device
dev.off()




