library(MASS);
library(ISLR);
names(Boston);
?Boston;
x <- Boston$lstat;
plot(medv~lstat, Boston);
fit1 = lm(medv~lstat, Boston);
fit1
summary(fit1);
fit1$coefficients