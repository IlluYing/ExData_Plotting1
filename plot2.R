
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


png("./plot2.png", 480, 480, "px")
with(data, plot(datetime, 
                Global_active_power, 
                type='l', 
                xaxt="n",
                xlab="",
                ylab='Global Active Power(kilowatts)'))


##Use POSIXlt function to get wday
xAxisAt <- as.POSIXct(c("2007-02-01 00:00:00", "2007-02-02 00:00:00", "2007-02-03 00:00:00"))
xAxisLabels <- c("Thu","Fri","Sat")

axis(1, at=xAxisAt, labels=xAxisLabels)

dev.off()


