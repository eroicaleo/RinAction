# Problem 1
set.seed(1)
rpois(5, 2)

# Problem 5
set.seed(10)
x <- rep(0:1, 5)
e <- rnorm(10, 0, 20)
y <- 0.5 + 2*x + e
