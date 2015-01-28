# Fit ridge regression
# Using R package "glmnet"
# input: x - predictors of training data 
#        y - responses of training data
ridge.wrapper = function(input,args){
  library(glmnet) 
  fit = cv.glmnet(input$x,input$y, intercept=FALSE, alpha=0)
  betahat = coef(fit, s="lambda.min")[-1]
  
  # return estimate of beta
  return(list(betahat=betahat))
}