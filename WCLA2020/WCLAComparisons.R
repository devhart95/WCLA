#Comparing Year to Year with stat-heavy seasons

WCLAoverall <- rbind(WCLA2017,WCLA2018, WCLA2019, WCLA2020)

#Goal differences
WCLAgoals <- WCLAoverall %>%
  group_by(Year) %>%
  summarise_at(vars(GF:GA), sum)

WCLAGP <- WCLAoverall %>%
  group_by(Year) %>%
  summarise_at(vars(GP), mean)
