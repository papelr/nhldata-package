#' ---------
#' Title: Phase 2, for nhldatar package
#' Subtitle: 
#' Author: Robert Papel
#' ---------

#'###### -------------**Libraries**---------------------- ######

library(tidyverse)
library(rvest)
library(RSelenium)

#'###### -------------**RSelenium**--------------- ######

rsDriver(port = 4445L, remoteServerAddr = "73.88.135.181",
         geckover = NULL, phantomver = NULL)
remDr <- remoteDriver(browserName = "chrome")
remDr$open()
# remDr$close()

#'###### -------------**1991**--------------- ######

remDr$navigate("https://www.hockey-reference.com/leagues/NHL_1991.html")
page <- read_html(remDr$getPageSource()[[1]])
table <- html_table(page, fill = TRUE, header = T)
table[[25]]
team_stats_1991 <- table[[25]]

team_stats_1991 <- team_stats_1991[c(2:22), c(2:30)]
colnames(team_stats_1991)[c(1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,
                       21,22,23,24,25,26,27,28,29)] <- 
  c("Team", "GP", "W", "L", "T", "Pts", "Pts %", "GF", "GA", "SRS", "SOS",
    "TG/G", "EVGF", "EVGA", "PP", "PPO", "PP%", "PPA", "PPOA", "PK%", "SH",
    "SHA", "PIM/G", "oPIM/G", "S", "S%", "SA", "SV%", "PDO")
team_stats_1991

#'###### -------------**1992**--------------- ######

remDr$navigate("https://www.hockey-reference.com/leagues/NHL_1992.html")
page <- read_html(remDr$getPageSource()[[1]])
table <- html_table(page, fill = TRUE, header = T)
table[[25]]
team_stats_1992 <- table[[25]]

team_stats_1992 <- team_stats_1992[c(2:22), c(2:30)]
colnames(team_stats_1992)[c(1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,
                       21,22,23,24,25,26,27,28,29)] <- 
  c("Team", "GP", "W", "L", "T", "Pts", "Pts %", "GF", "GA", "SRS", "SOS",
    "TG/G", "EVGF", "EVGA", "PP", "PPO", "PP%", "PPA", "PPOA", "PK%", "SH",
    "SHA", "PIM/G", "oPIM/G", "S", "S%", "SA", "SV%", "PDO")
team_stats_1992

#'###### -------------**1993**--------------- ######

remDr$navigate("https://www.hockey-reference.com/leagues/NHL_1993.html")
page <- read_html(remDr$getPageSource()[[1]])
table <- html_table(page, fill = TRUE, header = T)
table[[25]]
team_stats_1993 <- table[[25]]

team_stats_1993 <- team_stats_1993[c(2:22), c(2:30)]
colnames(team_stats_1993)[c(1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,
                       21,22,23,24,25,26,27,28,29)] <- 
  c("Team", "GP", "W", "L", "T", "Pts", "Pts %", "GF", "GA", "SRS", "SOS",
    "TG/G", "EVGF", "EVGA", "PP", "PPO", "PP%", "PPA", "PPOA", "PK%", "SH",
    "SHA", "PIM/G", "oPIM/G", "S", "S%", "SA", "SV%", "PDO")
team_stats_1993

#'###### -------------**1994**--------------- ######

remDr$navigate("https://www.hockey-reference.com/leagues/NHL_1994.html")
page <- read_html(remDr$getPageSource()[[1]])
table <- html_table(page, fill = TRUE, header = T)
table[[25]]
team_stats_1994 <- table[[25]]

team_stats_1994 <- team_stats_1994[c(2:22), c(2:30)]
colnames(team_stats_1994)[c(1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,
                       21,22,23,24,25,26,27,28,29)] <- 
  c("Team", "GP", "W", "L", "T", "Pts", "Pts %", "GF", "GA", "SRS", "SOS",
    "TG/G", "EVGF", "EVGA", "PP", "PPO", "PP%", "PPA", "PPOA", "PK%", "SH",
    "SHA", "PIM/G", "oPIM/G", "S", "S%", "SA", "SV%", "PDO")
team_stats_1994

#' #'###### -------------**1995 (lockout)** --------------- ######
#' 
#' remDr$navigate("https://www.hockey-reference.com/leagues/NHL_1995.html")
#' page <- read_html(remDr$getPageSource()[[1]])
#' table <- html_table(page, fill = TRUE, header = T)
#' table[[27]]
#' team_stats_1995 <- table[[27]]
#' 
#' team_stats_1995 <- team_stats_1995[c(2:22), c(2:30)]
#' colnames(team_stats_1995)[c(1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,
#'                        21,22,23,24,25,26,27,28,29)] <- 
#'   c("Team", "GP", "W", "L", "T", "Pts", "Pts %", "GF", "GA", "SRS", "SOS",
#'     "TG/G", "EVGF", "EVGA", "PP", "PPO", "PP%", "PPA", "PPOA", "PK%", "SH",
#'     "SHA", "PIM/G", "oPIM/G", "S", "S%", "SA", "SV%", "PDO")
#' team_stats_1995

#'###### -------------**1996**--------------- ######

remDr$navigate("https://www.hockey-reference.com/leagues/NHL_1996.html")
page <- read_html(remDr$getPageSource()[[1]])
table <- html_table(page, fill = TRUE, header = T)
table[[25]]
team_stats_1996 <- table[[25]]

team_stats_1996 <- team_stats_1996[c(2:22), c(2:30)]
colnames(team_stats_1996)[c(1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,
                       21,22,23,24,25,26,27,28,29)] <- 
  c("Team", "GP", "W", "L", "T", "Pts", "Pts %", "GF", "GA", "SRS", "SOS",
    "TG/G", "EVGF", "EVGA", "PP", "PPO", "PP%", "PPA", "PPOA", "PK%", "SH",
    "SHA", "PIM/G", "oPIM/G", "S", "S%", "SA", "SV%", "PDO")
team_stats_1996

#'###### -------------**1997**--------------- ######

remDr$navigate("https://www.hockey-reference.com/leagues/NHL_1997.html")
page <- read_html(remDr$getPageSource()[[1]])
table <- html_table(page, fill = TRUE, header = T)
table[[25]]
team_stats_1997 <- table[[25]]

team_stats_1997 <- team_stats_1997[c(2:22), c(2:30)]
colnames(team_stats_1997)[c(1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,
                       21,22,23,24,25,26,27,28,29)] <- 
  c("Team", "GP", "W", "L", "T", "Pts", "Pts %", "GF", "GA", "SRS", "SOS",
    "TG/G", "EVGF", "EVGA", "PP", "PPO", "PP%", "PPA", "PPOA", "PK%", "SH",
    "SHA", "PIM/G", "oPIM/G", "S", "S%", "SA", "SV%", "PDO")
team_stats_1997

#'###### -------------**1998**--------------- ######

remDr$navigate("https://www.hockey-reference.com/leagues/NHL_1998.html")
page <- read_html(remDr$getPageSource()[[1]])
table <- html_table(page, fill = TRUE, header = T)
table[[25]]
team_stats_1998 <- table[[25]]

team_stats_1998 <- team_stats_1998[c(2:22), c(2:30)]
colnames(team_stats_1998)[c(1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,
                       21,22,23,24,25,26,27,28,29)] <- 
  c("Team", "GP", "W", "L", "T", "Pts", "Pts %", "GF", "GA", "SRS", "SOS",
    "TG/G", "EVGF", "EVGA", "PP", "PPO", "PP%", "PPA", "PPOA", "PK%", "SH",
    "SHA", "PIM/G", "oPIM/G", "S", "S%", "SA", "SV%", "PDO")
team_stats_1998

#'###### -------------**1999 (its own table...why..ugh)**------------ ######

remDr$navigate("https://www.hockey-reference.com/leagues/NHL_1999.html")
page <- read_html(remDr$getPageSource()[[1]])
table <- html_table(page, fill = TRUE, header = T)
table[[26]]
team_stats_1999 <- table[[26]]

team_stats_1999 <- team_stats_1999[c(2:29), c(2,4:31)]
colnames(team_stats_1999)[c(1,2,3,4,5,6,7,8,9,
                       10,11,12,13,14,15,16,17,18,19,20,
                       21,22,23,24,25,26,27,28,29)] <-
  c("Team", "GP", "W", "L", "T", "Pts", "Pts %", "GF", "GA", "SRS", "SOS", 
    "TG/G", "EVGF", "EVGA", "PP", "PPO", "PP%", "PPA", "PPOA", "PK%", "SH", 
    "SHA", "PIM/G", "oPIM/G", "S" ,"S%", "SA", "SV%", "PDO")
team_stats_1999

#'###### -------------**2000 (new format)**--------------- ######

remDr$navigate("https://www.hockey-reference.com/leagues/NHL_2000.html")
page <- read_html(remDr$getPageSource()[[1]])
table <- html_table(page, fill = TRUE, header = T)
table[[26]]
team_stats_2000 <- table[[26]]

team_stats_2000 <- team_stats_2000[c(2:30), c(2,4:32)]
colnames(team_stats_2000)[c(1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,
                       21,22,23,24,25,26,27,28,29,30)] <- 
  c("Team", "GP", "W", "L", "T", "OL", "Pts", "Pts %", "GF", "GA", "SRS", "SOS",
    "TG/G", "EVGF", "EVGA", "PP", "PPO", "PP%", "PPA", "PPOA", "PK%", "SH",
    "SHA", "PIM/G", "oPIM/G", "S", "S%", "SA", "SV%", "PDO")
team_stats_2000

#'###### -------------**2001**--------------- ######

remDr$navigate("https://www.hockey-reference.com/leagues/NHL_2001.html")
page <- read_html(remDr$getPageSource()[[1]])
table <- html_table(page, fill = TRUE, header = T)
table[[26]]
team_stats_2001 <- table[[26]]

team_stats_2001 <- team_stats_2001[c(2:30), c(2,4:32)]
colnames(team_stats_2001)[c(1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,
                            21,22,23,24,25,26,27,28,29,30)] <- 
  c("Team", "GP", "W", "L", "T", "OL", "Pts", "Pts %", "GF", "GA", "SRS", "SOS",
    "TG/G", "EVGF", "EVGA", "PP", "PPO", "PP%", "PPA", "PPOA", "PK%", "SH",
    "SHA", "PIM/G", "oPIM/G", "S", "S%", "SA", "SV%", "PDO")
team_stats_2001

#'###### -------------**2002**--------------- ######

remDr$navigate("https://www.hockey-reference.com/leagues/NHL_2002.html")
page <- read_html(remDr$getPageSource()[[1]])
table <- html_table(page, fill = TRUE, header = T)
table[[26]]
team_stats_2002 <- table[[26]]

team_stats_2002 <- team_stats_2002[c(2:30), c(2,4:32)]
colnames(team_stats_2002)[c(1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,
                            21,22,23,24,25,26,27,28,29,30)] <- 
  c("Team", "GP", "W", "L", "T", "OL", "Pts", "Pts %", "GF", "GA", "SRS", "SOS",
    "TG/G", "EVGF", "EVGA", "PP", "PPO", "PP%", "PPA", "PPOA", "PK%", "SH",
    "SHA", "PIM/G", "oPIM/G", "S", "S%", "SA", "SV%", "PDO")
team_stats_2002

#'###### -------------**2003**--------------- ######

remDr$navigate("https://www.hockey-reference.com/leagues/NHL_2003.html")
page <- read_html(remDr$getPageSource()[[1]])
table <- html_table(page, fill = TRUE, header = T)
table[[26]]
team_stats_2003 <- table[[26]]

team_stats_2003 <- team_stats_2003[c(2:30), c(2,4:32)]
colnames(team_stats_2003)[c(1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,
                            21,22,23,24,25,26,27,28,29,30)] <- 
  c("Team", "GP", "W", "L", "T", "OL", "Pts", "Pts %", "GF", "GA", "SRS", "SOS",
    "TG/G", "EVGF", "EVGA", "PP", "PPO", "PP%", "PPA", "PPOA", "PK%", "SH",
    "SHA", "PIM/G", "oPIM/G", "S", "S%", "SA", "SV%", "PDO")
team_stats_2003

#'###### -------------**2004**--------------- ######

remDr$navigate("https://www.hockey-reference.com/leagues/NHL_2004.html")
page <- read_html(remDr$getPageSource()[[1]])
table <- html_table(page, fill = TRUE, header = T)
table[[26]]
team_stats_2004 <- table[[26]]

team_stats_2004 <- team_stats_2004[c(2:30), c(2,4:32)]
colnames(team_stats_2004)[c(1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,
                            21,22,23,24,25,26,27,28,29,30)] <- 
  c("Team", "GP", "W", "L", "T", "OL", "Pts", "Pts %", "GF", "GA", "SRS", "SOS",
    "TG/G", "EVGF", "EVGA", "PP", "PPO", "PP%", "PPA", "PPOA", "PK%", "SH",
    "SHA", "PIM/G", "oPIM/G", "S", "S%", "SA", "SV%", "PDO")
team_stats_2004

#' #'###### -------------**2005 (lockout)**--------------- ######
#' 
#' remDr$navigate("https://www.hockey-reference.com/leagues/NHL_2005.html")
#' page <- read_html(remDr$getPageSource()[[1]])
#' table <- html_table(page, fill = TRUE, header = T)
#' table[[27]]
#' team_stats_2005 <- table[[27]]
#' 
#' team_stats_2005 <- team_stats_2005[c(2:22), c(2:30)]
#' colnames(team_stats_2005)[c(1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,
#'                        21,22,23,24,25,26,27,28,29)] <- 
#'   c("Team", "GP", "W", "L", "Pts", "Pts %", "GF", "GA", "SRS", "SOS",
#'     "TG/G", "EVGF", "EVGA", "PP", "PPO", "PP%", "PPA", "PPOA", "PK%", "SH",
#'     "SHA", "PIM/G", "oPIM/G", "S", "S%", "SA", "SV%", "PDO")
#' team_stats_2005

#'###### -------------**2006**--------------- ######

remDr$navigate("https://www.hockey-reference.com/leagues/NHL_2006.html")
page <- read_html(remDr$getPageSource()[[1]])
table <- html_table(page, fill = TRUE, header = T)
table[[26]]
team_stats_2006 <- table[[26]]

team_stats_2006 <- team_stats_2006[c(2:30), c(2,4:32)]
colnames(team_stats_2006)[c(1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,
                            21,22,23,24,25,26,27,28,29,30)] <- 
  c("Team", "GP", "W", "L", "OL", "Pts", "Pts %", "GF", "GA", "SOW", "SOL",         "SRS", "SOS", "TG/G", "EVGF", "EVGA", "PP", "PPO", "PP%", "PPA", "PPOA",        "PK%", "SH","SHA", "PIM/G", "oPIM/G", "S", "S%", "SA", "SV%", "PDO")
team_stats_2006

#'###### -------------**2007**--------------- ######

remDr$navigate("https://www.hockey-reference.com/leagues/NHL_2007.html")
page <- read_html(remDr$getPageSource()[[1]])
table <- html_table(page, fill = TRUE, header = T)
table[[26]]
team_stats_2007 <- table[[26]]

team_stats_2007 <- team_stats_2007[c(2:30), c(2,4:32)]
colnames(team_stats_2007)[c(1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,
                            21,22,23,24,25,26,27,28,29,30)] <- 
  c("Team", "GP", "W", "L", "OL", "Pts", "Pts %", "GF", "GA", "SOW", "SOL",         "SRS", "SOS", "TG/G", "EVGF", "EVGA", "PP", "PPO", "PP%", "PPA", "PPOA",        "PK%", "SH","SHA", "PIM/G", "oPIM/G", "S", "S%", "SA", "SV%", "PDO")
team_stats_2007

#'###### -------------**2008**--------------- ######

remDr$navigate("https://www.hockey-reference.com/leagues/NHL_2008.html")
page <- read_html(remDr$getPageSource()[[1]])
table <- html_table(page, fill = TRUE, header = T)
table[[26]]
team_stats_2008 <- table[[26]]

team_stats_2008 <- team_stats_2008[c(2:30), c(2,4:32)]
colnames(team_stats_2008)[c(1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,
                            21,22,23,24,25,26,27,28,29,30)] <- 
  c("Team", "GP", "W", "L", "OL", "Pts", "Pts %", "GF", "GA", "SOW", "SOL",         "SRS", "SOS", "TG/G", "EVGF", "EVGA", "PP", "PPO", "PP%", "PPA", "PPOA",        "PK%", "SH","SHA", "PIM/G", "oPIM/G", "S", "S%", "SA", "SV%", "PDO")
team_stats_2008

#'###### -------------**2009**--------------- ######

remDr$navigate("https://www.hockey-reference.com/leagues/NHL_2009.html")
page <- read_html(remDr$getPageSource()[[1]])
table <- html_table(page, fill = TRUE, header = T)
table[[26]]
team_stats_2009 <- table[[26]]

team_stats_2009 <- team_stats_2009[c(2:30), c(2,4:32)]
colnames(team_stats_2009)[c(1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,
                            21,22,23,24,25,26,27,28,29,30)] <- 
  c("Team", "GP", "W", "L", "OL", "Pts", "Pts %", "GF", "GA", "SOW", "SOL",         "SRS", "SOS", "TG/G", "EVGF", "EVGA", "PP", "PPO", "PP%", "PPA", "PPOA",        "PK%", "SH","SHA", "PIM/G", "oPIM/G", "S", "S%", "SA", "SV%", "PDO")
team_stats_2009

#'###### -------------**2010**--------------- ######

remDr$navigate("https://www.hockey-reference.com/leagues/NHL_2010.html")
page <- read_html(remDr$getPageSource()[[1]])
table <- html_table(page, fill = TRUE, header = T)
table[[26]]
team_stats_2010 <- table[[26]]

team_stats_2010 <- team_stats_2010[c(2:30), c(2,4:32)]
colnames(team_stats_2010)[c(1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,
                            21,22,23,24,25,26,27,28,29,30)] <- 
  c("Team", "GP", "W", "L", "OL", "Pts", "Pts %", "GF", "GA", "SOW", "SOL",         "SRS", "SOS", "TG/G", "EVGF", "EVGA", "PP", "PPO", "PP%", "PPA", "PPOA",        "PK%", "SH","SHA", "PIM/G", "oPIM/G", "S", "S%", "SA", "SV%", "PDO")
team_stats_2010

#'###### -------------**2011**--------------- ######

remDr$navigate("https://www.hockey-reference.com/leagues/NHL_2011.html")
page <- read_html(remDr$getPageSource()[[1]])
table <- html_table(page, fill = TRUE, header = T)
table[[26]]
team_stats_2011 <- table[[26]]

team_stats_2011 <- team_stats_2011[c(2:30), c(2,4:32)]
colnames(team_stats_2011)[c(1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,
                            21,22,23,24,25,26,27,28,29,30)] <- 
  c("Team", "GP", "W", "L", "OL", "Pts", "Pts %", "GF", "GA", "SOW", "SOL",         "SRS", "SOS", "TG/G", "EVGF", "EVGA", "PP", "PPO", "PP%", "PPA", "PPOA",        "PK%", "SH","SHA", "PIM/G", "oPIM/G", "S", "S%", "SA", "SV%", "PDO")
team_stats_2011

#'###### -------------**2012**--------------- ######

remDr$navigate("https://www.hockey-reference.com/leagues/NHL_2012.html")
page <- read_html(remDr$getPageSource()[[1]])
table <- html_table(page, fill = TRUE, header = T)
table[[26]]
team_stats_2012 <- table[[26]]

team_stats_2012 <- team_stats_2012[c(2:30), c(2,4:32)]
colnames(team_stats_2012)[c(1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,
                            21,22,23,24,25,26,27,28,29,30)] <- 
  c("Team", "GP", "W", "L", "OL", "Pts", "Pts %", "GF", "GA", "SOW", "SOL",         "SRS", "SOS", "TG/G", "EVGF", "EVGA", "PP", "PPO", "PP%", "PPA", "PPOA",        "PK%", "SH","SHA", "PIM/G", "oPIM/G", "S", "S%", "SA", "SV%", "PDO")
team_stats_2012

#' #'###### -------------**2013 (lockout)**--------------- ######
#' 
#' remDr$navigate("https://www.hockey-reference.com/leagues/NHL_2013.html")
#' page <- read_html(remDr$getPageSource()[[1]])
#' table <- html_table(page, fill = TRUE, header = T)
#' table[[27]]
#' team_stats_2013 <- table[[27]]
#' 
#' team_stats_2013 <- team_stats_2013[c(2:22), c(2:30)]
#' colnames(team_stats_2013)[c(1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,
#'                        21,22,23,24,25,26,27,28,29)] <- 
#'   c("Team", "GP", "W", "L", "T", "Pts", "Pts %", "GF", "GA", "SRS", "SOS",
#'     "TG/G", "EVGF", "EVGA", "PP", "PPO", "PP%", "PPA", "PPOA", "PK%", "SH",
#'     "SHA", "PIM/G", "oPIM/G", "S", "S%", "SA", "SV%", "PDO")
#' team_stats_2013

#'###### -------------**2014**--------------- ######

remDr$navigate("https://www.hockey-reference.com/leagues/NHL_2014.html")
page <- read_html(remDr$getPageSource()[[1]])
table <- html_table(page, fill = TRUE, header = T)
table[[26]]
team_stats_2014 <- table[[26]]

team_stats_2014 <- team_stats_2014[c(2:30), c(2,4:32)]
colnames(team_stats_2014)[c(1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,
                            21,22,23,24,25,26,27,28,29,30)] <- 
  c("Team", "GP", "W", "L", "OL", "Pts", "Pts %", "GF", "GA", "SOW", "SOL",         "SRS", "SOS", "TG/G", "EVGF", "EVGA", "PP", "PPO", "PP%", "PPA", "PPOA",        "PK%", "SH","SHA", "PIM/G", "oPIM/G", "S", "S%", "SA", "SV%", "PDO")
team_stats_2014

#'###### -------------**2015**--------------- ######

remDr$navigate("https://www.hockey-reference.com/leagues/NHL_2015.html")
page <- read_html(remDr$getPageSource()[[1]])
table <- html_table(page, fill = TRUE, header = T)
table[[26]]
team_stats_2015 <- table[[26]]

team_stats_2015 <- team_stats_2015[c(2:30), c(2,4:32)]
colnames(team_stats_2015)[c(1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,
                            21,22,23,24,25,26,27,28,29,30)] <- 
  c("Team", "GP", "W", "L", "OL", "Pts", "Pts %", "GF", "GA", "SOW", "SOL",         "SRS", "SOS", "TG/G", "EVGF", "EVGA", "PP", "PPO", "PP%", "PPA", "PPOA",        "PK%", "SH","SHA", "PIM/G", "oPIM/G", "S", "S%", "SA", "SV%", "PDO")
team_stats_2015

#'###### -------------**2016**--------------- ######

remDr$navigate("https://www.hockey-reference.com/leagues/NHL_2016.html")
page <- read_html(remDr$getPageSource()[[1]])
table <- html_table(page, fill = TRUE, header = T)
table[[26]]
team_stats_2016 <- table[[26]]

team_stats_2016 <- team_stats_2016[c(2:30), c(2,4:32)]
colnames(team_stats_2016)[c(1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,
                            21,22,23,24,25,26,27,28,29,30)] <- 
  c("Team", "GP", "W", "L", "OL", "Pts", "Pts %", "GF", "GA", "SOW", "SOL",         "SRS", "SOS", "TG/G", "EVGF", "EVGA", "PP", "PPO", "PP%", "PPA", "PPOA",        "PK%", "SH","SHA", "PIM/G", "oPIM/G", "S", "S%", "SA", "SV%", "PDO")
team_stats_2016

#'###### -------------**2017**--------------- ######

remDr$navigate("https://www.hockey-reference.com/leagues/NHL_2017.html")
page <- read_html(remDr$getPageSource()[[1]])
table <- html_table(page, fill = TRUE, header = T)
table[[26]]
team_stats_2017 <- table[[26]]

team_stats_2017 <- team_stats_2017[c(2:30), c(2,4:32)]
colnames(team_stats_2017)[c(1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,
                            21,22,23,24,25,26,27,28,29,30)] <- 
  c("Team", "GP", "W", "L", "OL", "Pts", "Pts %", "GF", "GA", "SOW", "SOL",         "SRS", "SOS", "TG/G", "EVGF", "EVGA", "PP", "PPO", "PP%", "PPA", "PPOA",        "PK%", "SH","SHA", "PIM/G", "oPIM/G", "S", "S%", "SA", "SV%", "PDO")
team_stats_2017

#'###### -------------**2018**--------------- ######

remDr$navigate("https://www.hockey-reference.com/leagues/NHL_2018.html")
page <- read_html(remDr$getPageSource()[[1]])
table <- html_table(page, fill = TRUE, header = T)
table[[26]]
team_stats_2018 <- table[[26]]

team_stats_2018 <- team_stats_2018[c(2:30), c(2,4:32)]
colnames(team_stats_2018)[c(1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,
                            21,22,23,24,25,26,27,28,29,30)] <- 
  c("Team", "GP", "W", "L", "OL", "Pts", "Pts %", "GF", "GA", "SOW", "SOL",         "SRS", "SOS", "TG/G", "EVGF", "EVGA", "PP", "PPO", "PP%", "PPA", "PPOA",        "PK%", "SH","SHA", "PIM/G", "oPIM/G", "S", "S%", "SA", "SV%", "PDO")
team_stats_2018

########################################################################
########################################################################

#'###### -------------**Adding Year Column**----------------- ######

team_stats_1991$Year <- 1991
team_stats_1992$Year <- 1992
team_stats_1993$Year <- 1993
team_stats_1994$Year <- 1994
team_stats_1996$Year <- 1996
team_stats_1997$Year <- 1997
team_stats_1998$Year <- 1998
team_stats_1999$Year <- 1999
team_stats_2000$Year <- 2000
team_stats_2001$Year <- 2001
team_stats_2002$Year <- 2002
team_stats_2003$Year <- 2003
team_stats_2004$Year <- 2004
team_stats_2006$Year <- 2006
team_stats_2007$Year <- 2007
team_stats_2008$Year <- 2008
team_stats_2009$Year <- 2009
team_stats_2010$Year <- 2010
team_stats_2011$Year <- 2011
team_stats_2012$Year <- 2012
team_stats_2014$Year <- 2014
team_stats_2015$Year <- 2015
team_stats_2016$Year <- 2016
team_stats_2017$Year <- 2017
team_stats_2018$Year <- 2018


#'###### -------------**Team Stats JOIN**-------------------- ######

all_team_stats <- bind_rows(team_stats_1991, team_stats_1992, team_stats_1993,
                        team_stats_1994, team_stats_1996, team_stats_1997,
                        team_stats_1998, team_stats_1999, team_stats_2000,
                        team_stats_2001, team_stats_2002, team_stats_2003,
                        team_stats_2004, team_stats_2006, team_stats_2007,
                        team_stats_2008, team_stats_2009, team_stats_2010,
                        team_stats_2011, team_stats_2012, team_stats_2014,
                        team_stats_2015, team_stats_2016, team_stats_2017,
                        team_stats_2018)


#'###### -------------**Removing Asterisks**---------------------- ######

all_team_stats$Team <- gsub("\\*", "", all_team_stats$Team)

#'###### -------------**Removing seasons w/out new OT rules**-------- ######

#  2006 and up
all_team_stats <- all_team_stats[-c(1:320), ]


#'###### -------------**Dataframe Save**--------------- ######

saveRDS(all_team_stats, "../Data/NHL_stats.rda")


