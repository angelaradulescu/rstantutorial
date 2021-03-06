# RStan script for a simple Bernoulli-Beta model
# Adapted from John Kruschke, Doing Bayesian Data Analysis, 2nd edition

# Clear workspace
rm(list = ls())

# Set working directory
setwd('/Users/angelar/Dropbox/research/presentations_mine/rstantutorial/') ### Change this 

# Load dependencies 
fileNameRoot="Stan-BernBeta-Script-"
source("DBDA2E-utilities.R")
library(rstan)

# Specify model:
modelString = "
  data {
    int<lower=0> N ; // number of observations
    int y[N] ; // array of observations of size N
    int K ; // concentration parameter 
  }
  parameters {
    real<lower=0,upper=1> omega;
    real<lower=0,upper=1> theta ;
  }
  model {
    omega ~ beta(1,1);
    theta ~ beta(omega*(K-2)+1,(1-omega)*(K-2)+1) ;
    y ~ bernoulli(theta) ; 
  }
" # close quote for modelString

# Translate model to C++ 
stanDso <- stan_model( model_code=modelString ) 

# Specify data:
N = 50 ; z = 10; K = 1;
y = c(rep(1,z),rep(0,N-z))
dataList = list(
  y = y ,
  N = N ,
  K = K
)

# Generate posterior sample:
stanFit <- sampling( object=stanDso , 
                     data = dataList , 
                     chains = 3 ,
                     iter = 5000 ,
                     warmup = 4500
                    )

# Make graphs:
mcmcCoda = mcmc.list( lapply( 1:ncol(stanFit) , 
                              function(x) { mcmc(as.array(stanFit)[,x,]) } ) )
diagMCMC( mcmcCoda , parName=c("omega") )
# saveGraph(file=paste0(fileNameRoot,"Diag"),type="eps")

#------------------------------------------------------------------------------
# Another data set:

# Specify data:
N = 50 ; z = 40
y = c(rep(1,z),rep(0,N-z))
dataList = list(
  y = y ,
  N = N 
)

# Generate posterior sample:
stanFit <- sampling( object=stanDso , 
                     data = dataList , 
                     chains = 3 ,   # number of chains
                     iter = 1000    # number of steps per chain
)

# Make graphs:
mcmcCoda = mcmc.list( lapply( 1:ncol(stanFit) , 
                              function(x) { mcmc(as.array(stanFit)[,x,]) } ) )
diagMCMC( mcmcCoda , parName=c("theta") )

