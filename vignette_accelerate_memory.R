x <- runif(10000000)
y <- runif(10000000)

system.time(z <- x + y)
system.time(for (i in 1:1000000) z[i] <- x[i] + y[i])

nreps <- 1:100
xymat <- matrix(rnorm(2 * nreps), ncol = 2)
maxs <- pmax(xymat[, 1], xymat[, 2])
print(mean(maxs))


tmp <- function(x,y,n)
{
      z <- NULL
      for (i in 1:n)
      {
            z <- rbind(z, y, x)

      }
      return(z)
}

## Rprof() helps to analyze the codes-- finding out which part runs slowly and quickly
Rprof()
invisible(tmp(x, y, 2))
Rprof(NULL)
summaryRprof()

# complier::cmpfun() helps to accelerate the speed by providing an interface to a byte code compiler for R
# the effect/difference is not that obvious, but under some situations, this will improve the performance
require(complier)
newTmp <- cmpfun(tmp)
system.time(newTmp(x, y, 3))
system.time(tmp(x, y, 3))