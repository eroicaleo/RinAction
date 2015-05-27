library(datasets)
data(iris)
head(iris)

# Problem 1
s <- split(iris, iris$Species)
s[3]
lapply(s,function(x) mean(x[,"Sepal.Length"]))

# Problem 2
apply(iris[,1:4], 2, mean)

# Problem 3
data(mtcars)
head(mtcars)
tapply(mtcars$cyl, mtcars$mpg, mean)
with(mtcars, tapply(mpg, cyl, mean))
x <- tapply(mtcars$hp, mtcars$cyl, mean)

# Problem 4
abs(x["4"] - x["8"])
names(x)
