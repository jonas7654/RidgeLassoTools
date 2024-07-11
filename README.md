# RidgeLassoTools

# Introduction
This Repository contains the RidgeLassoTools Package

# R Package tutorial
Useful commands in order to create a R package.
1) devtools package
``` r
install.packages(c("devtools", "roxygen2", "testthat", "knitr"))
```
2) Install packages
``` r
devtools::install_github(path) #
devtools::install(path) # Install source package
devtools::install_local(path) # Install Developerversion (.tar.gz)
```
3) 

``` r
devtools::build() # Build as .tar.gz
devtools:build(binary = TRUE) # Build as binary. Depends on OS
```
