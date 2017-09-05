# Reading data 
power_consumption <- read.table("./household_power_consumption.txt", header = T, sep = ";", na.strings = "?")

# Convert date column into Date format
power_consumption$Date <- as.Date(power_consumption$Date, "%d/%m/%Y")

# Subset dataset to extract data from February 2007 1st and 2nd
feb_power <- subset(power_consumption, Date == "2007-02-01" | Date == "2007-02-02")

# Launch file device 
png(filename = "plot1.png", width = 480, height = 480)

# Adjust the margins
par(mar = c(5,6,4,2))

# Create a histogram for global active power consumed for the two days in Feb
hist(feb_power$Global_active_power, col = "red", main = "Global Active Power", xlab = "Global Active Power(kilowatts)")

# Close the graphic device
dev.off()




