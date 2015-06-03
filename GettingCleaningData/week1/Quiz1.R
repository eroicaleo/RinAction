# Problem 1
download.file(url = "https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Fss06hid.csv", destfile = "./ss06hid.csv", method = "curl")
list.files("./")
data <- read.csv("ss06hid.csv")
solution <- sum(data$VAL == 24, na.rm = TRUE)

# Problem 2
FES <- data$FES
FES
nameVec <- names(data)
sum(nameVec == "FES")
print("The problem with this variable is that it contains both marriage status and employment status.")
print("We should have put them to 2 variables.")

# Problem 3
library(xlsx)
fileUrl <- "https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2FDATA.gov_NGAP.xlsx"
download.file(url = fileUrl, destfile = "./gov_NGAP.xlsx", method = "curl")
rowIndex <- 18:23
colIndex <- 7:15
dat <- read.xlsx(file = "./gov_NGAP.xlsx", sheetIndex = 1, header = TRUE, rowIndex = rowIndex, colIndex = colIndex)
dat
sum(dat$Zip*dat$Ext,na.rm=T)

# Problem 4
library(XML)
fileUrl <- "https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Frestaurants.xml"
download.file(fileUrl, destfile="./localFile.xml", method="curl", quiet=T)
doc <- xmlTreeParse("./localFile.xml", useInternal=T)
rootNode <- xmlRoot(doc)
names(rootNode)
rootNode[[1]][[1]]
rootNode[[1]][[1]][[2]]
zipcodeVec <- xpathSApply(doc = rootNode, "//zipcode", xmlValue)
s <- length(zipcodeVec[zipcodeVec == "21231"])

# Problem 5
library(data.table)
fileUrl <- "https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Fss06pid.csv"
download.file(fileUrl, destfile = "./06pid.csv", method = "curl")
DT <- fread("./06pid.csv")
head(DT)
DT[,mean(pwgtp15),by=SEX]