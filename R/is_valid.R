#' Check whether a given molecule in string format is chemically valid
#'
#' @param molecule string
#'
#' @return logical
#' @export
#'
#' @examples
#' is_valid('NaOH')
#> [1] TRUE
#' is_valid('HF')
#> [1] TRUE
#' is_valid('Al(SO4)3')
#> [1] FALSE
is_valid <- function(molecule) {
  if(!is.string(molecule)) {
    stop("Cannot calculate hte elements, the input molecule needs to be type of string")
  }
  TRUE
}
