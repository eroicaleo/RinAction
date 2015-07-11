initial <- read.table("./household_power_consumption.txt", sep = ";", nrows = 20, header = TRUE)
classes <- sapply(initial, class)

# I just open the files and find the last lines
# of 02/02/2007 to be 69517
lastRow = 69517
tabAll <- read.table("./household_power_consumption.txt", sep = ";", nrows = lastRow-1, header = TRUE, colClasses = classes, na.strings = "?")
tail(tabAll)
tab2Days <- subset(tabAll, Date == "1/2/2007" | Date == "2/2/2007")
head(tab2Days)
tail(tab2Days)

hist(tab2Days$Global_active_power,
     breaks = 12, 
     col = "red", 
     main = "Global Active Power",
     xlab = "Global Active Power (kilowatts)")
