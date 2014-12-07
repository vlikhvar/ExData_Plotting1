mydata <- read.table("household_power_consumption.txt", header=TRUE, sep=";", na.strings="?")
sub <- subset(mydata, Date=="1/2/2007" | Date=="2/2/2007")
with(sub, hist(Global_active_power, col="red",
               xlab = "Global Active Power (kilowatts)",
               main = "Global Active Power",
               cex.main = 1, cex.lab = .9, cex.axis = .8))
dev.copy(png, "plot1.png")
dev.off()