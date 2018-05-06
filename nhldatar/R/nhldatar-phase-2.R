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

stat_urls <- "https://www.hockey-reference.com/leagues/NHL_1991.html"
               # "https://www.hockey-reference.com/leagues/NHL_1992.html",
               # "https://www.hockey-reference.com/leagues/NHL_1993.html",
               # "https://www.hockey-reference.com/leagues/NHL_1994.html",
               # "https://www.hockey-reference.com/leagues/NHL_1995.html",
               # "https://www.hockey-reference.com/leagues/NHL_1996.html",
               # "https://www.hockey-reference.com/leagues/NHL_1997.html",
               # "https://www.hockey-reference.com/leagues/NHL_1998.html")
               # "https://www.hockey-reference.com/leagues/NHL_1999.html",
               # "https://www.hockey-reference.com/leagues/NHL_2000.html",
               # "https://www.hockey-reference.com/leagues/NHL_2001.html",
               # "https://www.hockey-reference.com/leagues/NHL_2002.html",
               # "https://www.hockey-reference.com/leagues/NHL_2003.html",
               # "https://www.hockey-reference.com/leagues/NHL_2004.html",
               # "https://www.hockey-reference.com/leagues/NHL_2005.html",
               # "https://www.hockey-reference.com/leagues/NHL_2006.html",
               # "https://www.hockey-reference.com/leagues/NHL_2007.html",
               # "https://www.hockey-reference.com/leagues/NHL_2008.html",
               # "https://www.hockey-reference.com/leagues/NHL_2009.html",
               # "https://www.hockey-reference.com/leagues/NHL_2010.html",
               # "https://www.hockey-reference.com/leagues/NHL_2011.html",
               # "https://www.hockey-reference.com/leagues/NHL_2012.html",
               # "https://www.hockey-reference.com/leagues/NHL_2013.html",
               # "https://www.hockey-reference.com/leagues/NHL_2014.html",
               # "https://www.hockey-reference.com/leagues/NHL_2015.html",
               # "https://www.hockey-reference.com/leagues/NHL_2016.html",
               # "https://www.hockey-reference.com/leagues/NHL_2017.html")


#'###### -------------**Loop for statistics**--------------- ######


team_stats <- stat_urls %>% 
  read_html() %>% 
  html_node("tbody .right , tbody .left , .poptip") %>% 
  html_table()




#'###### -------------**Detritus**--------------- ######


table#stats.sortable.stats_table.now.sortable
#stats
#all_stats
#all_stats > div.table_outer_container
#stats
#stats > tbody
#stats
//*[@id="stats"]
