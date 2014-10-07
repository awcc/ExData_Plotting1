# plot3.R
# Reads in data from household_power_consumption.txt
# produces a plot of energy sub metering over time
# output is in plot3.png

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

# Plot 3: A line plot in three colors, of sub metering 1, 2, and 3 versus time
# again from Midnight on Thu 2007-02-01 to Midnight on Thu 2007-02-03
png("plot3.png")
plot(data$posixdate, data$Sub_metering_1, type = "l", xlab="",
     ylab="Energy sub metering")
lines(data$posixdate, data$Sub_metering_2, col="red")
lines(data$posixdate, data$Sub_metering_3, col="blue")
legend('topright', legend = c("Sub_metering_1", "Sub_metering_2",
        "Sub_metering_3"), col = c("black","red","blue"), lty = 1, cex=.75)
dev.off()