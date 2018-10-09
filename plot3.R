"""
Liza Freed
Plot 3
"""
library("data.table")

#filter data
setwd("/Users/liza.freed/Rcourses/ExplData")
powerData = data.table::fread(input = "household_power_consumption.txt"
                              , na.strings="?")
powerData[, Global_active_power := lapply(.SD, as.numeric), .SDcols = c("Global_active_power")]
powerData[, dateTime := as.POSIXct(paste(Date, Time), format = "%d/%m/%Y %H:%M:%S")]
powerData = powerData[(dateTime >= "2007-02-01") & (dateTime < "2007-02-03")]

#plot 3
png("plot3.png", width=480, height=480)
plot(powerData[, dateTime], powerData[, Sub_metering_1], type="l", xlab="", ylab="Energy sub metering")
lines(powerData[, dateTime], powerData[, Sub_metering_2],col="red")
lines(powerData[, dateTime], powerData[, Sub_metering_3],col="blue")
legend("topright"
       , col=c("black","red","blue")
       , c("Sub_metering_1  ","Sub_metering_2  ", "Sub_metering_3  ")
       ,lty=c(1,1), lwd=c(1,1))
dev.off()