#WCLA2019 standings

chesapeakeweb <- "https://www.wcla.club/standings/show/4688296?subseason=569703"
delmarvaweb <- "https://www.wcla.club/standings/show/4688298?subseason=569703"
ewnewell <- "https://www.wcla.club/standings/show/4630979?subseason=569703"
wwnewell <- "https://www.wcla.club/page/show/4630982-west?subseason=569703"
wnwwll2 <- "https://www.wcla.club/standings/show/4630938?subseason=569703"
wrmwll2 <- "https://www.wcla.club/standings/show/4630948?subseason=569703"
swlle <- "https://www.wcla.club/standings/show/4631001?subseason=569703"
swlls <- "https://www.wcla.club/standings/show/4631001?subseason=569703"
swllw <- "https://www.wcla.club/standings/show/4631029?subseason=569703"
twll2 <- "https://www.wcla.club/standings/show/4631034?subseason=569703"
wclle <- "https://www.wcla.club/standings/show/4631056?subseason=569703"
wclln <- "https://www.wcla.club/standings/show/4631066?subseason=569703"
wclls <- "https://www.wcla.club/standings/show/4631078?subseason=569703"
wcllw <- "https://www.wcla.club/standings/show/4631088?subseason=569703"
wwllc <- "https://www.wcla.club/standings/show/4631108?subseason=569703"
wwlls <- "https://www.wcla.club/standings/show/4631134?subseason=569703"
wwlln <- "https://www.wcla.club/standings/show/4631121?subseason=569703"

nineteen <- function(school){
  school.table <- read_html(school)
  schooltbls <- html_nodes(school.table, "table")
  school19 <- school.table %>%
    html_nodes("table") %>%
    .[1] %>%
    html_table(fill = TRUE)
  school2019 <- data.frame(school19)
}

chesapeake <- data.frame(standings(chesapeakeweb))
delmarva <- data.frame(standings(delmarvaweb))

newelleast2019 <- data.frame(standings(ewnewell))
newellwest2019 <- data.frame(standings(wwnewell))

nwll19 <- data.frame(standings(wnwwll))

rmwll19 <- data.frame(standings(wrmwll2))

swlleast19 <- data.frame(standings(swlle))
swllsouth19 <- data.frame(standings(swlls))
swllwest19 <- data.frame(standings(swllw))

twll19 <- data.frame(standings(twll2))

wclleast19 <- data.frame(standings(wclle))
wcllnorth19 <- data.frame(standings(wclln))
wcllsouth19 <- data.frame(standings(wclls))
wcllwest19 <- data.frame(standings(wcllw))

wwllcentral19 <- data.frame(standings(wwllc))
wwllsouth19 <- data.frame(standings(wwlls))
wwllnorth19 <- data.frame(standings(wwlln))

#Combine!!
WCLA2019 <- rbind(chesapeake, delmarva, newelleast2019,
                  newellwest2019, nwll19, rmwll19,
                  swlleast19, swllsouth19, swllwest19,
                  twll19, wclleast19, wcllnorth19, wcllsouth19,
                  wcllwest19, wwllcentral19, wwllsouth19, wwllnorth19)

#Compare last year to this year so far
WCLA2019$Year <- 2019
WCLA2020$Year <- 2020
WCLAcompare <- rbind(WCLA2019, WCLA2020)
WCLA2019$GP <- WCLA2019$W + WCLA2019$L
WCLA2020$GP <- WCLA2020$W + WCLA2020$L

WCLAgoalratios <- WCLAcompare %>%
  group_by(Year) %>%
  summarise_at(vars(GF:GA), sum)

WCLAgoalratios[3,1] <- 2019
WCLAgoalratios[4,1] <- 2020
WCLAgoalratios$Stat <- c("Goals For", "Goals For", "Goals Against",
                         "Goals Against")

WCLAgoalratios <- WCLAgoalratios %>%
  rename("Total" = GF)
WCLAgoalratios[3,2] <- 8196
WCLAgoalratios[4,2] <- 4041
WCLAgoalratios <- WCLAgoalratios[,-(3)]
as.character(WCLAgoalratios$Year)
#Bar graph to show by variable

ggplot(WCLAgoalratios, aes(x = Year, y = Total, fill = Stat)) +
  geom_col(position = "dodge") +
  scale_x_continuous(breaks = 0:2100) +
  geom_text(aes(label=Total), position=position_dodge(width=0.9), vjust=-0.25) +
  ylim(0, 9000)+
  coord_flip()+
  ggtitle("WCLA Goal Patterns by Season (Free Movement)")
