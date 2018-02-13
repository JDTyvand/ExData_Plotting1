## Script to generate plot 4 for the Course Project 1 of the
## "Exploratory Data Analysis" course from Johns Hopkins University
## on Coursera.

## Note: This script assumes that the "household_power_consumption.txt" file
##       is located in the same folder as the script.

if(!file.exists("household_power_consumption.txt")) {
        stop("Project related .txt file not found in script folder!")
}

## Read the project .txt file to data frame hpc

hpc <- read.table("household_power_consumption.txt", header = TRUE, sep = ";", na.strings = "?")

## Convert Date varibles to Date class, 
## and filter out data from 2007-02-01 and 2007-02-02

hpc$Date <- as.Date(hpc$Date, format = "%d/%m/%Y")
hpc <- hpc[hpc$Date >= "2007-02-01" & hpc$Date <= "2007-02-02",]

## Convert Time variables to POSIX class,
## containing both the date and time

hpc$Time <- strptime(paste(hpc$Date, hpc$Time), format = "%Y-%m-%d %H:%M:%S")

## Open png file plot4.png, then change par() 
## to plot 4 plots in 2 rows of 2 colums.

png(filename = "plot4.png") # Default 480x480 pixels (as required)

par(mfrow = c(2,2))

## Plot 4 plots, where the first is the plot from plot2.png,
## the second plot is Voltage as a function of time, 
## the third plot is the plot from plot3.png,
## and the last plot is Global reactive power as a function of time.

plot(hpc$Time, hpc$Global_active_power,
     type = "l",
     xlab = "",
     ylab = "Global Active Power")

plot(hpc$Time, hpc$Voltage, type = "l",
     xlab = "datetime",
     ylab = "Voltage")

plot(hpc$Time, hpc$Sub_metering_1,
     type = "l",
     xlab = "",
     ylab = "Energy sub metering")
lines(hpc$Time, hpc$Sub_metering_2, col = "red")
lines(hpc$Time, hpc$Sub_metering_3, col = "blue")
legend("topright", 
       legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
       col = c("black", "red", "blue"), lty = 1, bty = "n")

plot(hpc$Time, hpc$Global_reactive_power, type = "l", 
     xlab = "datetime", ylab = "Global_reactive_power")
## Close the png graphic device
dev.off()