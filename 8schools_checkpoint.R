# Run this to check that RStan was installed correctly
# Source: https://github.com/stan-dev/rstan/wiki/RStan-Getting-Started

# Loading RStan 
library(rstan)

# Clear workspace
rm(list = ls())

# Set working directory
setwd('/Users/angelar/Dropbox/research/presentations_mine/rstantutorial/') ### Change this 

schools_dat <- list(J = 8, 
                    y = c(28,  8, -3,  7, -1,  1, 18, 12),
                    sigma = c(15, 10, 16, 11,  9, 11, 10, 18))

fit <- stan(file = '8schools.stan', data = schools_dat, 
            iter = 1000, chains = 4)


# 
print(fit)
plot(fit)
pairs(fit, pars = c("mu", "tau", "lp__"))

la <- extract(fit, permuted = TRUE) # return a list of arrays 
mu <- la$mu 

### return an array of three dimensions: iterations, chains, parameters 
a <- extract(fit, permuted = FALSE) 

### use S3 functions as.array (or as.matrix) on stanfit objects
a2 <- as.array(fit)
m <- as.matrix(fit)