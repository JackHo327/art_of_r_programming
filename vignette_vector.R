#get length of a vector
x <- rnorm(1000)
length(x)

m <- matrix(1:100,25,4)
mm <- m+10:109

#automatic filled up
set.seed(123)
v1 <- rnorm(5)
v2 <- rnorm(6) #v1 and v2 aren't the same long
v1
v2
v1+v2 # v1 is one element less than v2, so the first element will be reused again (automatic  filled up)

#usual ways to calculate vectors
v3 <- runif(10)
v4 <- runif(10)
v3/v4
v3*v4
v3+v4
v3-v4
v5 <- v3[1:(length(v3)-1)] #or v5 <- v3[-length(v3)]

#colon
5:8
1:8-1 #“：” has a higher priority than regular rule of algorithm
1:(8-1) #brackets has a higher priority than ":"

#seq()- create arithmetic sequence
seq(from =3,to= 10,by=2)
seq(3,10,length=10)
seq(v1)

#rep()- create repeated nums
rep(x = c(1,2,3,4),2)
rep(x = c(1,2,3,4),length=9)
rep(x = c(1,2,3,4),times=3)
rep(x = c(1,2,3,4),each=2)

#all() and any()
all(x>0)
any(x>0)

findRunsM <- function(x,t){
      n <- length(x)
      # runs <- NULL
      runs <- vector(length=n) #allocate the memory ahead of time, use "vector()" (do not define length=n will also accelerate the operating speed)
      count <- 0
      for(i in 1:(n-t+1)){
            if(all(x[(i:(i+t-1))]==1)){
                  count <- count+1
                  runs[count] <- i
                  #runs <- c(runs,i)
            }
      }
      
      if(count >0){
            runs #<- runs[1:count]
      }else{
           runs <- NULL
      }
      return(runs)

}

findRunsWM <- function(x,t){
      n <- length(x)
      runs <- NULL
      # runs <- vector() #allocate the memory ahead of time
      # count <- 0
      for(i in 1:(n-t+1)){
            if(all(x[(i:(i+t-1))]==1)){
                  # count <- count+1
                  # runs[count] <- i
                  runs <- c(runs,i)
            }
      }
      # if(count >0){
      #   runs #<- runs[1:count]
      # }else{
      #   runs <- NULL
      # }
      return(runs)
}
set.seed(12)
y <- as.integer(runif(100000,min=0,max=2))
time1 <- system.time(findRunsM(y,2))
time2 <- system.time(findRunsWM(y,2))
time1
time2
time1 >time2 # time1 < time2- means allocating the memory can improve the efficiency of operation

#rainy prediction
preda <- function(x,k){
      n <- length(x)
      k2 <- k/2
      pred <- vector(length = n-k)
      for(i in 1:(n-k)){
            if(sum(x[i:(i+k-1)])>=k2){
                  pred[i] <- 1 
            }else{
                  pred[i] <- 0
            }
      }
      return(mean(abs(pred-x[(k+1):n])))
      #return(pred)
}
a1 <- preda(y,3)
a2 <- preda(y,2)
a3 <- preda(y,4)
a4 <- preda(y,5)

#rainy prediction new1
predb <- function(x,k){
      n <- length(x)
      k2 <- k/2
      pred <- vector(length = n-k)
      sm <- sum(x[1:k])
      csx <- c(0,cumsum(x))
      if(sm >= k2){
            pred[1] <- 1
      }else{
            pred[1] <-0
      }
      if(n-k >= 2){
            for(i in 2:(n-k)){
                  sm <- sm + x[i+k-1] - x[i-1]
                  if(sm >= k2){
                        pred[i] <- 1
                  }else{
                        pred[i] <- 0
                  }
            }
      }
      return(mean(abs(pred-x[(k+1):n])))
}
b1 <- predb(y,3)
b2 <- predb(y,2)
b3 <- predb(y,4)
b4 <- predb(y,5)

#rainy prediction new2
predc <- function(x,k){
      n <- length(x)
      k2 <- k/2
      pred <- vector(length = n-k)
      csx <- c(0,cumsum(x))
      for(i in 1:(n-k)){
            if(csx[i+k]-csx[i] >= k2){
                  pred[i]<-1
            }else{
                  pred[i]<-0
            }
      }  
      return(mean(abs(pred-x[(k+1):n])))
}
c1 <- predc(y,3)
c2 <- predc(y,2)
c3 <- predc(y,4)
c4 <- predc(y,5)

#delete NA value
na <- c(NA,1,NA,2,NA,3,NA,8)
na[is.na(na)] <- 100
na

#filtering
foo <- runif(10)
foo[foo>0.23]
fooN <- c(NA,foo,NA,12)
fooN[fooN>0.23]
subset(fooN,fooN>0.23) #use subset() can ignore NA values automatically

which(fooN>0.23) #find the position of the values that correspond to the logical judgment
which(is.na(fooN))
fooN[which(fooN>0.23)]
fooN[which(is.na(fooN))]

#ifelse
vec <- runif(100,0,100)
ifelse(vec>10,TRUE,FALSE)
ifelse(round(vec)%%2==0,"even num","odd num")

#correlation about measurements
findud <- function(v){
      vud <- v[-1]-v[-length(v)]
      return(ifelse(vud>0,1,-1))
}
udcorr <- function(x,y){
      ud <- lapply(list(x,y),findud)
      return(mean(ud[[1]]==ud[[2]]))
}
xx <- runif(10,10,20)
yy <- runif(10,10,20)
udcorr(xx,yy)

udcorrS <- function(x,y){
      return(mean(sign(diff(x)) == sign(diff(y))))
}
udcorrS(xx,yy)

#verify is the vectors are equal to each other
xx == yy #"==" is a vectorized operator, it will compare every elements in xx and yy, not compare xx and yy themselves
all(xx==yy)
identical(xx,yy) #can verify whether xx and yy are equal to each other
#however
xxx <- 1:3
yyy <- c(1,2,3)
identical(xxx,yyy) #because ":" creates integer, and "c()" creates double























