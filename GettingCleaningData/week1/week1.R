if (!file.exists("data")) {
  print("data dir doesn't exists!")
  dir.create("data")
} else {
  print("data dir exists!")
}

# download
if (!file.exists("./data/cameras.csv")) {
  fileUrl <- "https://data.baltimorecity.gov/api/views/dz54-2aru/rows.csv?accessType=DOWNLOAD"
  download.file(url = fileUrl, destfile = "./data/cameras.csv", method = "curl")
}
print(list.files("./data"))

# read the data
traffic <- read.csv("./data/cameras.csv")
head(traffic)

if (!file.exists("./data/cameras.xlsx")) {
  fileUrl <- "https://data.baltimorecity.gov/api/views/dz54-2aru/rows.xlsx?accessType=DOWNLOAD"
  download.file(url = fileUrl, destfile = "./data/cameras.xlsx", method = "curl")
}
print(list.files("./data"))

library(xlsx)
traffic <- read.xlsx(file = "./data/cameras.xlsx", sheetIndex = 1, header = TRUE)
head(traffic)

rowIndex <- 1:4
colIndex <- 2:3
traffic <- read.xlsx(file = "./data/cameras.xlsx", sheetIndex = 1, header = TRUE, rowIndex = rowIndex, colIndex = colIndex)
head(traffic)
traffic

library(XML)
fileUrl <- "http://www.w3schools.com/xml/simple.xml"
doc <- xmlTreeParse(file = fileUrl, useInternalNodes = TRUE)
rootNode <- xmlRoot(doc)
xmlName(rootNode)
names(rootNode)
str(rootNode)
class(rootNode)
summary(rootNode)
rootNode[[1]]
rootNode[[1]][[1]]
xmlSApply(rootNode, xmlValue)
xpathSApply(rootNode, "//name", xmlValue)
xpathSApply(rootNode, "//price", xmlValue)

fileUrl <- "http://espn.go.com/nfl/team/_/name/bal/baltimore-ravens"
doc <- htmlTreeParse(file = fileUrl, useInternalNodes = TRUE)
xpathSApply(doc, "//li[@class='team-name']", xmlValue)
xpathSApply(doc, "//li[@class='score']", xmlValue)
xpathSApply(doc, "//a[@name='&lpos=nfl:draft:player']", xmlValue)
xpathSApply(doc, "//div@class='game-info'", xmlValue)

library(jsonlite)
jsonData <- fromJSON("https://api.github.com/users/jtleek/repos")
names(jsonData)
names(jsonData$owner)
names(jsonData$owner$login)
myjson <- toJSON(iris, pretty = TRUE)
cat(myjson)
iris2 <- fromJSON(myjson)
head(iris2)

# data.table
library(data.table)
DT = data.table(x = rnorm(9), y = rep(c("a", "b", "c"), each = 3), z = rnorm(9))
DT
tables()
DT[2,]
DT[DT$y=="a",]
DT[c(2, 3)]
DT[,list(mean(x), sum(z))]
DT[,mean(x)]
DT[, table(y)]
DT[, w := z^2]
DT
DT[, m := {tmp <- x+z; log2(tmp+5)}]
DT
DT[, a := x > 0]
DT
DT[, b := mean(x+w), by = a]
DT

set.seed(123)
DT <- data.table(x = sample(letters[1:3], 1E5, TRUE))
DT[, .N, by = x]
DT <- data.table(x = rep(c("a", "b", "c", each = 100)), y = rnorm(300))
setkey(DT, x)
DT["a"]
DT['a']

DT1 <- data.table(x = c("a", "a", "b", "dt1"), y = 1:4)
DT1
DT2 <- data.table(x = c("a", "b", "dt2"), z = 1:3)
DT2
setkey(DT1, x);
setkey(DT2, x);
merge(DT1, DT2)
