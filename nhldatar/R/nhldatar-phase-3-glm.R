#' ---------
#' Title: Linear Model 
#' Subtitle: lm()
#' Author: Robert Papel
#' ---------

#'###### -------------**Libraries**---------------------- ######

library(tidyverse)
library(vtreat)
library(ROCR)

#'###### -------------**Functions**---------------------- ######

# RMSE function
rmse <- function(predcol, ycol) {
  res = predcol-ycol
  sqrt(mean(res^2))
  }

# R-squared function
r_squared <- function(predcol, ycol) {
  tss = sum( (ycol - mean(ycol))^2 )
  rss = sum( (predcol - ycol)^2 )
  1 - rss/tss
  }

#'###### -------------**Generalized Linear Model**------------- ######

# Gets rid of years with Ties (so, 1990-2006)
outcomes <- outcomes[-c(1:16632), ]

# Change "Date" column format in outcomes
outcomes$Date <- sub("(\\d{4})-.*", "\\1", outcomes$Date)

# Adds "Win" column, if home team won
outcomes <- mutate(outcomes, Win = GHome > GVisitor)
outcomes$Year <- outcomes$Date
outcomes$Year <- as.numeric(outcomes$Year)
outcomes <- outcomes[, -1]

# Get percentage of home team wins in outcomes set
summary(outcomes) # 7941 TRUEs
home_win_perc <- 7941 / 14532 # Home team wins 54.6% of the time
away_win_perc <- 6591 / 14532

# Linear model on full data set
lm_model_full <- glm(Win ~ GHome + GVisitor, outcomes, family = "poisson")
summary(lm_model_full)
res_full <- lm_model$residuals
rmse_full <- sqrt(mean(res^2))
outcomes$Prediction <- predict(lm_model_full, outcomes)

# Splitting the data
N <- nrow(outcomes)
target <- round(N * 0.75)
gp <- runif(N)
outcomes_train <- outcomes[gp < 0.75, ]
outcomes_test <- outcomes[gp >= 0.75, ]

# Linear model on training set
lm_model_train <- glm(Win ~ GHome + GVisitor, outcomes_train, family = "poisson")
summary(lm_model_train)
res_train <- lm_model_train$residuals
rmse_train <- sqrt(mean(res_train^2))

# Predict using split sets
outcomes_train$Prediction <- predict(lm_model_train)
outcomes_test$Prediction <- predict(lm_model_train, outcomes_test, type = "response")

# Cross validation
splitplan <- kWayCrossValidation(nrow(outcomes), 5, NULL, NULL)
str(splitplan)

k <- 5 # Number of folds
outcomes$pred.cv <- 0 
for(i in 1:k) {
  split <- splitplan[[i]]
  model <- glm(Win ~ GHome + GVisitor, data = outcomes[split$train, ])
  outcomes$pred.cv[split$app] <- predict(model, newdata = outcomes[split$app, ])
}

# The two RMSE's are about the same
rmse_full
rmse_cv <- sqrt(mean(model$residuals^2))



