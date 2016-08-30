#create a matrix
matribyCol <- matrix(1:10,nrow=5,ncol=2)
matribyRow <- matrix(1:10,nrow=5,ncol=2,byrow = T)
matribyCol
matribyRow

#operators
matribyCol2 <- matrix(1:10,2,5)
matribyCol %*% matribyCol2
3*matribyCol
matribyCol+matribyRow

#use "-" delete some elements
matribyRow[-1,]

#pictures actually are matrix, because the pixels are ranked in rows and cols
#library(pixmap)
#pic <- read.pnm(file directory)
#locator() get the coordinates that you pointed on the pics

#apply
apply(matrixDrop,1,mean) #1- row
apply(matrixDrop,2,mean) #2- col

#search the smallest number in matrix and return its position
mind <- function(x){
      n <- nrow(x)
      dd <- cbind(x,1:n)
      wmins <- apply(dd[-n,],1,imin)
      i <- which.min(wmins[2,])
      j <- wmins[1,i]
      return(c(x[i,j],i,j))
}

imin <- function(x){
      lx <- length(x)
      i <- x[lx]
      j <- which.min(x[(i+1):(lx-1)])
      k <- i + j
      return(c(k,x[k]))
}
m <- cbind(c(0,1,2,3),c(1,0,15,4),c(2,15,0,7),c(3,4,7,0))
mind(m)

#drop- escape accidentally reduce the dimensionality
r <- matribyCol[2,]
r
rr <- matribyCol[2,,drop=F]
rr

#array
first <- matrix(c(43,46,78,23,21,56),3,2)
second <- matrix(c(41,26,68,73,11,96),3,2)
arrayTest <- array(data = c(first,second),dim = c(3,2,2))
arrayTest

