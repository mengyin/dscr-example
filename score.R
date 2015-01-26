#This file should define your score function

score = function(data, output){
#insert calculations here; return a named list of results
  #library(glmnet)
  #pred.en = predict(output$fit, newx=data$meta$x, s="lambda.min")
  pred = data$meta$x%*%output$betahat
  MSE = mean((data$meta$x%*%data$meta$beta-pred)^2)
  return(list(MSE=MSE))
}
