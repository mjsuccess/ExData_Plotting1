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
a=a[,-2]
a$Date = strptime(a$Date,"%d/%m/%Y %H:%M:%S")
begin = strptime("31/01/2007 23:59:59","%d/%m/%Y %H:%M:%S")
end = strptime("03/02/2007 00:00:00","%d/%m/%Y %H:%M:%S")

a2 = subset(a,a$Date>begin & a$Date<end)

png(filename = "ExData_Plotting1/plot1.png",height=480, width=480)
hist(a2$Global_active_power,col = "red", xlab = "Global Active Power (kilowatts)", main = "Global Active Power")
dev.off()
