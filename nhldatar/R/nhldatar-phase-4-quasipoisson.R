#' ---------
#' Title: Linear Model 
#' Subtitle: glm(), but quasipoisson?
#' Author: Robert Papel
#' ---------

#'###### -------------**Libraries**---------------------- ######

library(tidyverse)
library(broom)
library(vtreat)

#'###### -------------**GLM, Quasipoisson**-------------- ######

# Adapted from David Sheehan's Poisson example (lol as if it works)
# outcomes <- outcomes %>% 
#   mutate(
#     avg_home_goals = mean(outcomes$GHome, na.rm = TRUE),
#     avg_visitor_goals = mean(outcomes$GVisitor, na.rm = TRUE),
#     total_avg_goals = ((avg_home_goals + avg_visitor_goals) / 2)
#   ) 

# Change "Date" column format in outcomes
outcomes$Date <- sub("(\\d{4})-.*", "\\1", outcomes$Date)

# Using number of goals for prediction model
poisson_frame <- rbind(
    data.frame(goals = outcomes$GHome,
               team = outcomes$Home,
               opponent = outcomes$Visitor,
               home = 1),
    data.frame(goals = outcomes$GVisitor,
               team = outcomes$Visitor,
               opponent = outcomes$Home,
               home = 0))
qp_glm_model <- glm(goals ~ home + team + opponent, poisson_frame, 
                    family = quasipoisson)
summary(qp_glm_model)
qp_glm_model$null.deviance
qchisq(.95, df.residual(qp_glm_model))

# Pseudo r^2 -- this model is bad
glance(qp_glm_model) %>% 
  summarize(pseudoR2 = 1 - deviance/null.deviance)

# Prediction for NSH number of goals
predict(qp_glm_model,
        data.frame(
          home = 1, 
          team = "Nashville Predators", 
          opponent = "Chicago Blackhawks"), 
        type ="response")

# Prediction for CHI number of goals
predict(qp_glm_model,
        data.frame(
          home = 0, 
          team = "Chicago Blackhawks", 
          opponent = "Nashville Predators"), 
        type = "response")

# Probability function / matrix
simulate_game <- function(stat_model, home, away, max_goals = 10) {
  
  home_goals <- predict(qp_glm_model,
                        data.frame(home = 1, 
                                   team = home,
                                   opponent = away), 
                        type = "response")
  
  away_goals <- predict(qp_glm_model, 
                        data.frame(home = 0, 
                                   team = away, 
                                   opponent = home), 
                        type = "response")
  
  dpois(0: max_goals, home_goals) %o%  
    dpois(0: max_goals, away_goals) 
}

nsh_chi <- simulate_game(qp_glm_model, 
                         "Nashville Predators", "Chicago Blackhawks", 
              max_goals = 5)

# Matrix 
sum(nsh_chi[lower.tri(nsh_chi)]) # Nashville win
sum(nsh_chi[upper.tri(nsh_chi)]) # Chicago win
sum(diag(nsh_chi)) # Draw?


