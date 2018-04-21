## libraries
library(readxl)
library(caret)
library(olsrr)

## read data
housing <- read_excel("data/boston.xls")
housing

## training & test data
out <- createDataPartition(y = housing$CRIM, p = 0.7, list = FALSE)
train <- housing[out, ]
test <- housing[-out, ]

## model 
model <- lm(MV ~ ., data = housing)
model

## model summary
model <- lm(MV ~ ., data = housing)
summary(model)

## regression results
model <- lm(MV ~ ., data = housing)
ols_regress(model)

## forward variable selection
model <- lm(MV ~ ., data = housing)
ols_step_forward_aic(model)

## backward selection
model <- lm(MV ~ ., data = housing)
ols_step_backward_aic(model)

## both direction selection
model <- lm(MV ~ ., data = housing)
ols_step_both_aic(model)

## collinearity diagnostics
model <- lm(MV ~ ., data = housing)
ols_coll_diag(model)

# predict on test data
predict.lm(model, newdata = test, type = "response")