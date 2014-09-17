library("MASS")

print(summary(Boston))
# fix(Boston)
# pairs(Boston)
print(colnames(Boston))

##----------------------------------------------------------------------------------------------------
## exercise (f)
##----------------------------------------------------------------------------------------------------
print("exercise (f)")
index = which(colnames(Boston) == "ptratio")
print(index)
print(sprintf("The pupil teacher ration median is %f.", median(Boston[,index])))

##----------------------------------------------------------------------------------------------------
## exercise (g)
##----------------------------------------------------------------------------------------------------
print("exercise (g)")
medv_index = which(colnames(Boston) == "medv")
print(medv_index)
min_medv = min(Boston[, medv_index])
min_medv_ix = which.min(Boston[, medv_index])
print(sprintf("Suburb No. %d has the lowest medv, which is %f", min_medv_ix, min_medv))
print('The other values in the suburb is:')
print(Boston[min_medv_ix,])

##----------------------------------------------------------------------------------------------------
## exercise (h)
##----------------------------------------------------------------------------------------------------

print("exercise (h)")
rm_index = which(colnames(Boston) == "rm")
print(rm_index)

more_than_7rooms = (Boston[,rm_index] > 7)
print(sprintf("there are %d suburbs with more than 7 rooms", sum(t(more_than_7rooms))))

more_than_8rooms = (Boston[,rm_index] > 8)
print(sprintf("there are %d suburbs with more than 8 rooms", sum(t(more_than_8rooms))))
