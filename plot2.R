# plot2.R
# Reads in data from household_power_consumption.txt
# produces a line plot of global active power over time
# output is in plot2.png

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

# Plot 2: A line plot of Global Active Power in kilowatts versus time
# from Midnight on Thu 2007-02-01 to Midnight on Thu 2007-02-03
png("plot2.png")
plot(data$posixdate, data$Global_active_power, type="l",
     ylab = "Global Active Power (kilowatts)", xlab = "")
dev.off()