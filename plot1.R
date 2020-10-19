power <- fread(input = "household_power_consumption.txt", na.strings="")
power[, global_active_power := lapply(.SD, as.numeric), .SDcols=c("global_active_power")]
power[, dateTime := as.POSIXct(paste(Date, Time), format = "%d/%m/%Y %H:%M:%S")]
power <- power[(dateTime >= "2007-02-01") & (dateTime <= "2007-02-02")]
png("plot1.png", width=480, height=480)
hist(power[, global_active_power], main="Global Active Power", 
     xlab="Global Active Power (kilowatts)", ylab="Frequency", col="Red")
dev.off()