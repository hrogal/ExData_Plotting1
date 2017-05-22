##Exploratory Data Analysis Course
##Plot 1 R code
classes<-c(rep("factor",2), rep("numeric",7))
consumption<-read.csv("household_power_consumption.txt",na.strings = "?",header = TRUE,colClasses = classes, sep = ";")
library(dplyr)
power<-filter(consumption, as.character(Date)=="1/2/2007"|Date=="2/2/2007")
rm(consumption)
power$Datetime <- paste(power$Date, power$Time)
power$Datetime<-strptime(power$Datetime, "%d/%m/%Y %H:%M:%S")
png(filename = "plot1.png",width = 480, height = 480, units = "px", pointsize = 12)
hist(power$Global_active_power,xlab = "Gloabl Active Power Consumption (kilowatts)",main="Global Active Power",col="red")
dev.off()

