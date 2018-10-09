"""
Liza Freed
Plot 2
"""
library("data.table")

#filter data
setwd("/Users/liza.freed/Rcourses/ExplData")
powerData = data.table::fread(input = "household_power_consumption.txt"
                             , na.strings="?")
powerData[, Global_active_power := lapply(.SD, as.numeric), .SDcols = c("Global_active_power")]
powerData[, dateTime := as.POSIXct(paste(Date, Time), format = "%d/%m/%Y %H:%M:%S")]
powerData = powerData[(dateTime >= "2007-02-01") & (dateTime < "2007-02-03")]

## Plot 2
png("plot2.png", width=480, height=480)
plot(x = powerData[, dateTime]
     , y = powerData[, Global_active_power]
     , type="l", xlab="", ylab="Global Active Power (kilowatts)")

dev.off()