id <- 5
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

values <- c("high","low","medium")

Long <- c(40.779, 40.76522, 40.7993, 40.79185, 40.77597)

Lat <- c(-73.96237, -73.97305, -73.95541, -73.96437, -73.97564)


# midnight to 5am
for (i in 1:1440){
  n <- 1
  v <- sample(1:3,1)
  v <- values[v]
  if (i < 300){
    id <- sample(1:65,1)
    lat <- Long[n]
    long <- Lat[n]
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
    lat <- Long[n]
    long <- Lat[n]
    time <- i
    currentpos <- (i/(i+1))
    if (v == "low"){
      mincurr <- sample(20:40,1)
      minnext <- 0
      maxcurr <- sample(60:80,1)
      maxnext <- 0
      min <- 0
      max <- 0
    }else if(v == "medium"){
      mincurr <- sample(60:40,1)
      minnext <- 0
      maxcurr <- sample(80:120,1)
      maxnext <- 0
      min <- 0
      max <- 0
    }else{ mincurr <- sample(80:100,1)
    minnext <- 0
    maxcurr <- sample(100:200,1)
    maxnext <- 0
    min <- 0
    max <- 0}
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
    lat <- Long[n]
    long <- Lat[n]
    time <- i
    currentpos <- (i/(i+1))
    if (v == "low"){
      mincurr <- sample(20:40,1)
      minnext <- 0
      maxcurr <- sample(60:80,1)
      maxnext <- 0
      min <- 0
      max <- 0
    }else if(v == "medium"){
      mincurr <- sample(60:40,1)
      minnext <- 0
      maxcurr <- sample(80:120,1)
      maxnext <- 0
      min <- 0
      max <- 0
    }else{ mincurr <- sample(80:100,1)
    minnext <- 0
    maxcurr <- sample(100:200,1)
    maxnext <- 0
    min <- 0
    max <- 0}
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
    lat <- Long[n]
    long <- Lat[n]
    time <- i
    currentpos <- (i/(i+1))
    if (v == "low"){
      mincurr <- sample(20:40,1)
      minnext <- 0
      maxcurr <- sample(60:80,1)
      maxnext <- 0
      min <- 0
      max <- 0
    }else if(v == "medium"){
      mincurr <- sample(30:60,1)
      minnext <- 0
      maxcurr <- sample(80:100,1)
      maxnext <- 0
      min <- 0
      max <- 0
    }else{ mincurr <- sample(40:80,1)
    minnext <- 0
    maxcurr <- sample(100:150,1)
    maxnext <- 0
    min <- 0
    max <- 0}
    
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
    lat <- Long[n]
    long <- Lat[n]
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

timehours <- seq(1,24,by=1)
mean <- 0
id <- 1
time <- 0
currentpos <- 0
dfhourly <- data.frame(id,lat,long,time,mean)

section <- 1
sectionn <- 1
for (i in 1:24){
  if (i == 24){
    sectionn == 1440
  }else{
    sectionn = sectionn+60
  }
  time <- i
  lat <- lat
  long <- long
  id <- id
  minavg <- df[section:sectionn,5]
  maxavg <- df[section:sectionn,7]
  mean <- mean(minavg+maxavg)
  dfhourly[i,1] <- id
  dfhourly[i,2] <- lat
  dfhourly[i,3] <- long
  dfhourly[i,4] <- time
  dfhourly[i,5] <- mean
  section = section + 60
  print(sectionn)
}

time <- seq(0,23,by=1)
lat1 <- 0
long1 <- 0
mean1 <- 0
lat2 <- 0
long2 <- 0
mean2 <- 0
lat3 <- 0
long3 <- 0
mean3 <-0
lat4 <- 0
long4 <- 0
mean4 <- 0
lat5 <- 0 
long5 <- 0 
mean5 <- 0
dfhourlytotal <- data.frame(time, lat1,long1,mean1,lat2,long2,mean2,lat3,long3,mean3,lat4,long4,mean4,lat5,long5,mean5)

colnames(dfhourlytotal) <- c("hour", "lat1","long1","mean1","lat2","long2","mean2","lat3","long3","mean3","lat4","long4","mean4","lat5","long5","mean5")

dfhourlytotal[,1] <- seq(from=0,to=23,by=1)
dfhourlytotal[,14] <- dfhourly[,2]
dfhourlytotal[,15] <- dfhourly[,3]
dfhourlytotal[,16] <- dfhourly[,5]


for (i in 1:24){
  name <- paste('tues', i, '.csv',sep="")
  dfhourlyd <- data.frame(matrix(ncol = 3, nrow = 5))
  dfhourlyd[1,] <- dfhourlytotal[i,2:4]
  dfhourlyd[2,] <- dfhourlytotal[i,5:7]
  dfhourlyd[3,] <- dfhourlytotal[i,8:10]
  dfhourlyd[4,] <- dfhourlytotal[i,11:13]
  dfhourlyd[5,] <- dfhourlytotal[i,14:16]
  write.csv(dfhourlyd,file=name)
}



