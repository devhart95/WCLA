#Comparing Year to Year with stat-heavy seasons

WCLAoverall <- rbind(WCLA2017,WCLA2018, WCLA2019, WCLA2020)

#Goal differences
WCLAgoals <- WCLAoverall %>%
  group_by(Year) %>%
  summarise_at(vars(GF:GA), sum)

WCLAGP <- WCLAoverall %>%
  group_by(Year) %>%
  summarise_at(vars(GP), mean)

WCLAgoals[5,1] <- 2017
WCLAgoals[5,2] <- 6758
WCLAgoals[6,1] <- 2018
WCLAgoals[6,2] <- 7155
WCLAgoals[7,1] <- 2019
WCLAgoals[7,2] <- 8196
WCLAgoals[8,1] <- 2020
WCLAgoals[8,2] <- 4041
WCLAgoals[,-(3)]
WCLAgoals$Stat <- c("Goals For", "Goals For", "Goals For", "Goals For",
                       "Goals Against", "Goals Against", "Goals Against", "Goals Against")

WCLAgoals <- WCLAgoals %>%
  rename("Total" = GF)
as.character(WCLAgoals$Year)

WCLAgoalsfm <- WCLAgoals[-c(4:8),]

ggplot(WCLAgoalsfm, aes(x = Year, y = Total, fill = Stat)) +
  geom_col(position = "dodge") +
  scale_x_continuous(breaks = 0:2100) +
  geom_text(aes(label=Total), position=position_dodge(width=0.9), vjust=-0.25) +
  ylim(0, 9000)+
  coord_flip()+
  ggtitle("WCLA Goal Patterns by Season")
