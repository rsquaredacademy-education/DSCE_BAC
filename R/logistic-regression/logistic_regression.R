## ----setup, include=FALSE------------------------------------------------
knitr::opts_chunk$set(echo = TRUE)

## ----glm1, message=FALSE, results='hide'---------------------------------
library(readr)
library(caret)
library(forcats)
library(magrittr)
library(blorr)

## ----glm2, echo=TRUE, message=FALSE, results='hide'----------------------
bank <- read_csv("data/bank.csv", col_types = list(
  col_integer(), 
  col_factor(levels = c("management", "technician", "entrepreneur", 
                        "blue-collar", "unknown", "retired", "admin.", 
                        "services", "self-employed", "unemployed", "housemaid",
                        "student")),
  col_factor(levels = c("married", "single", "divorced")),
  col_factor(levels = c("tertiary", "secondary", "unknown", "primary")),
  col_factor(levels = c("no", "yes")), col_double(),
  col_factor(levels = c("yes", "no")), col_factor(levels = c("yes", "no")),
  col_factor(levels = c("unknown", "cellular", "telephone")), col_integer(),
  col_factor(levels = c("may", "jun", "jul", "aug", "oct", "nov", "dec", "jan", 
                        "feb", "mar", "apr", "sep")), 
  col_integer(), col_integer(), col_integer(), col_integer(),
  col_factor(levels = c("unknown", "failure", "other", "success")),
  col_factor(levels = c("no", "yes"))
))

## ----glm3----------------------------------------------------------------
out <- createDataPartition(y = bank$age, p = 0.7, list = FALSE)
train <- bank[out, ]
test <- bank[-out, ]

## ----glm4----------------------------------------------------------------
bank$y <- fct_recode(bank$y, `0` = "no", `1` = "yes")

## ----glm5----------------------------------------------------------------
blr_woe_iv(bank, marital, y)

## ----glm6----------------------------------------------------------------
blr_woe_iv(bank, job, y)

## ----glm7----------------------------------------------------------------
blr_woe_iv(bank, default, y)

## ----glm8----------------------------------------------------------------
blr_bivariate_analysis(bank, y, marital)

## ----glm9----------------------------------------------------------------
blr_bivariate_analysis(bank, y, job)

## ----glm10, fig.align='center'-------------------------------------------
model <- glm(y ~  age + duration + previous + housing + default +
               loan + poutcome + job + marital, data = bank, 
             family = binomial(link = 'logit'))

## ----glm11---------------------------------------------------------------
summary(model)

## ----glm12, fig.align='center'-------------------------------------------
blr_regress(model)

## ----glm13, fig.align='center'-------------------------------------------
blr_model_fit_stats(model)

## ----glm14---------------------------------------------------------------
blr_confusion_matrix(model, cutoff = 0.5)

## ----glm15---------------------------------------------------------------
blr_step_aic_forward(model)

## ----glm16---------------------------------------------------------------
blr_step_aic_backward(model)

## ----glm17---------------------------------------------------------------
blr_step_aic_both(model)

## ----glm18---------------------------------------------------------------
blr_test_hosmer_lemeshow(model)

## ----glm19, fig.align='center'-------------------------------------------
blr_gains_table(model)

## ----glm20, fig.align='center'-------------------------------------------
model %>%
  blr_gains_table() %>%
  plot()

## ----glm21, fig.align='center'-------------------------------------------
model %>%
  blr_gains_table() %>%
  blr_roc_curve()

## ----glm22, fig.align='center'-------------------------------------------
model %>%
  blr_gains_table() %>%
  blr_ks_chart()

## ----glm23, fig.align='center'-------------------------------------------
blr_lorenz_curve(model)

## ----glm24, fig.align='center'-------------------------------------------
model %>%
  blr_gains_table() %>%
  blr_decile_capture_rate()

## ----glm25, fig.align='center'-------------------------------------------
model %>%
  blr_gains_table() %>%
  blr_decile_lift_chart()

