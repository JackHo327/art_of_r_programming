#Factor is derived from Nominal Variables in Statistics.

mt <- mtcars

mt$cyl <- as.factor(mt$cyl)

# mt$cyl <- factor(mt$cyl,levels = 1:10) 
#levels section is an optional vector of the values (as character strings) that x might have taken. unique(x) should be the subset of levels, sorted into increasing order of x. This set can be specified as smaller than sort(unique(x)).

mt$cyl

#the length of a factor vector actually is the length of your elements in vector, rather than the length of thoes levels.
length(mt$cyl) #32 obs

#tapply()- Apply a function to each cell of a ragged array, that is to each (non-empty) group of values given by a unique combination of the levels of certain factors.
mt
tapply(mt$disp,mt$cyl,mean)
apply(X = mtcars,2,mean)
lapply(mtcars,mean)
sapply(mtcars, mean)
mt$vs <- as.factor(mt$vs)

tapply(mt$disp,list(mt$cyl,mt$vs),mean) #use 2 factor vectors, and since the length of these 2 vectors may/maynot be the same, use list() to store em. And this function will create a contingency table.

#split()- divides the data in the vector x into the groups defined by f.
split(mt,mt$cyl)
split(1:32,mt$cyl) #get the indexes of elements correspond to the factors.
split(mt,list(mt$cyl,mt$vs))
split(1:32,list(mt$cyl,mt$vs))

#by()- an object-oriented wrapper for tapply applied to data frames.
by(mt,mt$cyl,FUN = function(x) lm(x[,1]~x[,4])) #tapply cannot do this, because tapply(X,F,fun), the X must be an atomic object, typically a vector.

#table()- you can create contingency table, frequency table and even high dimentional table
# contingency table- needs 2 variables
table(mt$cyl,mt$vs)
library(xlsx)
ct <- read.xlsx2("ctgytbl.xlsx",header = T,sheetIndex = 1)
ct$vote.for.X <- as.character(ct$vote.for.X)
ct$vote.for.x.last.time <- as.character(ct$vote.for.x.last.time)
tct <- table(ct)
# frequency- needs 1 variables
table(mt$cyl)

#can also create high dimentional table
table(mt$cyl,mt$vs,mt$gear,mt$am)

#addmargins()- calculates margins of tables or arrays
addmargins(table(ct))

#subtable()- write a function that can extract sub-tables from a table()
subtable <- function(tbl,subnames){
      # get array of cell counts in tbl
      tblarray <- unclass(tbl)  
      # we'll get the subarray of cell counts corresponding to subnames by
      # calling do.call() on the "[" function; we need to build up a list
      # of arguments first
      dcargs <- list(tblarray) #list is a place to store 2 dimentional data containers, such matrix, data frame.  
      ndims <- length(subnames)  # number of dimensions 
      for (i in 1:ndims) {
            dcargs[[i+1]] <- subnames[[i]]
      }  
      subarray <- do.call("[",dcargs)  # do.call(what,args)- args is
      #"["()- faces different dimentional arrays, it could set different args, for example, for 2 dimentional (a matrix), there are 2 args-- row and col, for 3 dimentional array-- row, col and the third dim.
      
      # now we'll build the new table, consisting of the subarray, the
      # numbers of levels in each dimension, and the dimnames() value, plus
      # the "table" class attribute
      dims <- lapply(subnames,length) 
      subtbl <- array(subarray,dims,dimnames=subnames)
      class(subtbl) <- "table"
      return(subtbl)
}
ls <- list(vote.for.X=c("No","Yes"),vote.for.x.last.time=c("No","Yes"))
subtable(tct,ls)

aray <- array(1:24,c(4,3,2),dimnames = list(c(1,2,3,4),c(5,6,7),c(8,9)))
aray
listl <- list(aray,1:2,1:3,1:2)
do.call("[",listl) # learn how does do.call() work.


#tabdom()- write a function that can filter the element in one table which has the largestest frequency num.
num <- as.integer(runif(100,0,10))
tbNum <- table(num)
tabdom <- function(tbl,k){
      tableTbl <- as.data.frame(tbl)
      tableTbl <- tableTbl[order(tableTbl$Freq,decreasing = T),]
      return(tableTbl[1:k,])
}
tabdom(tbNum,3)

#aggregate()- splits the data into subsets, computes summary statistics for each, and returns the result in a convenient form.

#cut()- divides the range of x into intervals and codes the values in x according to which interval they fall.

seqNum <- seq(from=-1,to=9,by=1)

cut(num,seqNum,labels = F) #cut()- creates intervals- (a1,b1],(b1,c1]....


































