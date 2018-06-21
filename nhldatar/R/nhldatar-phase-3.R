#' ---------
#' Title: Phase 3, for nhldatar package
#' Subtitle: Models 
#' Author: Robert Papel
#' ---------

#'###### -------------**Libraries**---------------------- ######

library(stringr)
library(tidyverse)
library(glmnet)
library(data.table)
library(e1071)
library(klaR)
library(bnlearn)
library(rpart)

#'###### -------------**Removing Asterisks**---------------------- ######

outcomes$Home <- gsub("\\*", "", outcomes$Home)
outcomes$Visitor <- gsub("\\*", "", outcomes$Visitor)

#'###### -------------**Average Goals**---------------------- ######

outcomes %>% 
  summarise(
    avg_home_goals = mean(outcomes$GHome, na.rm = TRUE),
    avg_visitor_goals = mean(outcomes$GVisitor, na.rm = TRUE),
    total_avg_goals = ((avg_home_goals + avg_visitor_goals) / 2)
  ) -> goals

# Home team goal average: 3.014
# Away team goal average: 2.711
# Average total goals: 2.863

#'###### -------------**Dput for CV Question**-------------- ######

out_head <- dput(head(outcomes, 1000))
out_head <- as.data.frame(out_head)

#'###### -------------**Poisson Distribtion Model**-------------- ######

# Adapted from David Sheehan's Poisson example (lol as if it works)
outcomes <- outcomes %>% 
  mutate(
    avg_home_goals = mean(outcomes$GHome, na.rm = TRUE),
    avg_visitor_goals = mean(outcomes$GVisitor, na.rm = TRUE),
    total_avg_goals = ((avg_home_goals + avg_visitor_goals) / 2)
  ) 

# Using number of goals for prediction model
model_one <- 
  rbind(
    data.frame(goals = outcomes$GHome,
               team = outcomes$Home,
               opponent = outcomes$Visitor,
               home = 1),
    data.frame(goals = outcomes$GVisitor,
               team = outcomes$Visitor,
               opponent = outcomes$Home,
               home = 0)) %>%
  glm(goals ~ home + team + opponent, family = poisson (link = log), data = .)
summary(model_one)

# Prediction for NSH number of goals
predict(model_one,
        data.frame(
          home = 1, 
          team = "Nashville Predators", 
          opponent = "Chicago Blackhawks"), 
        type ="response")

# Prediction for CHI number of goals
predict(model_one,
        data.frame(
          home = 0, 
          team = "Chicago Blackhawks", 
          opponent = "Nashville Predators"), 
        type ="response")

# Probability function / matrix
simulate_game <- function(stat_model, homeTeam, awayTeam, max_goals = 10) {
  
  home_goals <- predict(model_one,
                            data.frame(home = 1, 
                                       team = homeTeam,
                                       opponent = awayTeam), 
                            type ="response")
  
  away_goals <- predict(model_one, 
                            data.frame(home = 0, 
                                       team = awayTeam, 
                                       opponent = homeTeam), 
                            type ="response")
  
  dpois(0: max_goals, home_goals) %o%  
    dpois(0: max_goals, away_goals) 
}

simulate_game(model_one, "Nashville Predators", "Chicago Blackhawks", 
          max_goals = 10)




#'###### -------------**Data set split**-------------- ######

# Takes off the "Date" column
outcomes <- outcomes[,-1]  

# Splits data set, but not randomly distributed
# train <- outcomes[1:24934, ]
# test <- outcomes[24935:31168, ]

# Adds "Train" column, with 1 or 0
outcomes$"Train" <- if_else(runif(nrow(outcomes)) < 0.80, 1 ,0)
train_column_number <- grep("Train", names(outcomes))

outcomes <- mutate(outcomes, Win = GHome > GVisitor)

outcomes_train <- outcomes[outcomes$Train == 1, -train_column_number]
outcomes_test <- outcomes[outcomes$Train == 0, -train_column_number]

outcomes_train$Home <- as.factor(outcomes_train$Home)
outcomes_train$Visitor <- as.factor(outcomes_train$Visitor)




#'###### -------------**Naive Bayes Model**-------------- ######

# Column number of train / test indicators 
train_column_number <- grep("Train", names(outcomes))



# # Separate Train / Test
# train_outcomes <- outcomes[outcomes$Train == 1, -train_column_number]
# test_outcomes <- outcomes[outcomes$Train == 0, -train_column_number]

# Naive Bayes model (known as model two)
model_two <- naiveBayes(outcomes$Home ~  outcomes$Visitor,
                        data = train_outcomes)
summary(model_two)
str(model_two)

# Prediction
test_predict_outcomes <- predict(model_two, test_outcomes[,-1])

# Confusion Matrix
table(predict = test_predict_outcomes, test_outcomes$Home)


#'###### -------------**Decision Treeeeees**-------------- ######

# Training set
# tree_train <- cbind(x_train, y_train)

# Grow tree 
model_three <- rpart(outcomes_train$Home ~ ., data = outcomes_train)
summary(fit)

# Predict Output 
predicted = predict(model_three, x_test)




#'###### -------------**Detritus**-------------- ######

outcomes$"Win" <- gsub(0, "No", outcomes$Train)
outcomes$"Win" <- gsub(1, "Yes", outcomes$Train)



