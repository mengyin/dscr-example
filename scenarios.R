sourceDir("datamakers")
scenarios=list()

#Now, for each scenario create an element of scenarios of the following form
scenarios[[1]]=list(name="scenario(a)",fn=datamaker,
                    args=list(beta=c(3,1.5,0,0,2,0,0,0),
                              sigma=3,
                              Cov=0.5^abs(outer(1:8,1:8,FUN='-')),
                              nsamp.train=40,nsamp.test=200),
                    seed=1:50)

scenarios[[2]]=list(name="scenario(b)",fn=datamaker,
                    args=list(beta=rep(0.85,8),
                              sigma=3,
                              Cov=0.5^abs(outer(1:8,1:8,FUN='-')),
                              nsamp.train=40,nsamp.test=200),
                    seed=1:50)

scenarios[[3]]=list(name="scenario(c)",fn=datamaker,
                    args=list(beta=rep(c(0,2,0,2),each=10),
                              sigma=15,
                              Cov=0.5^abs(outer(1:40,1:40,FUN='-')),
                              nsamp.train=200,nsamp.test=400),
                    seed=1:50)

library(Matrix)
temp = matrix(rep(1,25),ncol=5)+0.01*diag(5)
Cov.4 = bdiag(temp,temp,temp,diag(25))
scenarios[[4]]=list(name="scenario(d)",fn=datamaker,
                    args=list(beta=c(rep(3,15),rep(0,25)),
                              sigma=15,
                              Cov=Cov.4,
                              nsamp.train=100,nsamp.test=400),
                    seed=1:50)