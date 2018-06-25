#' ---------
#' Title: Bivariate Poisson, adapted from dataset from
#' Subtitle: Functions taken from the bivpois package
#' Author: Robert Papel
#' ---------

#'###### -------------**Libraries**---------------------- ######

library(tidyverse)
library(broom)
library(vtreat)

#'###### -------------**Cleaning**---------------------- ######

str(outcomes)
outcomes$Date <- sub("(\\d{4})-.*", "\\1", outcomes$Date)
outcomes$Date <- as.numeric(outcomes$Date)
outcomes$Att. <- as.numeric(gsub("," , "", outcomes$Att.))
outcomes$Visitor <- as.factor(outcomes$Visitor)
outcomes$Home <- as.factor(outcomes$Home)
outcomes$GVisitor <- as.numeric(outcomes$GVisitor)
outcomes$GHome <- as.numeric(outcomes$GHome)

#'###### -------------**2018 Season only**---------------------- ######

outcomes_2018 <- outcomes[-c(1:29813), ]
str(outcomes_2018)
summary(outcomes_2018)

#'###### -------------**lm.dp**---------------------- ######

# Formula for lambda 1 lambda 2
fmla <- ~c(Home, Visitor) + c(Visitor, Home)

# Double Poisson
outcomes.2018.m1 <- lm.bp(GHome ~ 1, GVisitor ~ 1, l1l2 = fmla, zeroL3 = TRUE, 
                          data = outcomes_2018)

# bivariate Poisson models
outcomes.2018.m2 <- lm.bp(GHome ~ 1, GVisitor ~ 1, l1l2 = fmla, 
                          data = outcomes_2018, maxit=2)
outcomes.2018.m3 <- lm.bp(GHome ~ 1, GVisitor ~ 1, l1l2 = fmla, l3 = ~ Home, 
                          data = outcomes_2018, maxit=2)
outcomes.2018.m4 <- lm.bp(GHome ~ 1, GVisitor ~ 1, l1l2 = fmla, l3 = ~Visitor, 
                          data = outcomes_2018, maxit=2)
outcomes.2018.m5 <- lm.bp(GHome ~ 1, GVisitor ~ 1, l1l2 = fmla, 
                          l3 = ~Home + Visitor, 
                          data = outcomes_2018, maxit=2)

# Zero Inflated Model
outcomes.2018.m6 <- lm.dibp(GHome ~ 1, GVisitor ~ 1, l1l2 = fmla, 
                           data = outcomes_2018, jmax = 0, maxit = 2)

# Diagonal Inflated Bivariate Poisson Models
outcomes.2018.m7 <- lm.dibp(GHome ~ 1, GVisitor ~ 1, l1l2 = fmla, 
                            data = outcomes_2018, distribution = "geometric", 
                            maxit = 2)
outcomes.2018.m8 <-lm.dibp(GHome ~ 1, GVisitor ~ 1, l1l2 = fmla, 
                           data = outcomes_2018, jmax = 1, 
                           maxit = 2)
outcomes.2018.m9 <-lm.dibp(GHome ~ 1, GVisitor ~ 1, l1l2 = fmla, 
                           data = outcomes_2018, jmax = 2, 
                           maxit = 2)
outcomes.2018.m10<-lm.dibp(GHome ~ 1, GVisitor ~ 1, l1l2 = fmla, 
                           data = outcomes_2018, jmax = 3, 
                           maxit = 2)
outcomes.2018.m11<-lm.dibp(GHome ~ 1, GVisitor ~ 1, l1l2 = fmla, 
                           data = outcomes_2018, distribution = "poisson", 
                           maxit = 2)

# Diagonal Inflated Double Poisson Model
outcomes.2018.m12 <- lm.dibp(GHome ~ 1, GVisitor ~ 1, l1l2 = fmla, 
                             data = outcomes_2018, distribution = "poisson", 
                             zeroL3 = TRUE , maxit = 2)
# AIC comparisons
outcomes.2018.m1$AIC # lowest AIC
outcomes.2018.m2$AIC
outcomes.2018.m3$AIC
outcomes.2018.m4$AIC
outcomes.2018.m5$AIC
outcomes.2018.m6$AIC
outcomes.2018.m7$AIC
outcomes.2018.m8$AIC
outcomes.2018.m9$AIC
outcomes.2018.m10$AIC
outcomes.2018.m11$AIC
outcomes.2018.m12$AIC







