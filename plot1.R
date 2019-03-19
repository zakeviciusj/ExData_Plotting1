# This script will replicate the plot 1 in Assignment 1

# We start by reading the data from the file
household <- read.table("household_power_consumption.txt", sep=";", header = TRUE, 
              colClasses = c("character", "character", "numeric", "numeric", "numeric",
                             "numeric", "numeric", "numeric", "numeric"), na.strings="?")
# Clean up the dates format
household$Date <- as.Date(household$Date, "%d/%m/%Y")
# And subset the two days required for analysis
household <- subset(household, Date >= "2007-02-01" & Date <= "2007-02-02")

# We will be writing directly to png file
png(file="plot1.png")
# Now we generate the histogram
hist(household$Global_active_power, xlab = "Global Active Power (kilowatts)",
     ylab = "Frequency", main = "Global Active Power", col="red")
# And close graphics device
dev.off()