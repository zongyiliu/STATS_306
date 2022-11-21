find_smallest <- function(y) {
  nn <- length(y)
  min_pos <- 0
  min_val <- Inf
  for (j in 1:nn) {
    if (y[j] < min_val) {
      min_val <- y[j]
      min_pos <- j
    }
  }
  return(c(min_val, min_pos))
}
slow_sort <- function(x) {
  n <- length(x)
  result <- numeric(n)
  y <- x
  for (i in 1:n) {
    fs <- find_smallest(y)
    result[i] <- fs[1]
    y <- y[-fs[2]]
  }
  return(result)
}

# slow_sort(sample(1:1000))
