#define your methods in .R files like this one in the methods subdirectory
#each method should take arguments input and args, like the example
#the output should be a list of the appropriate "output" format (defined in the README)

naiveen.wrapper = function(input,args){
  library(elasticnet)
  N = length(input$y)
  #lambda = c(0,0.01,0.1,1,10,100)
  lambda = args$lambda
  
  error.opt = Inf
  s.opt = 0
  lambda.opt = lambda[1]
  for (i in 1:length(lambda)){
    temp = cv.enet(input$x, input$y, lambda=lambda[i], s=seq(0,1,by=0.01), mode="fraction", 
                   intercept=FALSE, plot.it=FALSE)
    if (min(temp$cv.error)<error.opt){
      s.opt = seq(0,1,by=0.01)[which.min(temp$cv.error)]
      lambda.opt = lambda[i]
      error.opt = min(temp$cv.error)
    }
  }
  
  fit = enet(input$x, input$y, lambda=lambda.opt, intercept=FALSE)
  betahat = predict(fit,type="coefficients",s=s.opt,mode="fraction",naive=TRUE)$coef
  return(list(betahat=betahat))
}