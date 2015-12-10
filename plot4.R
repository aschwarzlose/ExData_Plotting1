path<-"C:\\Users\\schwaali\\Documents\\Github\\ExData_Plotting1"
setwd(path)
library("sqldf")
library("ggplot2")
library("reshape2")
df<-read.csv.sql("household_power_consumption.txt", sql="select*from file where Date='2/2/2007' or Date = '1/2/2007'" ,header=TRUE, sep=";")
df$Time<-strptime(paste(df$Date,df$Time),"%d/%m/%Y %T")
df$Date<-as.Date(strptime(df$Date,"%d/%m/%Y"))

png('plot4.png')
#ggplot(m,aes(Time,value, col=variable))+geom_line()

par(mfrow=c(2,2))
with(df,{
  plot(Time,Global_active_power, type="l",main="",xlab="",ylab="Global Active Power (kilowatts)")
  plot(Time, Voltage,type="l",main="",xlab="datetime",ylab="Voltage")
  plot(Time,Sub_metering_1,type="l",xlab="",ylab="Energy sub metering")
   with(df,lines(Time,Sub_metering_2,col="blue"))
   with(df,lines(Time,Sub_metering_3,col="red"))
   legend("topright",lwd=1,col=c("black","blue","red"),legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))
  plot(Time, Global_reactive_power,type="l",main="",xlab="datetime",ylab="Global_reactive_power")
 
})
  

dev.off()
