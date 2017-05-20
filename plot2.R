##Exploratory Data Analysis Course
##Plot 2 R code
setwd("C:/Users/henry/Documents/DataAnalyst/Coursera/")
classes<-c(rep("factor",2), rep("numeric",7))
consumption<-read.csv("household_power_consumption.txt",na.strings = "?",header = TRUE,colClasses = classes, sep = ";")
library(dplyr)
power<-filter(consumption, as.character(Date)=="1/2/2007"|Date=="2/2/2007")
rm(consumption)
power$Datetime <- paste(power$Date, power$Time)
power$Datetime<-strptime(power$Datetime, "%d/%m/%Y %H:%M:%S")
png(filename = "plot2.png",width = 480, height = 480, units = "px", pointsize = 12)
plot(x = power$Datetime,y=power$Global_active_power, type = "l",ylab = "Gloabl Active Power (kilowatts)",main="", xlab="")
dev.off()
