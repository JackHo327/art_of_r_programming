#lsit
person1 <- list(name="Jack",age=23,vip=TRUE)
#or
person2 <- vector(mode="list")
person2[["name"]] <- "Jack"
person2[["age"]] <- 23
person2[["vip"]] <-T

#use double square bracket to access the element of sub-module, and the type/class of that element will correspond to the sub-module; use single square bracket will return a new sub-lsit
class(person2[["age"]]) #numeric
class(person2["age"]) #lsit

#add new sub-modules
person2[["height"]] <- 180
person2[[5]] <-80
names(person2)[5] <- "weight"

#delete sub-modules- just assign NULL to em
person2[[6]] <- "demo"
person2[[6]] <- NULL
person2

#after adding or deleting sub-modules, the index of list will automatically do the calculating and change to the right value

#get length- get how many sub-modules the list has
length(person2)

#findword()- find words and count em, but you got modify the Strings before you analyse the texts such turning em into lower cases and delete the numbers or other non-letter-characters.
findwords <- function(tf){
      txt <- scan(tf,"") #scan() read data into a vector or list from the console or file.
      wl <- list()
      for(i in 1:length(txt)){
            wrd <- txt[i]
            wl[[wrd]] <- c(wl[[wrd]],i)
      }
      return(wl)
}
Fwords1 <- findwords("./War and Peace.txt")
Fwords2 <- findwords("./a.txt")
Fwords2

#get values from list- unlist- transfer the list into vector
unlist(person2) 
#Vectors will be coerced to the highest type of the components in the hierarchy NULL < raw < logical < integer < double < complex < character < list < expression: pairlists are treated as lists
unname(person2) #remove the names of lsit

#*apply()

#lapply()- list apply, return a list
meanList <- list(1:10,2:11,9:20)
lapply(meanList,mean)
#sapply()- simplify apply- whose results more articulate than lapply(), return a vector or matrix
sapply(X = meanList,mean)

#alphawl1- sort the words based on alphabet
alphawl <- function(wrdlist){
      nms <- names(wrdlist)
      sn <- sort(nms) #sort()
      return(wrdlist[sn])
}
alphawl(Fwords2)

freqwl <- function(wrdlist){
      freqs <- sapply(wrdlist, length) #get word frequencies
      return(wrdlist[order(freqs)]) #order() returns the indexes of sorted elements
}
freqwl(Fwords2)

nwords <- length(freqwl(Fwords2))
nwords1 <- length(freqwl(Fwords1))
frwq <- sapply(freqwl(Fwords1)[round(0.999*nwords1):nwords1],length) #for "0.9*nwords1:nwords1", it will calculate ":" first, then "*", so the brackets are needed.
barplot(frwq)

#lsit can be recursive, which means list can contain list
c(list(person1,person2),"a")
c(list(p1=person1,p2=person2),"a")
c(list(p1=person1,p2=person2),"a",recursive=T) #recursive=T makes the lsit flat- unlist
