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
png(filename = "plot2.png", width = 480, height = 480)

# Create a plot of Global active power vs time for the two days 
plot(feb_power$DateTime, feb_power$Global_active_power, type= "l", xlab = "", ylab = "Global Active Power(kilowatts)")

# Close the graphic device
dev.off()




