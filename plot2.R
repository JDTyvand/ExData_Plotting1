## Script to generate plot 2 for the Course Project 1 of the
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

## Open png file plot2.png, plot line plot of Global Active Power 
## as a function of time.

png(filename = "plot2.png") # Default 480x480 pixels (as required)

plot(hpc$Time, hpc$Global_active_power,
     type = "l",
     xlab = "",
     ylab = "Global Active Power (kilowatts)")

## Close the png graphic device
dev.off()