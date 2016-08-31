sca <- scan("canman.txt","")
scaname <- sca[1:16]
names4 <- scaname[1:4]
names6 <- vector()
for(i in 1:6){
      names6 <- c(names6,paste(scaname[(4+i*2-1)],scaname[(4+i*2)],sep = " "))      
}
names <- c(names4,names6)
v1 <- vector()
for ( i in 1:6){
      k <- 7
      v1 <- rbind(v1,sca[(7+i*10):(6+i*10+10)])
}
v1 <- as.data.frame(v1)
names(v1) <- names

canman8 <- rbind(v1,v1)
canman8 <- canman8[,-1]
names(canman8)[1] <- "ch char"
mapsound <- function(df,fromcol,tocol,sourceval){
      base <- which(df[[fromcol]]==sourceval)
      basedf <- df[base,]
      sp <- split(basedf,basedf[[tocol]])
      retval <- list()
      retval$counts <- sapply(sp,nrow)
      retval$images <- sp
      return(retval)
}

mapsound(canman8,"Man cons","Can cons","x")
