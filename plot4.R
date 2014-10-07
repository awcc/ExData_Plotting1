# plot4.R
# Reads in data from household_power_consumption.txt
# produces a 2-by-2 array of power consumption plots
# see below for details
# output is in plot4.png

# Read in the data.
# Note that missing data is entered as ?
# And the separator is ;
household <- read.table("household_power_consumption.txt", 
            sep=";", header=TRUE, na.strings="?", stringsAsFactors = F)

# Select only dates 2007-02-01 and 2007-02-02
data <- subset(household, Date == "1/2/2007" | Date == "2/2/2007")

# Convert Date and Time variables to one POSIXlt variable,
# named posixdate
data$posixdate <- strptime( paste(data$Date, data$Time, " "),
                            "%d/%m/%Y %H:%M:%S" )

# Plot 4: A display of four plots. Upper left and lower left are
# slight variants on plots 2 and 3, respectively.
# The upper right plots voltage against datetime
# and the lower right plots Global_reactive_power versus datetime
# again in the range Midnight on Thu 2007-02-01 to Midnight on Thu 2007-02-03
png("plot4.png")
par(mfcol = c(2,2))

# Upper left
plot(data$posixdate, data$Global_active_power, type="l",
     ylab = "Global Active Power", xlab = "")

# Lower left
plot(data$posixdate, data$Sub_metering_1, type = "l", xlab="",
     ylab="Energy sub metering")
lines(data$posixdate, data$Sub_metering_2, col="red")
lines(data$posixdate, data$Sub_metering_3, col="blue")
legend('topright', bty="n", legend = c("Sub_metering_1", "Sub_metering_2",
        "Sub_metering_3"), col = c("black","red","blue"), lty = 1, cex=.7)

# Upper right
plot(data$posixdate, data$Voltage, type= "l", xlab = "datetime",
     ylab = "Voltage")

# Lower right
plot(data$posixdate, data$Global_reactive_power, type="l",
     xlab = "datetime", ylab = "Global_reactive_power")

# Revert mfcol and close graphics device
par(mfcol = c(1,1))
dev.off()