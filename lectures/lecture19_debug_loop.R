set.seed(30322888) # keeps random number generation consistent

sample_sizes <- rpois(10000, lambda = 6) - 1

ab <- map(sample_sizes, rnorm)
