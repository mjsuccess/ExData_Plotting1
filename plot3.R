##clear the environment
rm(list = ls())
##set working directory
## - NB! This needs to be edited to refer to the location of the data on your system -
setwd("C:/Users/J Miller/Desktop/Data Science Course/Exploratory Data Analysis")

##Read in data
a = read.table("household_power_consumption.txt",header = T,sep = ";",na.strings = "?", 
               colClasses = c("character","character","numeric","numeric","numeric","numeric","numeric","numeric","numeric"),
               nrows = 2100000, comment.char = "")
a[,1]= paste(a$Date,a$Time)
a$Date = strptime(a$Date,"%d/%m/%Y %H:%M:%S")
begin = strptime("31/01/2007 23:59:59","%d/%m/%Y %H:%M:%S")
end = strptime("03/02/2007 00:00:00","%d/%m/%Y %H:%M:%S")

a2 = subset(a,a$Date>begin & a$Date<end)
a2[,2]=weekdays(a2$Date)
colnames(a2)[2] <- "Weekday"

png(filename = "ExData_Plotting1/plot3.png")
plot(a2$Sub_metering_1,xaxt="n",xlab="",ylab = "Energy sub metering",type = "n")
lines(a2$Sub_metering_1)
lines(a2$Sub_metering_2,col="red")
lines(a2$Sub_metering_3,col="blue")
legend("topright",lwd = 2,col = c("black","red","blue"),legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))
lablist<-as.vector(c("Thu","Fri","Sat"))
axis(1, at=seq(0, 2880, by=1440), labels = FALSE)
text(seq(0, 2880, by=1440),par("usr")[3]-0.1, labels = lablist, pos = 1, xpd = TRUE)
dev.off()
