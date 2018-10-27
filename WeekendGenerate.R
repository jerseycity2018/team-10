id <- 1
lat <- 0
long <- 0
time <- 0
currentpos <- 0
mincurr <- sample(1:40,1)
minnext <- 0
maxcurr <- sample(40:80,1)
maxnext <- 0
#df[i,1] <- id
#df[i,2] <- lat
#df[i,3] <- long
#df[i,4] <- time
#df[i,6] <- mincurr
#df[i,7] <- minnext
#df[i,8] <- maxcurr
#df[i,9] <- maxnext
#df[i,10] <- min
#df[i,11] <- max
df <- data.frame(id,lat,long,time,mincurr,minnext,maxcurr,maxnext)

colnames(df) <- c("id", "lat","long","time","mincurr","minnext","maxcurr","maxnext","min","max")

# midnight to 5am
for (i in 1:1440){
  if (i < 300){
    id <- sample(1:65,1)
    lat <- sample(1:1000,1)
    long <- sample(1:1000,1)
    time <- i
    currentpos <- (i/(i+1))
    mincurr <- sample(1:40,1)
    minnext <- 0
    maxcurr <- sample(40:80,1)
    maxnext <- 0
    min <- 0
    max <- 0
    count <- sample(1:80,1)
    df[i,1] <- id
    df[i,2] <- lat
    df[i,3] <- long
    df[i,4] <- time
    df[i,5] <- mincurr
    df[i,6] <- minnext
    df[i,7] <- maxcurr
    df[i,8] <- maxnext
  }
  else if(i > 300 && i < 601){
    id <- sample(1:65,1)
    lat <- sample(1:1000,1)
    long <- sample(1:1000,1)
    time <- i
    currentpos <- (i/(i+1))
    mincurr <- sample(80:100,1)
    minnext <- 0
    maxcurr <- sample(100:200,1)
    maxnext <- 0
    min <- 0
    max <- 0
    #count <- sample(1:80,1)
    df[i,1] <- id
    df[i,2] <- lat
    df[i,3] <- long
    df[i,4] <- time
    df[i,5] <- mincurr
    df[i,6] <- minnext
    df[i,7] <- maxcurr
    df[i,8] <- maxnext
  }
  else if(i > 601 && i < 841){
    id <- sample(1:65,1)
    lat <- sample(1:1000,1)
    long <- sample(1:1000,1)
    time <- i
    currentpos <- (i/(i+1))
    mincurr <- sample(80:100,1)
    minnext <- 0
    maxcurr <- sample(100:200,1)
    maxnext <- 0
    min <- 0
    max <- 0
    #count <- sample(1:80,1)
    df[i,1] <- id
    df[i,2] <- lat
    df[i,3] <- long
    df[i,4] <- time
    df[i,5] <- mincurr
    df[i,6] <- minnext
    df[i,7] <- maxcurr
    df[i,8] <- maxnext
    
  }
  else if(i > 841 && i < 1141){
    id <- sample(1:65,1)
    lat <- sample(1:1000,1)
    long <- sample(1:1000,1)
    time <- i
    currentpos <- (i/(i+1))
    mincurr <- sample(80:100,1)
    minnext <- 0
    maxcurr <- sample(100:200,1)
    maxnext <- 0
    min <- 0
    max <- 0
    #count <- sample(1:80,1)
    df[i,1] <- id
    df[i,2] <- lat
    df[i,3] <- long
    df[i,4] <- time
    df[i,5] <- mincurr
    df[i,6] <- minnext
    df[i,7] <- maxcurr
    df[i,8] <- maxnext
  }
  else if(i <= 1400){
    id <- sample(1:65,1)
    lat <- sample(1:1000,1)
    long <- sample(1:1000,1)
    time <- i
    currentpos <- (i/(i+1))
    mincurr <- sample(1:40,1)
    minnext <- 0
    maxcurr <- sample(40:80,1)
    maxnext <- 0
    min <- 0
    max <- 0
    #count <- sample(1:80,1)
    df[i,1] <- id
    df[i,2] <- lat
    df[i,3] <- long
    df[i,4] <- time
    df[i,5] <- mincurr
    df[i,6] <- minnext
    df[i,7] <- maxcurr
    df[i,8] <- maxnext
    
  }
  
}



for (i in 1:1439){
  currentpos <- (i/(i+1))
  df[i,6] <- abs((df[i,5] - df[i+1,5]))*currentpos
  df[i+1,5] <- abs((df[i,5] - df[i+1,5]))*currentpos
  df[i,8] <- abs((df[i,7] - df[i+1,7]))*currentpos
  df[i+1,7] <- abs((df[i,7] - df[i+1,7]))*currentpos
}

library(ggplot2)
count <- df$min
ggplot(data=df, aes(x=df$time, y=df$mincurr, group=1)) +
  geom_line()
write.csv(df,'weekdayvalues.csv')


