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

  # Check validity of formula

  terms_info <- terms(formula)
  y_length <- attr(terms_info, "response")
  formula_lhs <- formula[[2]]

  stopifnot("Only one response variable is allowed" =
           (y_length == 0 || length(all.vars(formula_lhs)) != 1)
           )

  # Create a model tibble
  if (!is.null(data)) {
    X <- model_tibble(formula, data = data)
    y <- formula[[2]]
    data[y]
  }
  else {
    # Get variables from the parent environment
    X <- model_tibble(formula, data = environment(formula))
    y <- formula[[2]]
  }

  print(m)
  # Estimate coefficients
  beta_ridge <- solve(t(X) %*% X + lambda * diag(ncol(X)),
          t(X) %*% y)

  return(beta_ridge)

}

