#' ---------
#' Title: Phase 3, for nhldatar package
#' Subtitle: Am I gonna build a stack? 
#' Author: Robert Papel
#' ---------

#'###### -------------**Libraries**---------------------- ######

library(stringr)
library(tidyverse)
library(LiblineaR)
library(mltools)
library(class)
library(glmnet)
library(data.table)

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

#'###### -------------**Poisson Distribtion Model**-------------- ######

outcomes <- outcomes %>% 
  mutate(
    avg_home_goals = mean(outcomes$GHome, na.rm = TRUE),
    avg_visitor_goals = mean(outcomes$GVisitor, na.rm = TRUE),
    total_avg_goals = ((avg_home_goals + avg_visitor_goals) / 2)
  ) 

# Using number of goals
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
          team ="Nashville Predators", 
          opponent = "Chicago Blackhawks"), 
        type ="response")

# Prediction for CHI number of goals
predict(model_one,
        data.frame(
          home = 0, 
          team ="Chicago Blackhawks", 
          opponent = "Nashville Predators"), 
        type ="response")










