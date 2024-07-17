#' Wrapper for model.matrix
#'
#' @param formula An object of class "formula". Describes the model
#'   specification
#' @param ... Other arguments corresponding to the parameters of model.matrix
#' @returns Tibble of model.matrix

model_tibble <- function(formula, ...) {
  model_matrix <- model.matrix.default(object = formula,
                                       ...)
  return(as_tibble(model_matrix))
}
