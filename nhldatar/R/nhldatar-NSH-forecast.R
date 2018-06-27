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