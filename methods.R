sourceDir("methods")
methods=list()
#now for each method define a list with its name, function and arguments (if no additional arguments use NULL)
# like this: 
methods[[1]] = list(name="elasticnet",fn=en.wrapper,args=NULL)
methods[[2]] = list(name="lasso",fn=lasso.wrapper,args=NULL)
methods[[3]] = list(name="ridge",fn=ridge.wrapper,args=NULL)
methods[[4]] = list(name="naiveen",fn=naiveen.wrapper,args=list(lambda=c(0,0.01,0.1,1,10,100)))
