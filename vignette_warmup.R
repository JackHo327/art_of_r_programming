#create 1000 random normal distribution numbers, then calculate its absoulte value, and calculate the mean value of em.
x <- mean(abs(rnorm(1000)))
x

#draw a histgram in a pdf file
pdf("hist.pdf")
hist(rnorm(1000))
dev.off()
y <- c(1,2,4)
q <- c(y,y,9)
y[3]
q

#use data() to check the  default packages already in R base system
data()
summary(Nile)
meanNile <- mean(Nile)
sdNile <- sd(Nile)
hist(Nile,breaks = 15)
hist(Nile,breaks = 50)
lineNile <- plot(Nile)
abline(h = meanNile,col = "red")

#oddcount- counts the odd number of a set of data
oddcount <- function(x){
  k <- 0
  for(i in x){
    if (i %% 2 == 1){
      k <- k+1
    }
  }
  return(k)
}
oddcount(1:100)

#oddreturn- returns odd numbers
oddreturn <- function(x){
  k <- NULL
  odds <- NULL
  for(i in x){
    if(i %% 2 ==1){
      #return(i)
      k <- i
      odds <- c(odds,k)
      #print(k)
    }
  }
  #can also print "odds" directly to get the results
  return(odds)
}
oddreturn(1:100)

#data type
num <- 5
char <- c("5","a")
charpaste <- paste("char","b","los",sep="")

matrixr <- rbind(c(1,2,3),c(4,5,6))
matrixc <- cbind(c(1,2,3),c(4,5,6))
dim(matrixr)
dim(matrixc)

matri <- matrix(1:10,nrow = 5,ncol = 2)
matri
matri[1,2]
matri[1,]
matri[,2]

lls <- list(a=matrixc,b=matrixr,c=matri,d=c("a","b","c","d"))
lls
lls$a
str(lls)

cars <- mtcars
cars
