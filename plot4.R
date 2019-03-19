# This script will replicate the plot 4 in Assignment 1

# Here we set the working directory
script.dir <- dirname(sys.frame(1)$ofile)
setwd(script.dir)
# We start by reading the data from the file
household <- read.table("household_power_consumption.txt", sep=";", header = TRUE, 
              colClasses = c("character", "character", "numeric", "numeric", "numeric",
                             "numeric", "numeric", "numeric", "numeric"), na.strings="?")
# Clean up the dates and times format
household$DateTime <- strptime(paste(household$Date, household$Time),
                               format = "%d/%m/%Y %H:%M:%S")
# And subset the two days required for analysis
household <- subset(household, DateTime >= "2007-02-01" & DateTime < "2007-02-03")

# We will be writing directly to png file
png(file="plot4.png")
# Now we generate the area for plots
par(mfcol = c(2,2))
# Add the first plot
plot(household$DateTime, household$Global_active_power, type="l", xlab = "Date & time",
     ylab = "Global Active Power")
# Add the second plot
plot(household$DateTime, household$Sub_metering_1, xlab = "Date & time",
     ylab = "Energy sub metering", type="l")
# Adding other lines to second plot
lines(household$DateTime, household$Sub_metering_2, col="red")
lines(household$DateTime, household$Sub_metering_3, col="blue")
# Adding the legend to second plot
legend("topright", lty=1, col=c("black", "red", "blue"),
      legend=c("Sub metering 1", "Sub metering 2", "Sub metering 3"), cex=0.75)
# Adding the third plot
plot(household$DateTime, household$Voltage, type="l", xlab = "Date & time",
     ylab = "Voltage")
# And the final plot
plot(household$DateTime, household$Global_reactive_power, type="l", xlab = "Date & time",
     ylab = "Global Reactive Power")
# And close graphics device
dev.off()