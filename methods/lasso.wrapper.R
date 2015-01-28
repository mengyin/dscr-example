# Fit lasso regression
# Using R package "glmnet"
# input: x - predictors of training data 
#        y - responses of training data
lasso.wrapper = function(input,args){
  library(glmnet)
  fit = cv.glmnet(input$x,input$y, intercept=FALSE, alpha=1)
  betahat = coef(fit, s="lambda.min")[-1]
  return(list(betahat=betahat))
}