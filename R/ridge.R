#' Estimates the ridge model
#'
#' @param formula An object of class "formula". Describes the model
#'   specification
#' @param lambda A number which represents the penalty. Default is set to zero
#'   which yields the least squares estimator
#' @param data An optional data frame or tibble which contains the corresponding
#'   data. When not specified the data will be taken from the parent environment
#'   of "formula".


ridge_estimator <- function(formula = NULL, lambda = 0, data = NULL) {
  # Check parameters
  stopifnot("The first argument must be a formula" =
           (is_formula(formula, scoped = TRUE))
           )
  stopifnot("lambda must be a number" =
           (is.numeric(lambda))
           )
  if (!is.null(data)) {
    stopifnot("data must be a data frame" =
             (is.data.frame(data))
             )
  }


  # Create a model tibble
  if (!is.null(data)) {
    X <- model_tibble(formula, data = data)
  }
  else {
    X <- model_tibble(formula, data = environment(formula))
  }
  print("ok")

  print(m)
  # Estimate coefficients
  beta <- solve(t(X) %*% X + lambda * diag(ncol(X)),
          t(X) %*% y_reg) #without INTERCEPT

  return(beta)

}

