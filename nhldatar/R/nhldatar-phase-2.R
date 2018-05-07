#' ---------
#' Title: Phase 2, for nhldatar package
#' Subtitle: 
#' Author: Robert Papel
#' ---------

#'###### -------------**Libraries**------------------------------------- ######

library(tidyverse)
library(rvest)
library(XML)
library(RSelenium)

#'###### -------------**Links for stats loop**---------------------- ######

stat_urls <- c("https://www.hockey-reference.com/leagues/NHL_1991.html",
               "https://www.hockey-reference.com/leagues/NHL_1992.html",
               "https://www.hockey-reference.com/leagues/NHL_1993.html",
               "https://www.hockey-reference.com/leagues/NHL_1994.html",
               "https://www.hockey-reference.com/leagues/NHL_1995.html",
               "https://www.hockey-reference.com/leagues/NHL_1996.html",
               "https://www.hockey-reference.com/leagues/NHL_1997.html",
               "https://www.hockey-reference.com/leagues/NHL_1998.html",
               "https://www.hockey-reference.com/leagues/NHL_1999.html",
               "https://www.hockey-reference.com/leagues/NHL_2000.html",
               "https://www.hockey-reference.com/leagues/NHL_2001.html",
               "https://www.hockey-reference.com/leagues/NHL_2002.html",
               "https://www.hockey-reference.com/leagues/NHL_2003.html",
               "https://www.hockey-reference.com/leagues/NHL_2004.html",
               "https://www.hockey-reference.com/leagues/NHL_2005.html",
               "https://www.hockey-reference.com/leagues/NHL_2006.html",
               "https://www.hockey-reference.com/leagues/NHL_2007.html",
               "https://www.hockey-reference.com/leagues/NHL_2008.html",
               "https://www.hockey-reference.com/leagues/NHL_2009.html",
               "https://www.hockey-reference.com/leagues/NHL_2010.html",
               "https://www.hockey-reference.com/leagues/NHL_2011.html",
               "https://www.hockey-reference.com/leagues/NHL_2012.html",
               "https://www.hockey-reference.com/leagues/NHL_2013.html",
               "https://www.hockey-reference.com/leagues/NHL_2014.html",
               "https://www.hockey-reference.com/leagues/NHL_2015.html",
               "https://www.hockey-reference.com/leagues/NHL_2016.html",
               "https://www.hockey-reference.com/leagues/NHL_2017.html")


#'###### -------------**RSelenium**--------------- ######

rsDriver(port = 4567L, geckover = NULL, phantomver = NULL)
remDr <- remoteDriver(browserName = "chrome")
remDr$open()
# remDr$close()

remDr$navigate("https://www.hockey-reference.com/leagues/NHL_1991.html")
page <- read_html(remDr$getPageSource()[[1]])
table <- html_table(page, fill = TRUE, header = T)
table[[27]]
team_stats <- table[[27]]

#'###### -------------**Loop for statistics**--------------- ######

for (i in 1:length(lebron_table)) 
  assign(paste0("table_",i),data.frame(lebron_table[i]))


#'###### -------------**Detritus of Importance**--------------- ######

# rsDriver(port = 4567L, geckover = NULL, phantomver = NULL)
# remDr <- remoteDriver(browserName = "chrome")
# remDr$open()
# 
# remDr$navigate("https://www.hockey-reference.com/leagues/NHL_1991.html")
# page <- read_html(remDr$getPageSource()[[1]])
# table <- html_table(page, fill = TRUE, header = T)
# table[[27]]
# team_stats <- table[[27]]


