# This script will replicate the plot 3 in Assignment 1

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
png(file="plot3.png")
# Now we generate the plot
plot(household$DateTime, household$Sub_metering_1, xlab = "",
     ylab = "Energy sub metering", type="l")
# Adding other lines of sub metering measurements
lines(household$DateTime, household$Sub_metering_2, col="red")
lines(household$DateTime, household$Sub_metering_3, col="blue")
# Adding the legend
legend("topright", lty=1, col=c("black", "red", "blue"), 
      legend=c("Sub metering 1", "Sub metering 2", "Sub metering 3"))
# And close graphics device
dev.off()