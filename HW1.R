# Katy Fallows
# Coursera Exploratory Data Analysis
# Homework 1

datafile <- "C:/Users/Katy/Documents/R/household_power_consumption.txt"

library(sqldf)
df <- read.csv.sql(datafile, sql = "select * from file where Date='1/2/2007' or Date='2/2/2007'", 
                   sep = ";", comment.char="")

df$NewTime <- strptime(paste(as.Date(df$Date,format="%d/%m/%Y"),df$Time,sep=" "), 
                             format="%Y-%m-%d %H:%M:%S")


# Plot 1
par(mfrow=c(1,1))
png("plot1.png")
hist(df$Global_active_power,col="red",main="Global Active Power",
     xlab="Global Active Power (kilowatts)")
dev.off()


# Plot 2
par(mfrow=c(1,1))
png("plot2.png")
plot(df$NewTime,df$Global_active_power,type="l",xlab="",ylab="Global Active Power (kilowatts)")
dev.off()


par(mfrow=c(1,1))
png("plot3.png")
plot(df$NewTime,df$Sub_metering_1,type="n",xlab="",ylab="Energy sub metering")
points(df$NewTime,df$Sub_metering_1,type="l",col="black")
points(df$NewTime,df$Sub_metering_2,type="l",col="red")
points(df$NewTime,df$Sub_metering_3,type="l",col="blue")
legend("topright",legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), 
        col=c("black","red","blue"),lty=c(1,1))
dev.off()


png("plot4.png")
par(mfrow=c(2,2))
plot(df$NewTime,df$Global_active_power,type="l",xlab="",ylab="Global Active Power")
plot(df$NewTime,df$Voltage,type="l",xlab="datetime",ylab="Voltage")

plot(df$NewTime,df$Sub_metering_1,type="n",xlab="",ylab="Energy sub metering")
points(df$NewTime,df$Sub_metering_1,type="l",col="black")
points(df$NewTime,df$Sub_metering_2,type="l",col="red")
points(df$NewTime,df$Sub_metering_3,type="l",col="blue")
legend("topright",legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),
       col=c("black","red","blue"),lty=c(1,1),cex=0.50,bty="n")

plot(df$NewTime,df$Global_reactive_power,type="l",xlab="datetime",ylab="Global_reactive_power")
dev.off()