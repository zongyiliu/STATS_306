# This script allows a user to create a univariate function that has a global 
# minimum, approximate the minimum, and then plot the function as well as the 
# minimum. 
# 
# EXERCISE: Try using any of the debugging tools that we have learned in order 
#           to find and fix the error(s) in this script. 

f <- function(x) {
  # Quadratic polynomial
  x^2 - 4 * x + 5
}

g <- function(x) {
  # Quartic polynomial
  (x / 2 - 1) * (x / 2 + 2) * (x / 2 - 1) * (x / 2 + 3)
}

get_min <- function(fn, upper, lower) {
  # This function is used to get the minimum of a function
  optim(0, fn = fn, method = "Brent", lower = lower, upper = upper)
}

plot_fun_min <- function(fn, upper, lower, n_points = 500) {
  # This function finds the minimum to fn, plots values of fn in the specified 
  # range, and plots the minimum value of the function as a red point. 
  # 
  # NOTE: fn needs to be a univariate function.
  
  df <- data.frame(
    X = seq(lower, upper, length.out = n_points)
  )
  
  df$Y <- fn(df$X)
  
  optim_results <- get_min(fn, upper, lower)
  
  ggplot(df, aes(x = X, y = Y)) + 
    geom_line() + 
    geom_point(x = optim_results$par, y = optim_results$value, col = 'red') + 
    theme_bw()
}


plot_fun_min(f, upper = 5, lower = -4, n_points = 500)
plot_fun_min(g, upper = 4.2, lower = -7.5, n_points = 1000)
