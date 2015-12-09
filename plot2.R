path<-"C:\\Users\\schwaali\\Documents\\Github\\ExData_Plotting1"
setwd(path)
library("tcltk2")
df<-read.csv.sql("household_power_consumption.txt", sql="select*from file where Date='2/2/2007' or Date = '1/2/2007'" ,header=TRUE, sep=";")
df$Time2<-paste(df$Date,df$Time)
df$Time2<-strptime(df$Time2,"%d/%m/%Y %T")
df$Date<-as.Date(strptime(df$Date,"%d/%m/%Y"))

png('plot2.png')
plot(df$Time2,df$Global_active_power, type="l",main="",xlab="",ylab="Global Active Power (kilowatts)")
dev.off()

