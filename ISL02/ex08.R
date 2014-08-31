
library("ISLR")
college = read.csv('College.csv', header=T, na.strings="?")
print(dim(college))
rownames(college) = college[, 1]
print(dim(college))
college = college[, -1]
print(dim(college))
# fix(college)

print(summary(college))

# pairs(college[, 1:10])

plot(college$Private, college$Outstate)

Elite = rep("No", nrow(college))
Elite[college$Top10perc > 50] = "Yes"
Elite = as.factor(Elite)
college = data.frame(college, Elite)

print(summary(college$Elite))
plot(college$Elite, college$Outstate, xlab="Elite", ylab="Outstate")

attach(college)
hist(Accept, breaks=15)
