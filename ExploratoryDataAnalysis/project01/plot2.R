initial <- read.table("./household_power_consumption.txt", sep = ";", nrows = 20, header = TRUE)
classes <- sapply(initial, class)

# I open the files and find the last lines
# of 02/02/2007 to be 69517
lastRow = 69517
tabAll <- read.table("./household_power_consumption.txt", sep = ";", nrows = lastRow-1, header = TRUE, colClasses = classes, na.strings = "?")
tab2Days <- subset(tabAll, Date == "1/2/2007" | Date == "2/2/2007")

par(mfrow = c(1, 1))
with(tab2Days,
{
  rowNum = nrow(tab2Days)
  plot(Global_active_power,
       type = "n", 
       xaxt = "n",
       ylab = "Global Active Power (kilowatts)",
       xlab = "")
  lines(Global_active_power, xaxt = "n")
  axis(1, at = c(1, rowNum / 2, rowNum), labels = c("Thu", "Fri", "Sat"))
}
)

dev.copy(png, file = "plot2.png")
dev.off()

