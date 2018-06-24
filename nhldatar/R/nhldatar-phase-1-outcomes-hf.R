#' @title Stats and outcomes of NHL games, from hockey-reference.com
#'
#' @author Robert Papel
#'
#' @description Scrapes data from hockey-reference, and puts it into two
#'   different data packages
#'
#' @examples NHL_outcomes & NHL_stats


#'###### -------------**Libraries**------------------------------------- ######

library(tidyverse)
library(rvest)

#'###### -------------**Links for outcome/attendance loop**---------- ######

all_urls <- c("http://www.hockey-reference.com/leagues/NHL_1991_games.html",
              "http://www.hockey-reference.com/leagues/NHL_1992_games.html",
              "http://www.hockey-reference.com/leagues/NHL_1993_games.html",
              "http://www.hockey-reference.com/leagues/NHL_1994_games.html",
              # "http://www.hockey-reference.com/leagues/NHL_1995_games.html",
              "http://www.hockey-reference.com/leagues/NHL_1996_games.html",
              "http://www.hockey-reference.com/leagues/NHL_1997_games.html",
              "http://www.hockey-reference.com/leagues/NHL_1998_games.html",
              "http://www.hockey-reference.com/leagues/NHL_1999_games.html",
              "http://www.hockey-reference.com/leagues/NHL_2000_games.html",
              "http://www.hockey-reference.com/leagues/NHL_2001_games.html",
              "http://www.hockey-reference.com/leagues/NHL_2002_games.html",
              "http://www.hockey-reference.com/leagues/NHL_2003_games.html",
              "http://www.hockey-reference.com/leagues/NHL_2004_games.html",
              # "http://www.hockey-reference.com/leagues/NHL_2005_games.html",
              "http://www.hockey-reference.com/leagues/NHL_2006_games.html",
              "http://www.hockey-reference.com/leagues/NHL_2007_games.html",
              "http://www.hockey-reference.com/leagues/NHL_2008_games.html",
              "http://www.hockey-reference.com/leagues/NHL_2009_games.html",
              "http://www.hockey-reference.com/leagues/NHL_2010_games.html",
              "http://www.hockey-reference.com/leagues/NHL_2011_games.html",
              "http://www.hockey-reference.com/leagues/NHL_2012_games.html",
              # "http://www.hockey-reference.com/leagues/NHL_2013_games.html",
              "http://www.hockey-reference.com/leagues/NHL_2014_games.html",
              "http://www.hockey-reference.com/leagues/NHL_2015_games.html",
              "http://www.hockey-reference.com/leagues/NHL_2016_games.html",
              "http://www.hockey-reference.com/leagues/NHL_2017_games.html",
              "http://www.hockey-reference.com/leagues/NHL_2018_games.html")

# Got rid of the lockout seasons

#'###### -------------**Loop, for outcomes & attendance**--------------- ######

outcomes <- NULL

for (i in 1:length(all_urls)) {

  season <- all_urls[i] %>%
    read_html %>%
    html_node("#games") %>%
    html_table(header = T)

  season <- season[,c(1:5,7)]
  season$GVisitor <- season$G
  season$GHome <- season$G.1

  season <- season %>%
    select(Date, Visitor, GVisitor, Home, GHome, Att.)

  playoffs <- all_urls[i] %>%
    read_html %>%
    html_node("#games_playoffs") %>%
    html_table(header = T)

  playoffs <- playoffs[,c(1:5,7)]
  playoffs$GVisitor <- playoffs$G
  playoffs$GHome <- playoffs$G.1

  playoffs <- playoffs %>%
    select(Date, Visitor, GVisitor, Home, GHome, Att.)

  whole_season <- rbind(season, playoffs)
  outcomes <- rbind(outcomes, whole_season)

}

#'###### -------------**Dataframe Save**--------------- ######

NHL_outcomes <- outcomes
saveRDS(NHL_outcomes, "../Data/NHL_outcomes.rda")

#'###### -------------**Saving into a package**--------------- ######

# devtools::use_data(outcomes)







