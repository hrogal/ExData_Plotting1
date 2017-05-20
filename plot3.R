##Exploratory Data Analysis Course
##Plot 3 R code
setwd("C:/Users/henry/Documents/DataAnalyst/Coursera/")
classes<-c(rep("factor",2), rep("numeric",7))
consumption<-read.csv("household_power_consumption.txt",na.strings = "?",header = TRUE,colClasses = classes, sep = ";")
library(dplyr)
power<-filter(consumption, as.character(Date)=="1/2/2007"|Date=="2/2/2007")
rm(consumption)
power$Datetime <- paste(power$Date, power$Time)
power$Datetime<-strptime(power$Datetime, "%d/%m/%Y %H:%M:%S")
colors<-c("black","red","blue")
png(filename = "plot3.png",width = 480, height = 480, units = "px", pointsize = 12)
plot(x = power$Datetime,y=power$Sub_metering_1, type = "l",ylab = "Energy sub metering",main="", xlab="")
lines(x = power$Datetime,y=power$Sub_metering_2, col="red")
lines(x = power$Datetime, y=power$Sub_metering_3, col="blue")
legend("topright",c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),lty = 1, col=colors)
dev.off()

