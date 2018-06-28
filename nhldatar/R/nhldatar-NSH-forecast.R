#' ---------
#' Title: Forecasting for NSH
#' Subtitle: Nashville to start
#' Author: Robert Papel
#' ---------

#'###### -------------**Libraries**---------------------- ######

library(tidyverse)
library(rvest)
library(vars)
library(forecast)
library(imputeTS)

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

#'###### -------------**Tidying Data**-------------- ######

# Removing "League Average" rows
NSH_stats <- NSH_stats[, -26]
NSH_stats <- NSH_stats[-c(2,4,6,8,10,12,14,16,18,20,22,24), ]

# Creating "Year" column
NSH_stats$Year <- c(2006,2007,2008,2009,2010,2011,
                    2012,2014,2015,2016,2017,2018)

# Selecting columns & stats
NSH_stats <- NSH_stats %>% 
  select_("Year", "W", "L", "PTS", "GF", "GA", "S", "SA")  
  
# Creating time series
NSH_ts <- ts(NSH_stats[ ,setdiff(names(NSH_stats), c("Team", "Year"))],
            start = c(2006),
            end = c(2018),
            frequency = 1)
class(NSH_ts)
NSH_ts <- na.mean(NSH_ts, option = "mean")

# Autoplot
autoplot(NSH_ts, facets = T) +
  scale_x_continuous(breaks = seq(2006,2018))
Acf(NSH_ts[,6])

#'###### -------------**Forecasting on Team Seasons**-------------- ######

# ARIMA model with GF, mainly White Noise
NSH.m1 <- auto.arima(NSH_ts[, "S"])
checkresiduals(NSH.m1)

forecast.m1 <- forecast(NSH.m1, h = 2) 
autoplot(forecast.m1) 
# scale_x_continuous(breaks = seq(2006, 2022))

# ARIMA model with GF, GA, S, also mainly White Noise
xreg.m2 <- data.frame(GF = NSH_ts[, "GF"],
              GA = NSH_ts[, "GA"],
              S = NSH_ts[, "S"])
NSH.m2 <- auto.arima(NSH_ts[, "PTS"],
                     xreg = (xreg.m2),
                     stationary = T)
checkresiduals(NSH.m2)

forecast.m2 <- forecast(NSH.m2, xreg = rep(5, 1))
autoplot(forecast.m2) +
  scale_x_continuous(breaks = seq(2006, 2022)) +
  ylim(65, 125)


# VARs models
var1 <- VAR(NSH_ts[, 3:5], p = 1, type = "both", ic = c("AIC"))
forecast.var1 <- forecast(var1, h = 2) 
autoplot(forecast.var1) +
  scale_x_continuous(breaks = seq(2006, 2022))

var2 <- VAR(NSH_ts[, 3:4], p = 2)
var2 %>% 
  forecast() %>% 
  autoplot()

var3 <- VAR(NSH_ts[, 3:4], p = 3)
var3 %>% 
  forecast() %>% 
  autoplot()


