#WCLA2018 Standings Data sets

delmarva18web <- "https://www.wcla.club/standings/show/3650881?subseason=444209"
chesapeake18web <- "https://www.wcla.club/standings/show/3650891?subseason=444209"
wnewell18web <- "https://www.wcla.club/standings/show/3650899?subseason=444209"
enewell18web <- "https://www.wcla.club/standings/show/3650903?subseason=444209"
nwwll18web <- "https://www.wcla.club/standings/show/3650907?subseason=444209"
rmwll18web <- "https://www.wcla.club/standings/show/3650914?subseason=444209"
wswll18web <- "https://www.wcla.club/standings/show/3650920?subseason=444209"
eswll18web <- "https://www.wcla.club/standings/show/3650932?subseason=444209"
sswll18web <- "https://www.wcla.club/standings/show/3650938?subseason=444209"
twll18web <- "https://www.wcla.club/standings/show/3650949?subseason=444209"
nwcll18web <- "https://www.wcla.club/standings/show/3650958?subseason=444209"
swcll18web <- "https://www.wcla.club/standings/show/3650971?subseason=444209"
ewcll18web <- "https://www.wcla.club/standings/show/3650980?subseason=444209"
wwcll18web <- "https://www.wcla.club/standings/show/3650986?subseason=444209"
nwwll18web <- "https://www.wcla.club/standings/show/3650993?subseason=444209"
cwwll18web <- "https://www.wcla.club/standings/show/3650998?subseason=444209"
swwll18web <- "https://www.wcla.club/standings/show/3651006?subseason=444209"

#Create datasets
delmarva18 <- data.frame(standings(delmarva18web))
chesapeake18 <- data.frame(standings(chesapeake18web))
wnewell18 <- data.frame(standings(wnewell18web))
enewell18 <- data.frame(standings(enewell18web))
nwwll18 <- data.frame(standings(nwwll18web))
rmwll18 <- data.frame(standings(rmwll18web))
wswll18 <- data.frame(standings(wswll18web))
eswll18 <- data.frame(standings(eswll18web))
sswll18 <- data.frame(standings(sswll18web))
twll18 <- data.frame(standings(twll18web))
nwcll18 <- data.frame(standings(nwcll18web))
swcll18 <- data.frame(standings(swcll18web))
ewcll18 <- data.frame(standings(ewcll18web))
wwcll18 <- data.frame(standings(wwcll18web))
nwwll18 <- data.frame(standings(nwwll18web))
cwwll18 <- data.frame(standings(cwwll18web))
swwll18 <- data.frame(standings(swwll18web))

#Combine
WCLA2018 <- rbind(delmarva18, chesapeake18, wnewell18,
                  enewell18, nwwll18, rmwll18,
                  wswll18, eswll18, sswll18,
                  twll18, nwcll18, swcll18,
                  ewcll18, wwcll18, nwwll18,
                  cwwll18, swwll18)
WCLA2018$Year <- 2018
WCLA2018$GP <- WCLA2018$W + WCLA2018$L
