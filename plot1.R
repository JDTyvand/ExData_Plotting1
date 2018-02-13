## Script to generate plot 1 for the Course Project 1 of the
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

## Open png file plot1.png, plot histogram of Global Active Power
## variable, and add plot annotations and colors.

png(filename = "plot1.png") # Default 480x480 pixels (as required)

hist(hpc$Global_active_power, col = "red", 
     main = "Global Active Power",
     xlab = "Global Active Power (kilowatts)")

## Close the png graphic device
dev.off() 