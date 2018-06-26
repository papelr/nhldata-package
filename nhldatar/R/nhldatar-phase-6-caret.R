#' ---------
#' Title: Linear Model 
#' Subtitle: caret package models
#' Author: Robert Papel
#' ---------

#'###### -------------**Libraries**---------------------- ######

library(tidyverse)
library(caret)

#'###### -------------**Cleaning**---------------------- ######

str(outcomes)
outcomes$Date <- sub("(\\d{4})-.*", "\\1", outcomes$Date)
outcomes$Date <- as.numeric(outcomes$Date)
outcomes$Att. <- as.numeric(gsub("," , "", outcomes$Att.))
outcomes$Visitor <- as.factor(outcomes$Visitor)
outcomes$Home <- as.factor(outcomes$Home)
outcomes$GVisitor <- as.numeric(outcomes$GVisitor)
outcomes$GHome <- as.numeric(outcomes$GHome)

#'###### -------------**Caret Package**---------------------- ######

caret_m1 <- train(
  GHome ~ GVisitor + Home + Visitor, outcomes,
  method = "glmnet",
  tuneGrid = expand.grid(alpha = 0:1,
              lambda = seq(0.0001, 1, length = 100)),
  trControl = trainControl(
    method = "cv", number = 10,
    verboseIter = TRUE
  )
)