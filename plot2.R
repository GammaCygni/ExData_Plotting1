# K Fallows
# Coursera Exploratory Data Analysis
# Homework 1 - PLOT 2


# Read in the data to a data frame and reformat the date and time

datafile <- "C:/Users/Katy/Documents/R/household_power_consumption.txt"

library(sqldf)
df <- read.csv.sql(datafile, sql = "select * from file where Date='1/2/2007' or Date='2/2/2007'", 
                   sep = ";", comment.char="")

df$NewTime <- strptime(paste(as.Date(df$Date,format="%d/%m/%Y"),df$Time,sep=" "), 
                       format="%Y-%m-%d %H:%M:%S")


# Create plot 2

par(mfrow=c(1,1))
png("plot2.png")
plot(df$NewTime,df$Global_active_power,type="l",xlab="",ylab="Global Active Power (kilowatts)")
dev.off()