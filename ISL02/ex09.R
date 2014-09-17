library("ISLR")

Auto = read.table("Auto.data", header=T, na.string="?")
Auto = na.omit(Auto)

print(dim(Auto))
print(summary(Auto))
attach(Auto)
print("mean and standard divation of mpg:")
print(c(mean(mpg), sd(mpg)))

Auto_remove = Auto[-(10:85),]
print(dim(Auto_remove))
print("mean and standard divation of mpg after removing:")
print(c(mean(Auto_remove$mpg), sd(Auto_remove$mpg)))

pairs(Auto)
