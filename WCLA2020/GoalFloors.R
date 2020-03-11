#Test to get game scores and results

#byu
byu19sched <- "https://www.wcla.club/schedule/team_instance/4134315?subseason=569703"
byu19 <- data.frame(standings(byu19sched))
byu19 <- byu19 %>% separate(Result, 
                c("Result", "Goals Scored","Goals Against"))
byu19$`Goals Scored` <- as.numeric(byu19$`Goals Scored`)
byu19$`Goals Against` <- as.numeric(byu19$`Goals Against`)
byu19$`Goal Differential` <- byu19$`Goals Scored` - byu19$`Goals Against`
byu19 <- byu19[c(1,2,3,4,8,5,6,7)]

#csu
csu19sched <- "https://www.wcla.club/schedule/team_instance/4134316?subseason=569703"
csu19 <- data.frame(standings(csu19sched))
csu19 <- csu19 %>% separate(Result, 
                            c("Result", "Goals Scored","Goals Against"))
csu19$`Goals Scored` <- as.numeric(csu19$`Goals Scored`)
csu19$`Goals Against` <- as.numeric(csu19$`Goals Against`)
csu19$`Goal Differential` <- csu19$`Goals Scored` - csu19$`Goals Against`
csu19 <- csu19[c(1,2,3,4,8,5,6,7)]

#cu
cu19sched <- "https://www.wcla.club/schedule/team_instance/4134318?subseason=569703"
cu19 <- data.frame(standings(cu19sched))
cu19 <- cu19 %>% separate(Result, 
                            c("Result", "Goals Scored","Goals Against"))
cu19$`Goals Scored` <- as.numeric(cu19$`Goals Scored`)
cu19$`Goals Against` <- as.numeric(cu19$`Goals Against`)
cu19$`Goal Differential` <- cu19$`Goals Scored` - cu19$`Goals Against`
cu19 <- cu19[c(1,2,3,4,8,5,6,7)]

#utah
utah19sched <- "https://www.wcla.club/schedule/team_instance/4134324?subseason=569703"
utah19 <- data.frame(standings(utah19sched))
utah19 <- utah19 %>% separate(Result, 
                          c("Result", "Goals Scored","Goals Against"))
utah19$`Goals Scored` <- as.numeric(utah19$`Goals Scored`)
utah19$`Goals Against` <- as.numeric(utah19$`Goals Against`)
utah19$`Goal Differential` <- utah19$`Goals Scored` - utah19$`Goals Against`
utah19 <- utah19[c(1,2,3,4,8,5,6,7)]

#RMWLL together
RMWLL19 <- rbind(byu19, csu19, cu19, utah19)
