# Simulate data in Zou & Hastie (2005)
# predictor: X~multivariate normal
# response: Y~X*beta+sigma*eps, where eps is standard normal noise
# args: Cov - Covariance matrix of X
#       beta - vector
#       sigma - scalar
#       nsamp.train - sample size of training set
#       nsamp.test - sample size of testing set
datamaker = function(seed,args){
  library(MASS)
  set.seed(seed)
  
  nsamp.train = args$nsamp.train
  nsamp.test = args$nsamp.test
  sigma = args$sigma
  beta = args$beta
  Cov = args$Cov
  
  x.train = mvrnorm(nsamp.train, mu=rep(0,length(beta)), Sigma=Cov)
  x.test = mvrnorm(nsamp.test, mu=rep(0,length(beta)), Sigma=Cov)
  eps.train = rnorm(nsamp.train, 0, 1)
  eps.test = rnorm(nsamp.test, 0, 1)
  y.train = x.train%*%beta+sigma*eps.train
  y.test = x.test%*%beta+sigma*eps.test
  
  # Use test data as meta data
  meta = list(x=x.test, y=y.test, beta=beta, sigma=sigma)
  
  # Use training data as input data
  input = list(x=x.train, y=y.train)
  
  data = list(meta=meta,input=input)
  return(data)
}
