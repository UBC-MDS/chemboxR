#' Convert a chemical molecule into its constituent elements with its respective counts as a tibble.
#'
#' @param molecule string
#'
#' @return tibble
#' @export
#'
#' @examples
#' get_elements('(C2H4)5')
#' get_elements('Al2(SO4)3')
get_elements <- function(molecule) {
  if(!is.string(molecule)) {
    stop("Cannot calculate hte elements, the input molecule needs to be type of string")
  }
  TRUE
}