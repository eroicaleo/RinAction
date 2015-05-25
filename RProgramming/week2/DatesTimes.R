x <- as.Date("1970-01-01")
x
class(x)
unclass(x)
y <- as.Date("1970-01-02")
class(y)
unclass(y)

x <- Sys.time();
x
class(x)
p <- as.POSIXlt(x)
names(p)
class(p)
names(unclass(p))
p$sec

c <- as.POSIXct(x)
unclass(c)
str