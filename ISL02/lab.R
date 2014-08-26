x = c(1, 3, 5, 6)
print(x)
x = c(1, 6, 2)
print(x)
y = c(1, 4, 3)
print(y)
print(x+y)
print(ls())
rm(x, y)
print(ls())

x = matrix(c(1, 2, 3, 4), 2, 2)
print(x)
x1 = matrix(c(1, 2, 3, 4), 2, 2, byrow=TRUE)
print(x1)

print(sqrt(x))
print(x^2)

x = rnorm(50)
y = x + rnorm(50, mean=50, sd=0.1)
print(cor(x, y))

set.seed(1303)
print(rnorm(50))

set.seed(3)
y = rnorm(100)
print(mean(y))
print(var(y))
print(sqrt(var(y)))
print(sd(y))

print('2.3.2 Graphics')
