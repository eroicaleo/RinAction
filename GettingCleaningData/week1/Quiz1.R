# Problem 1

download.file(url = "https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Fss06hid.csv", destfile = "./ss06hid.csv", method = "curl")
list.files("./")
data <- read.csv("ss06hid.csv")
solution <- sum(data$VAL == 24, na.rm = TRUE)

# Problem 2
FES <- data$FES
FES

# Problem 3
library(xlsx)
fileUrl <- "https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2FDATA.gov_NGAP.xlsx"
download.file(url = fileUrl, destfile = "./gov_NGAP.xlsx", method = "curl")
rowIndex <- 18:23
colIndex <- 7:15
dat <- read.xlsx(file = "./gov_NGAP.xlsx", sheetIndex = 1, header = TRUE, rowIndex = rowIndex, colIndex = colIndex)
dat
sum(dat$Zip*dat$Ext,na.rm=T)
