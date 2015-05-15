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
abline(fit1, col = "red")
names(fit1)
confint(fit1, level = 0.95)
predict(fit1, data.frame(lstat=c(5, 10, 15)), interval = "confidence")
plot(medv~lstat, Boston, pch = 20)
plot(medv~lstat, Boston, pch = 20, col = "red")
abline(fit1, col = "red")
plot(predict(fit1), residuals(fit1))
residuals
x <- predict(fit1, data.frame(lstat=c(5, 10, 15)))
