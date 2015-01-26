#define your datamaker functions in .R files in the datamaker subdirectory
#each datamaker should take input seed (integer) and args (list), and output a list with names elements meta and input
#the format of the meta and input elements should be defined in the README
#
datamaker = function(seed,args){
  library(MASS)
  set.seed(seed)
  
  nsamp.train = args$nsamp.train
  nsamp.test = args$nsamp.test
  sigma = args$sigma
  beta = args$beta
  Cov = args$Cov
  
  #Cov = 0.5^abs(outer(1:length(beta), 1:length(beta), FUN='-'))
  
  x.train = mvrnorm(nsamp.train, mu=rep(0,length(beta)), Sigma=Cov)
  x.test = mvrnorm(nsamp.test, mu=rep(0,length(beta)), Sigma=Cov)
  eps.train = rnorm(nsamp.train, 0, 1)
  eps.test = rnorm(nsamp.test, 0, 1)
  y.train = x.train%*%beta+sigma*eps.train
  y.test = x.test%*%beta+sigma*eps.test
  
  meta = list(x=x.test, y=y.test, beta=beta, sigma=sigma)
  input = list(x=x.train, y=y.train)
  
  data = list(meta=meta,input=input)
  
  return(data)
  
}
