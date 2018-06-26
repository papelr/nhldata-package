#' ---------
#' Title: Team scrape, year by year
#' Subtitle: Nashville to start,
#' Author: Robert Papel
#' ---------

#'###### -------------**Libraries**---------------------- ######

library(tidyverse)
library(rvest)
library(caret)
library(vars)

#'###### -------------**Links for NSH**---------- ######

NSH_links <- c("https://www.hockey-reference.com/teams/NSH/2006.html",
               "https://www.hockey-reference.com/teams/NSH/2007.html",
               "https://www.hockey-reference.com/teams/NSH/2008.html",
               "https://www.hockey-reference.com/teams/NSH/2009.html",
               "https://www.hockey-reference.com/teams/NSH/2010.html",
               "https://www.hockey-reference.com/teams/NSH/2011.html",
               "https://www.hockey-reference.com/teams/NSH/2012.html",
               "https://www.hockey-reference.com/teams/NSH/2014.html",
               "https://www.hockey-reference.com/teams/NSH/2015.html",
               "https://www.hockey-reference.com/teams/NSH/2016.html",
               "https://www.hockey-reference.com/teams/NSH/2017.html",
               "https://www.hockey-reference.com/teams/NSH/2018.html")

#'###### -------------**Loop**---------------------- ######

NSH_stats <- NULL

for (i in 1:length(NSH_links)) {
  
  NSH_seasons <- NSH_links[i] %>%
    read_html %>%
    html_node("#team_stats") %>%
    html_table(header = T)
  
  NSH_stats <- rbind(NSH_stats, NSH_seasons)
  
}

#'###### -------------**Removes League Averages**-------------- ######

NSH_stats <- NSH_stats[, -26]
NSH_stats <- NSH_stats[-c(2,4,6,8,10,12,14,16,18,20,22,24), ]
NSH_stats$Year <- c(2006,2007,2008,2009,2010,2011,
                      2012,2014,2015,2016,2017,2018)

#'###### -------------**NSH Modeling**---------------------- ######

# Train/Test spliting
set.seed(69)
rows <- sample(nrow(NSH_stats))
NSH_stats <- NSH_stats[rows, ]
split <- round(nrow(NSH_stats) * .65)

train <- NSH_stats[1:split, ]
test <- NSH_stats[(split + 1):nrow(NSH_stats), ]

# CV, on whole data set model
caret_m1 <- train(
  PTS ~ W + GF + GA + S + SA, NSH_stats,
  method = "glmnet",
  trControl = trainControl(
    method = "cv", number = 5,
    repeats = 5, verboseIter = TRUE
    )
  )
caret_m1$results
pred <- predict(caret_m1, NSH_stats)

# Train/Test model
caret_m2 <- train(
  PTS ~ W + GF + GA + S + SA, train,
  method = "glmnet",
  trControl = trainControl(
    method = "cv", number = 5,
    verboseIter = TRUE
    )
  )
caret_m2$results
pred2 <- predict(caret_m2, test)

# Random Forest model on full set
caret_m3 <- train(
  (PTS ~ W + GF + GA + S + SA),
  tuneLength = 2,
  NSH_stats, method = "ranger",
  trControl = trainControl(
    method = "cv", number = 5
    )
  )
caret_m3$results
pred3 <- predict(caret_m3, NSH_stats)

# Random Forest model on Train/Test set
caret_m4 <- train(
  (PTS ~ W + GF + GA + S + SA),
  tuneLength = 2,
  train, method = "ranger",
  trControl = trainControl(
    method = "cv", number = 5
  )
)
caret_m4$results
pred4 <- predict(caret_m3, test)

# Resamples comparisons
model_list <- list(
  glmnet_full = caret_m1,
  glmnet_split = caret_m2,
  randomforest_full = caret_m3,
  randomforest_split = caret_m4
)

resamp <- resamples(model_list)
summary(resamp)
dotplot(resamp, metric = "RMSE")

# Predictions
table(pred,
pred3)
table(pred2,
pred4)

     
#'###### -------------**Vars package...uh**---------------------- ######






