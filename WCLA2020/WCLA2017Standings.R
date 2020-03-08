#WCLA2017 Standings

delmarva17web <- "https://www.wcla.club/standings/show/2851465?subseason=340731"
chesapeake17web <- "https://www.wcla.club/standings/show/2851474?subseason=340731"
wnewell17web <- "https://www.wcla.club/standings/show/2851482?subseason=340731"
enewell17web <- "https://www.wcla.club/standings/show/2851486?subseason=340731"
nwwll17web <- "https://www.wcla.club/standings/show/2851490?subseason=340731"
rmwll17web <- "https://www.wcla.club/standings/show/2851497?subseason=340731"
wswll17web <- "https://www.wcla.club/standings/show/2851503?subseason=340731"
eswll17web <- "https://www.wcla.club/standings/show/2851512?subseason=340731"
sswll17web <- "https://www.wcla.club/standings/show/2851519?subseason=340731"
twll17web <- "https://www.wcla.club/standings/show/2851530?subseason=340731"
nwcll17web <- "https://www.wcla.club/standings/show/2851538?subseason=340731"
swcll17web <- "https://www.wcla.club/standings/show/2851551?subseason=340731"
ewcll17web <- "https://www.wcla.club/standings/show/2851558?subseason=340731"
wwcll17web <- "https://www.wcla.club/standings/show/2851564?subseason=340731"
nwwll17web <- "https://www.wcla.club/standings/show/2851571?subseason=340731"
cwwll17web <- "https://www.wcla.club/standings/show/2851576?subseason=340731"
swwll17web <- "https://www.wcla.club/standings/show/2851584?subseason=340731"

#Create datasets
delmarva17 <- data.frame(standings(delmarva17web))
chesapeake17 <- data.frame(standings(chesapeake17web))
wnewell17 <- data.frame(standings(wnewell17web))
enewell17 <- data.frame(standings(enewell17web))
nwwll17 <- data.frame(standings(nwwll17web))
rmwll17 <- data.frame(standings(rmwll17web))
wswll17 <- data.frame(standings(wswll17web))
eswll17 <- data.frame(standings(eswll17web))
sswll17 <- data.frame(standings(sswll17web))
twll17 <- data.frame(standings(twll17web))
nwcll17 <- data.frame(standings(nwcll17web))
swcll17 <- data.frame(standings(swcll17web))
ewcll17 <- data.frame(standings(ewcll17web))
wwcll17 <- data.frame(standings(wwcll17web))
nwwll17 <- data.frame(standings(nwwll17web))
cwwll17 <- data.frame(standings(cwwll17web))
swwll17 <- data.frame(standings(cwwll17web))

#COMBINE!!
WCLA2017 <- rbind(delmarva17, chesapeake17,
                  wnewell17, enewell17, nwwll17,
                  rmwll17, wswll17, eswll17,
                  sswll17, twll17, nwcll17,
                  swcll17, ewcll17, wwcll17,
                  nwwll17, cwwll17, swwll17)
WCLA2017$Year <- 2017
WCLA2017$GP <- WCLA2017$W + WCLA2017$L
