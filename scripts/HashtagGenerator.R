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

hashtag <- c("#greatlawn","#met","#centralparkzoo","#ramble","#gothicbridge","#ravine")

values <- c("high","low","medium")

Long <- c(40.7818, 40.77904, 40.76723, 40.77726, 40.78926, 40.79491)

Lat <- c(-73.96619, -73.96243, -73.97182, -73.96954, -73.96264, -73.95596)

lat <- Lat[id]
long <- Long[id]

# midnight to 5am
for (i in 1:1440){
  n <- id
  v <- sample(1:3,1)
  v <- values[v]
  if (i < 300){
    #id <- sample(1:65,1)
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
lat <- Lat[id]
long <- Long[id]
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


timehours <- seq(1,24,by=1)
mean <- 0
id <- 1
time <- 0
currentpos <- 0
long <- long
lat <- lat
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


library(ggplot2)
ggplot(data=dfhourly, aes(x=timehours, y=dfhourly$mean, group=1)) +
  geom_line()

for (i in 0:23){
  name <- paste(hashtag[id],'monday', i, '.csv',sep="")
  dfhourlyd <- dfhourly[i,]
  write.csv(dfhourly,file=name)
}




