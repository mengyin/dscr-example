# Fit naive elasitic net
# Using R package "elasticnet"
# Need provide a grid for lambda in arguments!
# input: x - predictors of training data 
#        y - responses of training data
# args: lambda - vector of quadratic penalty parameter for cross validation
naiveen.wrapper = function(input,args){
  library(elasticnet)
  #lambda = c(0,0.01,0.1,1,10,100)
  lambda = args$lambda
  
  # Find optimal tuning params lambda, s
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
  
  # return estimate of beta
  return(list(betahat=betahat))
}