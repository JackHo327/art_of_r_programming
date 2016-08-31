#data frame is one of the commonest data form/class in R, and it can be classfied as two- dimentional matrix
#like list, data frame can also store many different kinds of data type, such as numeric, character, boolean,... and data frames can be stored into list, but it not happen frequently
ls <- list(df1=data.frame(num1 = runif(10,0,1),num2=runif(10,1,11)),df2=data.frame(num1 = runif(10,0,1),num2=runif(10,1,11)))

#one col in a data frame can be treated as a vector
df <- data.frame(num1 = runif(10,0,1),num2=runif(10,1,11))
df$num1
class(df$num1)

#stringAsFactors=F, keep the characters being transformed into factors
str(df)
summary(df)

#basically, the operation on data frame is the same to that on matrix or lsit.
df[1:2,]
df[[1]]

df[2] 
df[,2] 
class(df[2]) #data frame
class(df[,2]) #vector

df[2:6,1,drop=F]
class(df[2:6,1,drop=F]) #data frame

#handle NA values (missing value)- add agrs "na.rm=T" in some functions or us is.na() to distinguish NA values before hand
df$num1[c(1,4,6)] <- NA
df
# mean(df$num1)
mean(df$num1,na.rm = T)

#with subset(), NA values will be automatically ignored
# subset(df,is.na(df$num1)==T)
# subset(df,is.na(df$num1)!=T)
# subset(df,df$num1 >.5)
subset(df,is.na(num1)==T)
subset(df,is.na(num1)!=T)
subset(df,num1 >.5)

#complete.cases()- returns a logical vector indicating which cases (row) are complete, i.e., have no missing values.
complete.cases(df)
df[complete.cases(df),]

#rbind and cbind
rbind(df,df)
cbind(df,df)
attr(df,"names") <- c("NUM1","NUM2") #Get or set specific attributes of an object, like "names","dim",...
df

#apply(), “1” means "row";"2" means "col"
apply(df,1,mean)
apply(df,1,mean,na.rm=T)
#lapply() and sapply() can also be implemented to data frames; lapply() returns a list and saplly() returns a vector

#merge()- merges data frames
df1 <- data.frame(NUM1 = df$NUM1,NUM = runif(10,20,30))
df
df1
merge(df1,df,by.x = "NUM1")

df2 <- data.frame(num1=1:4,num2=c(1,2,1,3))
df3 <- data.frame(num1=c(1,2,4,5),char=c("a","b","c","d"))
merge(df2,df3)

#count fileds of every fields
cat("NAME", "1:John", "2:Paul","3:a:b", file = "foo", sep = "\n")
count.fields("foo", sep = ":")
# count.fields("a.txt",sep="")
all(count.fields("foo",sep=":")>=1) #help to check the data integrity
table(count.fields("foo",sep=":")) #help to check the data integrity




