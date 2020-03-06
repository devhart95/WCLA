#Test to upload standings each week
library(tidyverse)
library(reshape2)
library(purrr)
library(rvest)
library(readr)
library(ggrepel)

#Websites for each standings
wvirginiaconf <- "https://www.wcla.club/standings/show/5653304?subseason=653011"
wcarolinaconf <- "https://www.wcla.club/standings/show/5653308?subseason=653011"
wdelawarevalleyconf <- "https://www.wcla.club/standings/show/5653309?subseason=653011"

wnewelleast <- "https://www.wcla.club/standings/show/5389854?subseason=653011"
wnewellwest <- "https://www.wcla.club/standings/show/5389858?subseason=653011"

wnwwll <- "https://www.wcla.club/standings/show/5389862?subseason=653011"

wrmwll <- "https://www.wcla.club/standings/show/5389868?subseason=653011"

wswlleast <- "https://www.wcla.club/standings/show/5389874?subseason=653011"
wswllsouth <- "https://www.wcla.club/standings/show/5389879?subseason=653011"
wswllwest <- "https://www.wcla.club/standings/show/5389886?subseason=653011"

wtwll <- "https://www.wcla.club/standings/show/5389892?subseason=653011"

wwclleast <- "https://www.wcla.club/standings/show/5389900?subseason=653011"
wwcllnorth <- "https://www.wcla.club/standings/show/5389906?subseason=653011"
wwcllsouth <- "https://www.wcla.club/standings/show/5389911?subseason=653011"
wwcllwest <- "https://www.wcla.club/standings/show/5389917?subseason=653011"

wwwllcentral <- "https://www.wcla.club/standings/show/5389925?subseason=653011"
wwwllnorth <- "https://www.wcla.club/standings/show/5389930?subseason=653011"
wwwllsouth <- "https://www.wcla.club/standings/show/5389935?subseason=653011"

#Try to upload it
standings <- function(school){
  school.table <- read_html(school)
  schooltbls <- html_nodes(school.table, "table")
  school19 <- school.table %>%
    html_nodes("table") %>%
    .[1] %>%
    html_table(fill = TRUE)
  school2019 <- data.frame(school19)
}

#Create all datasets
virginiaconf <- data.frame(standings(wvirginiaconf))
delawareconf <- data.frame(standings(wdelawarevalleyconf))
carolinaconf <- data.frame(standings(wcarolinaconf))

newelleast <- data.frame(standings(wnewelleast))
newellwest <- data.frame(standings(wnewellwest))

nwll <- data.frame(standings(wnwwll))

rmwll <- data.frame(standings(wrmwll))

swlleast <- data.frame(standings(wswlleast))
swllsouth <- data.frame(standings(wswllsouth))
swllwest <- data.frame(standings(wswllwest))

twll <- data.frame(standings(wtwll))

wclleast <- data.frame(standings(wwclleast))
wcllnorth <- data.frame(standings(wwcllnorth))
wcllsouth <- data.frame(standings(wwcllsouth))
wcllwest <- data.frame(standings(wwcllwest))

wwllcentral <- data.frame(standings(wwwllcentral))
wwllsouth <- data.frame(standings(wwwllsouth))
wwllnorth <- data.frame(standings(wwwllnorth))

#Merge together
WCLA2020 <- rbind(wwllcentral, wwllsouth, wwllnorth,
                  wclleast, wcllnorth, wcllsouth, wcllwest,
                  twll, rmwll, nwll,
                  virginiaconf, carolinaconf, delawareconf,
                  swlleast, swllsouth, swllwest,
                  newelleast, newellwest)
WCLA2020$Goalratio <- WCLA2020$GF / WCLA2020$GA
WCLA2020$tg <- sum(WCLA2020$W, WCLA2020$L)

#Create graph for entire league goals for and goals against
WCLAGA <- sum(WCLA2020$GA)
WCLAGF <- sum(WCLA2020$GF)
WCLAgratio <- data.frame(WCLAGA, WCLAGF)
WCLAgratio$League <- "League"

WCLAgratio <- WCLAgratio %>%
  rename("Goals Against" = WCLAGA,
         "Goals For" = WCLAGF)

ggplot(WCLAgratio, aes(x = League, y = , fill = Stat)) +
  geom_col(position = "dodge")

#Show goals so far
WCLAgoalratio <- WCLA2020 %>% arrange(desc(Goalperc))
WCLAgoalsagainst <- WCLA2020 %>% arrange(desc(GA))
