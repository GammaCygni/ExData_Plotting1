# K Fallows
# Coursera Exploratory Data Analysis
# Homework 1 - PLOT 3


# Read in the data to a data frame and reformat the date and time

datafile <- "C:/Users/Katy/Documents/R/household_power_consumption.txt"

library(sqldf)
df <- read.csv.sql(datafile, sql = "select * from file where Date='1/2/2007' or Date='2/2/2007'", 
                   sep = ";", comment.char="")

df$NewTime <- strptime(paste(as.Date(df$Date,format="%d/%m/%Y"),df$Time,sep=" "), 
                       format="%Y-%m-%d %H:%M:%S")


# Create plot 3

par(mfrow=c(1,1))
png("plot3.png")
plot(df$NewTime,df$Sub_metering_1,type="n",xlab="",ylab="Energy sub metering")
points(df$NewTime,df$Sub_metering_1,type="l",col="black")
points(df$NewTime,df$Sub_metering_2,type="l",col="red")
points(df$NewTime,df$Sub_metering_3,type="l",col="blue")
legend("topright",legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), 
       col=c("black","red","blue"),lty=c(1,1))
dev.off()