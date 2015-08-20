library(neuralnet)

concrete <- read.csv("concrete.csv")
str(concrete)

normalize <- function(x) {
  (x - min(x)) / (max(x) - min(x))
}

concrete_norm <- as.data.frame(lapply(concrete, normalize))
summary(concrete_norm$strength)
summary(concrete$strength)

concrete_train <- concrete_norm[1:773,]
concrete_test  <- concrete_norm[774:1030,]

concrete_model <- neuralnet(strength ~ cement + slag + ash + water +
                            superplastic + coarseagg + fineagg + age,
                            data = concrete_train)

plot(concrete_model)
str(concrete_model)
