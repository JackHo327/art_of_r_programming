# n!
factorial(5) #5!

# calculate the probability with prod()
exactlyone <- function(p){
      notp <- 1 - p
      tot <- 0.0
      for(i in 1:length(p)){
            tot <- tot + p[i]*prod(notp[-i])
            return(tot)
      }
}
testp <- c(.5,.6,.7,.1,.4)
exactlyone(testp)

# cumulative sum and prod
cumsum(testp)
cumprod(testp)

# min() max() pmin() and pmax()
x1 <- runif(10,1,10)
x2 <- runif(10,1,10)
min(x1,x2)
max(x1,x2)
pmin(x1,x2)
pmax(x1,x2)
# pmin() and pmax() will find the corresponding values one by one in the related vectors

# caluate the max and min value in one function
# nlm()- This function carries out a minimization of the function f using a Newton-type algorithm.
nlm(function(x) return(x^2-sin(x)), 8) # randomly select a value as the second parameter of this function, and then, it will apply the Newton-type algorithm to find the min of the function

# optim() - max value
optimize(function(x) return(-x^2-sin(x)),lower=0,upper=1,maximum = TRUE)

# differential
D(expression(exp(x^2)),"x")

# integration
integrate(function(x) x^2, 0 ,1)

# statistical function

# -d
# dnorm(), dchisq(), dbinom

# -p
# pnorm(), pchisq(), pbinom()

# -q
# qnrom(), qchisq(), qbinom()

# -r
# rmorm(), rchisq(), rbinom()
set.seed(1)
rchisq(n = 1000, df = 2)
mean(rchisq(n = 1000, df = 2))

set.seed(2)
qchisq(p =.95,df = 2) # chisq distribution- 95% quantile number
qchisq(p =c(.5, .95),df = 2)


# sort()
sort(x1) # increasing sorted
sort(x1,decreasing = T) # decreasing sorted

# order() - sorting the index of the elements in the original vector
order(x1)
order(x1,decreasing = T)
x1[order(x1)]
# order() can be also applied to characters
order(letters,decreasing = T)
letters[order(letters, decreasing = T)]

# rank()
x1[order(x1)]
x1
rank(x1) # for ties value, it will be digits ranking position occurs

# calculate the inner product of 2 vectors- crossprod()
crossprod(1:3 , 4:6) == (1 * 4 + 2 * 5 + 3 * 6)

# procut of matrixes

mat1 <- matrix(1:4, 2, 2)
mat2 <- matrix(5:8, 2, 2)
mat1 %*% mat2

# solve() - can be applied to solve the linear simultaneous equations

# x1+x2 = 2;
# -x1+x2 = 4

mat3 <- matrix(c(1,-1,1,1), 2, 2)
y <- c(2,4)
solve(mat3,y)
# solve() can be also applied to calculate the inverse matrix
solve(mat3)
mat3
mat3 %*% solve(mat3)

# t()- matrix transposition
# qr()- QR decomposition
# chol()- Cholesky decoposition
# det()- calculate the determinant of a matrix
# eigen()- calculate the matrix eigenvalue and eigenvector
# diag()- get diagonal matrix from a matrix
# sweep()- numerical analysis of batch operator

mat1
diag(mat1)
diag(diag(mat1))
diag(4)

mat4 <- matrix(1:20, 5, 4)
mat4
sweep(x = mat4, MARGIN = 1, STATS = c(1,2,3,4,5), FUN = "+") # 'MARGIN = 1' means calculate based on rows

# set operation
union(x1,x2)
intersect(x1,x2)
setdiff(x1,x2) # elements in x1, but not in x2
setequal(x1,x2) # whether union x1 is equal to union x2
x1[1] %in% x1
choose(n = 10, k = 2) # calculate the number of set which has k elements and which is selected a set has n elements- n_C_k

# combn()- find out the sub-set which has n elements from a set which has k elements
combn(x1,2) # x1 has 10 elements, select 2 from 10 elements to form a sub-set and list all the sub-sets

rbinom(n = 10000, size = 5, prob = 0.5)
mean(rbinom(10000, 5, 0.5) >= 4)