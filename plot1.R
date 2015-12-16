rm(list=ls())

path<-"C:\\Users\\schwaali\\Documents\\Github\\ExData_Plotting1"
setwd(path)
library("sqldf")
df<-read.csv.sql("household_power_consumption.txt", sql="select*from file where Date='2/2/2007' or Date = '1/2/2007'" ,header=TRUE, sep=";")
df$Time<-strptime(paste(df$Date,df$Time),"%d/%m/%Y %T")
df$Date<-as.Date(strptime(df$Date,"%d/%m/%Y"))

png('plot1.png', width=480, height=480)
hist(df$Global_active_power, col="red",main="Global Active Power",xlab="Global Active Power (kilowatts)",ylab="Frequency")
#rug(df$Global_active_power)
dev.off()


