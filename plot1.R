
setwd('~/programs/r/workspace/exdata/week1hw/')
getwd()

data <- read.table(
  "../household_power_consumption.txt", 
  ##"../test.txt", 
  sep=";",
  header=TRUE,
  stringsAsFactors=FALSE)

##colClasses works terrible
##dim(data[as.Date(data$Date, format="%d/%m/%Y") == as.Date('1/2/2007', format="%d/%m/%Y"),])
##dim(data[as.Date(data$Date, format="%d/%m/%Y") == as.Date('2/2/2007', format="%d/%m/%Y"),])

##dim(data[data$Date == '1/2/2007',])

data <- data[
  as.Date(data$Date, format="%d/%m/%Y") >= as.Date('1/2/2007', format="%d/%m/%Y")
  & as.Date(data$Date, format="%d/%m/%Y") <= as.Date('2/2/2007', format="%d/%m/%Y"),]

##str(data)
png("./plot1.png", 480, 480, "px")

hist(as.numeric(data$Global_active_power), 
     col='red', 
     main='Global Active Power', 
     ylab='Frequency', 
     xlab='Global Active Power(kilowatts)',
     ylim=c(0, 1200))


dev.off()