mydata <- read.table("household_power_consumption.txt", header=TRUE, sep=";", na.strings="?")
sub <- subset(mydata, Date=="1/2/2007" | Date=="2/2/2007")
sub$DateTime <- paste(sub$Date, sub$Time, sep=" ")

library(lubridate)
sub$DateTime <- dmy_hms(sub$DateTime)

with(sub, {
  plot(DateTime, Global_active_power, type = "n",
       ylab = "Global Active Power (kilowatts)", xlab = "",
       main = "", cex.lab = .9, cex.axis = .8)
  lines(DateTime, Global_active_power, lwd=1)
})
     
dev.copy(png, "plot2.png")
dev.off()
