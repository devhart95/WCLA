#BYU2020

#Upload Stats each game input
install.packages("formattable")
library(readr)
library(ggplot2)
library(tidyverse)
library(formattable)

#Upload Data based on new CSV each time
BYU2020 <- read_csv(file = "BYU2020.csv")
BYU2020 <- as.data.frame(BYU2020)

#Make sure game order stays in place
BYU2020$GAME <- factor(BYU2020$GAME, levels= unique(BYU2020$GAME))

#How have draw control wins and goal amounts trended so far?
#Group to get game goal and DC totals
BYUdraw <- BYU2020 %>%
  group_by(GAME) %>%
  summarise(DrawTotal = sum(DC))

BYUgoals <- BYU2020 %>%
  group_by(GAME) %>%
  summarise(GoalTotal = sum(Goals))

BYUoffense <- cbind(BYUdraw, BYUgoals)
BYUoffense <- BYUoffense[,-(3)]
BYUoffense <- data.frame(BYUoffense)
BYUoffense <- transform(BYUoffense, new.col = DrawTotal - GoalTotal)

ggplot(data = BYUoffense,
       aes(x = GAME, y = DrawTotal, group = 1, color = "Draws Won")) +
  geom_line() +
  geom_line(aes(y = GoalTotal, color="Goals Scored")) +
  labs(x = "Opponent", y = "Totals", colour = "Legend") +
  theme(legend.title = element_blank()) +
  ggtitle("BYU 2020 Draw Wins vs. Goals Scored")

# Create table for differences??
#YAY IT WORKED!!!
BYU2020changes <- BYU2020 %>% 
  group_by(GAME) %>% 
  summarise_if(is.numeric, funs(sum))

BYU2020changes <- BYU2020changes[,-(2)] 
BYU2020changes$fpPerc <- round((BYU2020changes$FPSMade / BYU2020changes$FPs)*100,2)

#Transpose to have stats as observations

BYU2020.2 <- data.frame(t(BYU2020changes[-1]))
colnames(BYU2020.2) <- c("UCONN", "TEXAS", "MICHSTATE", "CU", "CSU")
BYU2020.2$Stat <- c("Goals", "Assists", "GB", "Zone Entries", "Zone Exits", "Free Positions",
                    "Made Free Positions", "Caused Turnovers", "Fouls Received", "Fouls Committed",
                    "Draw Controls", "Yellow Cards", "Green Cards", "Free Position Percentage")
BYU2020.2 <- BYU2020.2[c(1,2,3,4,5,6,7,14,8,9,10,11,12,13),]

byutable <- BYU2020.2 %>%
  filter(`Stat` %in% 
           c('Goals', 'Assists',"Zone Entries", "Free Positions",
             "Made Free Positions", "Free Position Percentage","Caused Turnovers",
             "Draw Controls")) %>%
  select(c(`Stat`, `UCONN`, `TEXAS`, `MICHSTATE`, `CU`, `CSU`)) %>%
  mutate (Average = round(rowMeans(
    cbind(`UCONN`, `TEXAS`, `MICHSTATE`, `CU`, `CSU`), na.rm=T),0), 
    `Improvement` = round((`CSU`-`UCONN`)/`UCONN`*100,2))  

improvement_formatter <- 
  formatter("span", 
            style = x ~ style(
              font.weight = "bold", 
              color = ifelse(x > 0, customGreen, ifelse(x < 0, customRed, "black"))))


formattable(byutable, align =c("l","c","c","c","c", "c", "c", "c", "r"), list(
  `Stat` = formatter("span", style = ~ style(color = "grey",font.weight = "bold")), 
  `UCONN`= color_tile(customGreen, customGreen0),
  `TEXAS`= color_tile(customGreen, customGreen0),
  `MICHSTATE`= color_tile(customGreen, customGreen0),
  `CU`= color_tile(customGreen, customGreen0),
  `CSU`= color_tile(customGreen, customGreen0),
  `Improvement` = improvement_formatter
))
