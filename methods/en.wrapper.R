# Fit elasitic net
# Using R package "glmnet"
# input: x - predictors of training data 
#        y - responses of training data
en.wrapper = function(input,args){
  library(glmnet)
  fit = cv.glmnet(input$x,input$y, intercept=FALSE)
  betahat = coef(fit, s="lambda.min")[-1]
  
  # return estimate of beta
  return(list(betahat=betahat))
}
