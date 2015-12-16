path<-"C:\\Users\\schwaali\\Documents\\Github\\ExData_Plotting1"
setwd(path)
library("sqldf")
#library("reshape2")
df<-read.csv.sql("household_power_consumption.txt", sql="select*from file where Date='2/2/2007' or Date = '1/2/2007'" ,header=TRUE, sep=";")


#subdf<-data.frame(df$Sub_metering_1,df$Sub_metering_2,df$Sub_metering_3,paste(df$Date,df$Time))
#colnames(subdf)<-c("Sub_metering_1","Sub_metering_2","Sub_metering_3","Time")
#m<-melt(subdf)
#m$Time<-strptime(m$Time,"%d/%m/%Y %T")

df$Time<-strptime(paste(df$Date,df$Time),"%d/%m/%Y %T")
df$Date<-as.Date(strptime(df$Date,"%d/%m/%Y"))

png('plot3.png', width=480, height=480))
#ggplot(m,aes(Time,value, col=variable))+geom_line()


with(df,plot(Time,Sub_metering_1,type="l",xlab="",ylab="Energy sub metering"))
with(df,lines(Time,Sub_metering_2,col="blue"))
with(df,lines(Time,Sub_metering_3,col="red"))
legend("topright",lwd=1,col=c("black","blue","red"),legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))


dev.off()
