mydata <- read.table("household_power_consumption.txt", header=TRUE, sep=";", na.strings="?")
sub <- subset(mydata, Date=="1/2/2007" | Date=="2/2/2007")
sub$DateTime <- paste(sub$Date, sub$Time, sep=" ")

library(lubridate)
sub$DateTime <- dmy_hms(sub$DateTime)

par(mar=c(3,4.5,2,2))
with(sub, {
  plot(DateTime, Sub_metering_1, type = "n",
       ylab = "Energy sub metering", xlab = "",
       main = "", cex.lab = .9, cex.axis = .8)
  lines(DateTime, Sub_metering_1, lwd=1)
  lines(DateTime, Sub_metering_2, lwd=1, col = "red")
  lines(DateTime, Sub_metering_3, lwd=1, col = "blue")
  legend("topright", legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), 
         lty = 1, cex = .8, col = c("black", "red", "blue"))
})

dev.copy(png, "plot3.png")
dev.off()
