#include <Rcpp.h>
using namespace Rcpp;

// This is a simple example of exporting a C++ function to R. You can
// source this function into an R session using the Rcpp::sourceCpp 
// function (or via the Source button on the editor toolbar). Learn
// more about Rcpp at:
//
//   http://www.rcpp.org/
//   http://adv-r.had.co.nz/Rcpp.html
//   http://gallery.rcpp.org/
//

// [[Rcpp::export]]
NumericMatrix outerC(NumericVector x, NumericVector y) {
  int n = x.size(), m = y.size();
  NumericMatrix out(n, m);
  
  for (int i = 0; i < n; ++i) {
    for (int j = 0; j < m; ++j) {
      out(i,j) = x[i] * y[j];
    }
  }
  return out;
}

