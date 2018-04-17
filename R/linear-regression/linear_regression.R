## ----setup, include=FALSE------------------------------------------------
knitr::opts_chunk$set(echo = TRUE)

## ----lm1, message=FALSE, results='hide'----------------------------------
library(readxl)
library(caret)
library(olsrr)

## ----lm2-----------------------------------------------------------------
housing <- read_excel("data/boston.xls")
housing

## ----lm3-----------------------------------------------------------------
out <- createDataPartition(y = housing$CRIM, p = 0.7, list = FALSE)
train <- housing[out, ]
test <- housing[-out, ]

## ----lm4-----------------------------------------------------------------
model <- lm(MV ~ ., data = housing)
model

## ----lm5-----------------------------------------------------------------
model <- lm(MV ~ ., data = housing)
summary(model)

## ----lm6-----------------------------------------------------------------
model <- lm(MV ~ ., data = housing)
ols_regress(model)

## ----lm7-----------------------------------------------------------------
model <- lm(MV ~ ., data = housing)
ols_step_forward_aic(model)

## ----lm8-----------------------------------------------------------------
model <- lm(MV ~ ., data = housing)
ols_step_backward_aic(model)

## ----lm9-----------------------------------------------------------------
model <- lm(MV ~ ., data = housing)
ols_step_both_aic(model)

## ----lm10, fig.align='center'--------------------------------------------
model <- lm(MV ~ ., data = housing)
ols_plot_resid_qq(model)

## ----lm11----------------------------------------------------------------
model <- lm(MV ~ ., data = housing)
ols_test_normality(model)

## ----lm12, fig.align='center'--------------------------------------------
model <- lm(MV ~ ., data = housing)
ols_plot_resid_fit(model)

## ----lm13, fig.align='center'--------------------------------------------
model <- lm(MV ~ ., data = housing)
ols_plot_resid_hist(model)

## ----lm14----------------------------------------------------------------
model <- lm(MV ~ ., data = housing)
ols_coll_diag(model)

## ----lm15----------------------------------------------------------------
model <- lm(MV ~ ., data = housing)
ols_correlations(model)

## ----lm16----------------------------------------------------------------
model <- lm(MV ~ ., data = housing)
ols_test_breusch_pagan(model)

## ----lm17----------------------------------------------------------------
model <- lm(MV ~ ., data = housing)
ols_test_score(model)

## ----lm18----------------------------------------------------------------
model <- lm(MV ~ ., data = housing)
ols_test_f(model)

## ----lm19, fig.align='center'--------------------------------------------
model <- lm(MV ~ ., data = housing)
ols_plot_cooksd_bar(model)

## ----lm20, fig.align='center'--------------------------------------------
model <- lm(MV ~ ., data = housing)
ols_plot_dffits(model)

## ----lm21, fig.align='center'--------------------------------------------
model <- lm(MV ~ ., data = housing)
ols_plot_resid_stand(model)

## ----lm22, fig.align='center'--------------------------------------------
model <- lm(MV ~ ., data = housing)
ols_plot_resid_lev(model)

