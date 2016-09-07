#control flow
x <- runif(10,10,20)
for(i in x){
      print(i)
}

for(i in 1:length(x)){
      print(x[i])
}
#next- equals to continue

x<- c(10,12,12,14,15)

for(i in 1:length(x)){
      if(x[i] <= 12){
            next #pass the current value, continue loop with the next value 
            # use next wisely can save a lot of codes, especially for if-else
      }else(print(x[i]))
}

#for loop could operate even on files
setwd("./demo/files")
filenames <- list.files()
filenames
library(openxlsx)
datatb <- data.frame()
for(file in filenames){
      datatb <-rbind(datatb,read.xlsx(file,sheet = 1))
}

#get()- loop for non-vector objects
u <- matrix(c(1,1,2,2,3,4),nrow = 3,byrow = T)
v <- matrix(c(8,15,12,10,20,2),nrow = 3,byrow = T)

for(m in c("u","v")){
      z <- get(m) #get() return a object by accepting its name (characters)
      print(lm(z[,2]~z[,1]))
}

#if-else- win or lose- have to chose one condition- close judgement, and the {} cannot be missed, expect wrtie the whole sentence in one line

if(is.matrix(u)) print(1) else print(2)
#or
if(is.matrix(u)){
      
 print(1)} else {
      print(2)
 }

#if-else if-... open selection

#locgical operators
xx <- c(T,T,T,F)
yy <- c(T,F,F,T)
#&& for scalar; & for vector
xx && yy
xx[1] && yy[1]
for(i in 1:4){
      print(xx[i]&&yy[i])
}
#for if(), the accept value can only be one logical value, T or F, so in if() we have to use && as logical operate
#in arthmetic expresson, T and F will become 1 and 0

g1 <- function(x) return(sin(x))
g2 <- function(x) return(sqrt(x^2+1))
g3 <- function(x) return(2*x-1)

plot(c(-pi,pi),c(-pi,2))
for(f in c(g1,g2,g3)){
      plot(f,-pi,pi,add=T)
}


f <- function(x)
{
      d <-8
      return(h(d,x))
}

h <- function(x,y){
      return(x*(12+y))
}

f(2)

rm(list= ls(all=T))


two <- function(n){
      n <<- 2*n
      z <- 2*z
      return(z)
      }

o <- 1
z <- 3
n
two(o)
z


#Quicksort
#for example, there is a vector a(5,3,4,7,8,12,4,15,1), use all the rest elements to compare with the first element 5, then we will get 2 vectors v1(3,4,4,1) and v2(7,8,12,15), apply Quicksort function on v1 and v2, get v1 (1,3,4,4) and v2(7,8,12,15), then use c() to contantent v1,5,and v2, finally, just get v3(1,3,4,4,5,7,8,12,15)
#but actually, in R, we can use sort() directly get the answer

qs <- function(x){
      if(length(x)<=1) return(x)
      pivot <- x[1]
      therest <- x[-1]
      sv1 <- therest[therest > pivot]
      sv2 <- therest[therest <= pivot]
      sv1 <- qs(sv1) #recursive- the function call it-self
      sv2 <- qs(sv2) #recursive- the function call it-self
      return(c(sv2,pivot,sv1))
}
qs(c(5,3,4,7,8,12,4,15,1))

#binary tree
newtree <- function(firstval,inc){
      m <- matrix( rep(NA , inc*3),nrow = inc, ncol =3)
      m[1,3] <- firstval
      return(list(mat = m, nxt = 2, inc = inc))
}

tr <- newtree(8,3)

tr

ins <- function(hdidx, tr, newval){
      dir <- if(newval <= tr$mat[hdidx,3]) 1 else 2
      if(is.na(tr$mat[hdidx, dir])){
            newidx <- tr$nxt
            if(tr$nxt == nrow(tr$mat) +1){
                  tr$mat <- rbind(tr$mat,matrix(rep(NA,tr$inc*3),nrow=tr$inc,ncol=3))
            }
            tr$mat[newidx,3] <- newval
            tr$mat[hdidx,dir] <- newidx
            tr$nxt <- tr$nxt + 1
            return(tr)
      }else{
            tr <- ins(tr$mat[hdidx,dir],tr,newval)
      }
}

printtree <- function(hdidx, tr){
      left <- tr$mat[hdidx, 1]
      if(!is.na(left)) printtree(left, tr)
      print(tr$mat[hdidx, 3])
      right <- tr$mat[hdidx, 2]
      if(!is.na(right)) printtree(right,tr)
}

tre <- newtree(8,3)
tre <- ins(1,tre,5)
tre <- ins(1,tre,6)
tre <- ins(1,tre,2)
tre <- ins(1, tre, 20)

printtree(1,tre)

#replacement function
#names(object) <- c(strings) ==== object <- "names<-" c(object,value=strings)

ins <- edit(ins) # use edit() to modify the function at a seperate window

#create your own binary operator
"%RzH%" <- function(x,y){
      return(x/y)
} 
5 %RzH% 3

#anonymous function
ma <- matrix(1:4,2,2)
f <- function(x) x/c(2,8)
apply(X = ma, MARGIN = 1, f)
apply( ma, 1, function(x) x/c(2,8))
