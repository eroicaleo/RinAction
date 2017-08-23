# https://stackoverflow.com/questions/19226816/how-can-i-view-the-source-code-for-a-function/19226817#19226817
# https://stackoverflow.com/questions/22133191/how-to-debug-a-non-exported-function
# https://www.rdocumentation.org/packages/xgboost/versions/0.6-4/topics/predict.xgb.Booster
# https://support.rstudio.com/hc/en-us/articles/200713843?version=1.0.153&mode=desktop

# A tutorial about dotCall can be found here.
# http://www.biostat.jhsph.edu/~bcaffo/statcomp/files/dotCall.pdf

require(xgboost)
require(tidyverse)
require(Matrix)
set.seed(20121228)
setwd("~/prog/GitHub/RinAction/XGBoost/")
train <- read.csv("train.csv")
test <- read.csv("test.csv")

is_female <- as.numeric(train$Sex) - 1
is_female_m <- as.matrix(is_female)
dtrain <- xgb.DMatrix(data = is_female_m, label = train$Survived)
bstDMatrix_02 <- xgboost(data = dtrain, max.depth = 2,
                         eta = 1, nthread = 2, nrounds = 1, objective = "binary:logistic")

debug(predict)
pred <- predict(bstDMatrix_02, is_female_m)
xgb.dump(bstDMatrix_02, with_stats = TRUE)
xgb.plot.tree(model = bstDMatrix_02)

# If you step into the predict function, you will find it eventually
# go to the predict.xgb.Booster in xgb.Booster.R
# Then in this function, it calls the c++ function XGBoosterPredict_R,
# which is in R-package/src/xgboost_R.cc
# ret <- .Call("XGBoosterPredict_R", object$handle, newdata,
#              option[1], as.integer(ntreelimit), PACKAGE = "xgboost")
# Then it calls the XGBoosterPredict which is in src/c_api/c_api.cc
# Then it calls bst->learner()->Predict(), which is defined in learner.cc .
# Then it calls this->PredictRaw(data, out_preds, ntree_limit); in learner.cc
# Then it calls gbm_->PredictBatch(data, out_preds, ntree_limit); in learner.cc
# predictor->PredictBatch(p_fmat, out_preds, model_, 0, ntree_limit); in gbtree.cc 217
# go to predictor/cpu_predictor.cc then go to PredLoopInternal
# then go to PredLoopSpecalize then go to PredValue

# xgboost::cb.cv.predict(bstDMatrix_0)
handle <- bstDMatrix_02$handle
class(bstDMatrix_02$handle)
summary(bstDMatrix_02$handle)
summary(bstDMatrix_02)
class(bstDMatrix_02)
