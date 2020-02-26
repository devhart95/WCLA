#BYU2020

#Upload Stats each game input
library(readr)
library(ggplot2)
library(tidyverse)

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

ggplot(data = BYUoffense,
       aes(x = GAME, y = DrawTotal, group = 1, color = "Draws Won")) +
  geom_line() +
  geom_line(aes(y = GoalTotal, color="Goals Scored")) +
  labs(x = "Opponent", y = "Totals", colour = "Legend") +
  theme(legend.title = element_blank()) +
  ggtitle("BYU 2020 Draw Wins vs. Goals Scored")
  