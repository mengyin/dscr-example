#define your methods in .R files like this one in the methods subdirectory
#each method should take arguments input and args, like the example
#the output should be a list of the appropriate "output" format (defined in the README)

ridge.wrapper = function(input,args){
  library(glmnet)
  
  fit = cv.glmnet(input$x,input$y, intercept=FALSE, alpha=0)
  betahat = coef(fit, s="lambda.min")[-1]
  return(list(betahat=betahat))
}