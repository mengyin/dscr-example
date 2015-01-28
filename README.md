# dscr-template
a repository for using dynamic statistical comparison to reproce simulation examples in Zou & Hastie (2005)

## How to use this to run the elastic net DSC example

1. Load the package "dscr" in R. [Make sure you have installed the `dscr` package first from https://github.com/stephens999/dscr]
2. Set R's working dicrectory to this repo.
3. Run the elastic net DSC example by running `source("run_dsc.R")` in R. It runs 4 methods (elastic net, naive elastic net, lasso, ridge regression) on the 4 simulation scenarios in Zou & Hastie (2005).
4. Show the median Mean Squared Errors $mean((X_{test}\beta - X_{test}\hat{\beta})^2)$ of the 4 methods for the 4 simulation scenarios by running `aggregate(MSE~method+scenario,res,median)`.
