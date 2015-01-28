sourceDir("methods")
methods=list() 

# Compare 4 methods: elasticnet, lasso, ridge regression, naive elastic net
# Note: need specify lambda for the naive elastic net method!
methods[[1]] = list(name="elasticnet",fn=en.wrapper,args=NULL)
methods[[2]] = list(name="lasso",fn=lasso.wrapper,args=NULL)
methods[[3]] = list(name="ridge",fn=ridge.wrapper,args=NULL)
methods[[4]] = list(name="naiveen",fn=naiveen.wrapper,args=list(lambda=c(0,0.01,0.1,1,10,100)))
