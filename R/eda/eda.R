## ----setup, include=FALSE------------------------------------------------
knitr::opts_chunk$set(echo = TRUE)

## ----eda1, eval=TRUE, echo=TRUE, message=FALSE, results='hide'-----------
library(skimr)
library(descriptr)

## ----eda0----------------------------------------------------------------
ds_screener(mtcarz)

## ----eda2----------------------------------------------------------------
summary(mtcarz)

## ----eda3----------------------------------------------------------------
skim(mtcarz)

## ----eda4----------------------------------------------------------------
ds_summary_stats(mtcarz, mpg)

## ----eda4a---------------------------------------------------------------
ds_multi_stats(mtcarz, mpg, disp, hp)

## ----eda5----------------------------------------------------------------
ds_freq_cont(mtcarz, mpg)

## ----eda6, fig.width=4, fig.height=3, fig.align='center', echo=FALSE-----
k <- ds_freq_cont(mtcarz, mpg)
plot(k)

## ----eda6a, fig.align='center', fig.width=4, fig.height=3----------------
plot(ds_freq_cont(mtcarz, mpg))

## ----eda7----------------------------------------------------------------
ds_freq_table(mtcarz, cyl)

## ----eda8, fig.align='center'--------------------------------------------
k <- ds_freq_table(mtcarz, cyl)
plot(k)

## ----eda9----------------------------------------------------------------
ds_cross_table(mtcarz, cyl, gear)

## ----eda10, fig.align='center'-------------------------------------------
k <- ds_cross_table(mtcarz, cyl, gear)
plot(k)

## ----eda11, fig.align='center'-------------------------------------------
k <- ds_cross_table(mtcarz, cyl, gear)
plot(k, stacked = TRUE)

## ----eda12, fig.align='center'-------------------------------------------
k <- ds_cross_table(mtcarz, cyl, gear)
plot(k, proportional = TRUE)

## ----eda13---------------------------------------------------------------
ds_group_summary(mtcarz, cyl, mpg)

## ----eda14, fig.align='center'-------------------------------------------
k <- ds_group_summary(mtcarz, cyl, mpg)
plot(k)

