initial <- read.table("./household_power_consumption.txt", sep = ";", nrows = 20, header = TRUE)
classes <- sapply(initial, class)

# I open the files and find the last lines
# of 02/02/2007 to be 69517
lastRow = 69517
tabAll <- read.table("./household_power_consumption.txt", sep = ";", nrows = lastRow-1, header = TRUE, colClasses = classes, na.strings = "?")
tab2Days <- subset(tabAll, Date == "1/2/2007" | Date == "2/2/2007")

png("plot3.png", width=480, height=480)

par(mfrow = c(1, 1))
with(tab2Days,
{
  rowNum = nrow(tab2Days)
  plot(Sub_metering_1, 
       type = "n", 
       xaxt = "n",
       ylab = "Energy sub metering",
       xlab = "")
  lines(Sub_metering_1, xaxt = "n", col = "black")
  lines(Sub_metering_2, xaxt = "n", col = "red")
  lines(Sub_metering_3, xaxt = "n", col = "blue")
  axis(1, at = c(1, rowNum / 2, rowNum), labels = c("Thu", "Fri", "Sat"))
  legend("topright", 
         col = c("black", "red", "blue"), 
         legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
         lty = "solid")
}
)

dev.off()