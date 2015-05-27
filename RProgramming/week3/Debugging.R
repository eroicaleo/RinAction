log(-1)
printmessage <- function(x) {
  if (is.na(x)) {
    print("x is missing")
  } else if (x > 0) {
    print("x is greater than 0")
  } else {
    print("x is less or equal to 0")
  }
  invisible(x)
}
printmessage(-1)
printmessage(2)
x <- log(-1)
printmessage(x)
rm(x)
mean(x)
traceback()
rm(y)
lm(y ~ x)
traceback()

options(error = recover)
read.csv("nosuchfile")
