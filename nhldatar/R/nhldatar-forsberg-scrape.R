#' ---------
#' Title: Forecasting for Filip Forsberg
#' Subtitle: player data
#' Author: Robert Papel
#' ---------

#'###### -------------**Libraries**---------------------- ######

library(tidyverse)
library(rvest)
library(vars)
library(forecast)
library(imputeTS)

#'###### -------------**Link and loop**---------- ######

fil_link <- "https://www.hockey-reference.com/players/f/forsbfi01.html"

fil_stats <- NULL

for (i in 1:length(fil_link)) {
  
  fil_standard <- fil_link[i] %>%
    read_html %>%
    html_node("#stats_basic_plus_nhl") %>%
    html_table(header = T)
  
  fil_pos <- fil_link[i] %>% 
    read_html %>% 
    html_nodes(css = "#div_skaters_advanced") %>% 
    html_table()
  
  fil_stats <- rbind(fil_standard, fil_pos)
  
}

fil_pos <- fil_link %>% 
  read_html %>% 
  html_node(css = "#skaters_advanced") %>% 
  html_table()


# Creating appropriate column headers
names(fil_stats) <- as.matrix(fil_stats[1, ])
fil_stats <- fil_stats[-1, ]
fil_stats[] <- lapply(fil_stats, function(x) type.convert(as.character(x)))
