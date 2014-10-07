# plot1.R
# Reads in data from household_power_consumption.txt
# produces a histogram of global active power
# output is in plot1.png

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

# Plot 1: A histogram of Global Active Power in kilowatts
# File name: plot1.png
png("plot1.png")
hist(data$Global_active_power, col="red", xlab="Global Active Power (kilowatts)",
     main = "Global Active Power")
dev.off()