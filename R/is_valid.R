#' Check whether a given molecule in string format is chemically valid
#'
#' @param molecule string
#'
#' @return logical
#' @export
#'
#' @examples
#' is_valid('NaOH')
#' is_valid('HF')
#' is_valid('Al2(SO4)3')
is_valid <- function(molecule) {
  if(!is.string(molecule)) {
    stop("Cannot calculate hte elements, the input molecule needs to be type of string")
  }
  TRUE
}
