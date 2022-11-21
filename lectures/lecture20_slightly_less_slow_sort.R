find_smallest <- function(y) {
  return(c(min(y), which.min(y)))
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
