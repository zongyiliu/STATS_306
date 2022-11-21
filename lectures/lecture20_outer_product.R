
outer1 <- function(x, y) {
  result <- matrix(0, nrow = length(x), ncol = length(y))
  for (i in seq_along(x)) {
    for (j in seq_along(y)) {
      result[i, j] <- x[i] * y[j]
    }
  }
  result
}

outer2 <- function(x, y) {
  result <- matrix(0, nrow = length(x), ncol = length(y))
  for (j in seq_along(y)) {
    result[, j] <- x * y[j]
  }
  result
}

outer3 <- function(x, y) {
  result <- numeric(0)
  for (y_j in y) {
    v <- x * y_j
    result <- c(result, v)
  }
  matrix(result, ncol = length(y))
}

run_two <- function(x, y) {
  outer1(x, y)
  outer2(x, y)
  return(NULL) 
}

run_three <- function(x, y) {
  outer1(x, y)
  outer2(x, y)
  outer3(x,y)
  return(NULL)
}

# profvis(run_two(1:1000, 1:1000))
# profvis(run_three(1:1000, 1:1000))



