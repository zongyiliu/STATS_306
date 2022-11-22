## Supporting code for setting break points
f <- function(a) g(a)
g <- function(b) h(b)
h <- function(c) i(as.character(c))
i <- function(d) {
  if (!is.numeric(d)) {
    stop("`d` must be numeric", call. = FALSE)
  }
  d + 10
}

## Working with scripts
## 
## Set breakpoints
## debug
f(10)
