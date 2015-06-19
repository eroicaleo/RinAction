install.packages("RMySQL")
library(RMySQL)
ucscDB <- dbConnect(MySQL(), user = "genome", host = "genome-mysql.cse.ucsc.edu")
result <- dbGetQuery(ucscDB, "show databases;"); dbDisconnect(conn = ucscDB)