# This script will replicate the plot 2 in Assignment 1

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
png(file="plot2.png")
# Now we generate the plot
plot(household$DateTime, household$Global_active_power, type="l", xlab = "",
     ylab = "Global Active Power (kilowatts)")
# And close graphics device
dev.off()