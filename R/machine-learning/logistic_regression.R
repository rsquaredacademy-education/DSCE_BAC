## libraries
library(readr)
library(caret)
library(forcats)
library(magrittr)
library(blorr)

## read data
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

## training and test data set
out <- createDataPartition(y = bank$age, p = 0.7, list = FALSE)
train <- bank[out, ]
test <- bank[-out, ]

## recode response variable
bank$y <- fct_recode(bank$y, `0` = "no", `1` = "yes")

## weight of evidence & information value
blr_woe_iv(bank, marital, y)
blr_woe_iv(bank, job, y)
blr_woe_iv(bank, default, y)

## bivariate analysis
blr_bivariate_analysis(bank, y, marital)
blr_bivariate_analysis(bank, y, job)

## model
model <- glm(y ~  age + duration + previous + housing + default +
               loan + poutcome + job + marital, data = bank, 
             family = binomial(link = 'logit'))

## model summary
summary(model)

## detailed output
blr_regress(model)

## model fit statistics
blr_model_fit_stats(model)

## confusion matrix
blr_confusion_matrix(model, cutoff = 0.5)

## variable selection
blr_step_aic_forward(model)
blr_step_aic_backward(model)
blr_step_aic_both(model)

## gains table
blr_gains_table(model)

## gains chart
model %>%
  blr_gains_table() %>%
  plot()

## ROC curve
model %>%
  blr_gains_table() %>%
  blr_roc_curve()

## KS chart
model %>%
  blr_gains_table() %>%
  blr_ks_chart()

## lorenz curve
blr_lorenz_curve(model)

## decile capture rate
model %>%
  blr_gains_table() %>%
  blr_decile_capture_rate()

## decile lift chart
model %>%
  blr_gains_table() %>%
  blr_decile_lift_chart()

