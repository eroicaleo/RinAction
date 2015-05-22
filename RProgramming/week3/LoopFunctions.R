x <- 1:4
lapply(x, runif)
x <- list(a = 1:4, b = rnorm(10))
lapply(x, mean)
x <- list(a = 1:4, b = rnorm(10), c = rnorm(20, 5), d = rnorm(100, 20))
lapply(x, mean)
x <- 1:4
lapply(x, runif, min = 0, max = 10)
x <- list(matrix(1:4, 2, 2), b = matrix(1:6, 3, 2))
lapply(x, function(elt) elt[,1])
x <- list(a = 1:4, b = rnorm(10), c = rnorm(20, 5), d = rnorm(100, 20))
sapply(x, mean)

x <- matrix(rnorm(200), 20, 10)
apply(x, 2, mean)
apply(x, 1, mean)
apply(x, 1, sum)
apply(x, 1, quantile, probs = c(0.25, 0.75))

a <- array(rnorm(2*2*10), c(2, 2, 10))
apply(a, c(1, 2), mean)
rowMeans(a, dims = 2)

str(mapply)
mapply(rep, 1:4, 4:1)

noise <- function(n, mean, sd) {
  rnorm(n, mean, sd)
}

noise(5, 1, 2)
mapply(noise, 1:5, 5:1, 2)
mapply(rep, times = 1:4, MoreArgs = list(x = 42))

x <- c(rnorm(10), runif(10), rnorm(10, 1))
y <- gl(3, 10)
tapply(x, y, mean)
tapply(x, y, range)
split(x, y)
lapply(split(x, y), mean)

head(airquality)

s <- split(airquality, airquality$Month)
lapply(s, function(x) colMeans(x[, c("Ozone", "Solar.R", "Wind")]))
sapply(s, function(x) colMeans(x[, c("Ozone", "Solar.R", "Wind")]))
sapply(s, function(x) colMeans(x[, c("Ozone", "Solar.R", "Wind")], na.rm = TRUE))

x <- rnorm(10)
f1 <- gl(2, 5)
f2 <- gl(5, 2)
interaction(f1, f2)
split(x, list(f1, f2))
