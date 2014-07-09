
setwd('~/programs/r/workspace/exdata/week1hw/')
getwd()

data <- read.table(
  "../household_power_consumption.txt", 
  ##"../test.txt", 
  sep=";",
  header=TRUE,
  stringsAsFactors=FALSE)


data <- data[
  as.Date(data$Date, format="%d/%m/%Y") >= as.Date('1/2/2007', format="%d/%m/%Y")
  & as.Date(data$Date, format="%d/%m/%Y") <= as.Date('2/2/2007', format="%d/%m/%Y"),]

datetime <- as.POSIXct(paste(data$Date, data$Time, sep=" "), format="%d/%m/%Y %H:%M:%S")

data <- cbind(data, datetime)

png("./plot3.png", 480, 480, "px")

with(data, plot(datetime, Sub_metering_1, type='l', col='black', 
                xaxt="n", 
                yaxt="n",
                xlab="",
                ylab="Energy sub metering"))
with(data, points(datetime, Sub_metering_2, type='l', col='red'))
with(data, points(datetime, Sub_metering_3, type='l', col='blue'))
legend("topright", 
       ##pch = 1, 
       lty = 1,
       col = c("black", "red", "blue"), 
       legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

##Use POSIXlt function to get wday
xAxisAt <- as.POSIXct(c("2007-02-01 00:00:00", "2007-02-02 00:00:00", "2007-02-03 00:00:00"))
xAxisLabels <- c("Thu","Fri","Sat")

axis(1, at=xAxisAt, labels=xAxisLabels)
axis(2, at=seq(0, 30, by=10), labels=seq(0, 30, by=10))

dev.off()
