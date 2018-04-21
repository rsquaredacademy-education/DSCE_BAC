# libraries
library(readr)
library(dplyr)
library(party)
library(rpart)
library(rpart.plot)

# Read Data
titanic <- 
  "https://goo.gl/At238b" %>%
  read_csv %>% # read in the data
  select(survived, embarked, sex, 
         sibsp, parch, fare) %>%
  mutate(embarked = factor(embarked),
         sex = factor(sex))


# Training & Test Data
data <- 
  c("training", "test") %>%
  sample(nrow(titanic), replace = T) %>%
  split(titanic, .)

train <- data$training
test <- data$test

# decision tree
rtree_fit <- rpart(survived ~ ., data = train, method = "class") 
rpart.plot(rtree_fit)

# predict
pred <- predict(rtree_fit, test, type = "class")

# confusion matrix
table(test$survived, pred)


