#' get_combustion_equation
#'
#' @param molecule A character vector with one element, to describe a chemical
#' formula
#'
#' @return A data.frame with the balanced combustion equation
#' @export
#'
#' @examples
#' x <- "CH4"
#' get_combustion_equation(x)
get_combustion_equation <- function(molecule) {

  # check correct type of molecule
  if (!is.character(molecule)){
    stop("Molecule has to be entered as a string")
  }

  # only one molecule allowed
  if (length(molecule) != 1){
    stop("Molecule vector can only take one molecule")
  }

  # molecule should only be the basic formula
  if (str_detect(molecule, "\\(") || str_detect(molecule, "\\)") ){
    stop("Cannot have multiple molecules, don't use parentheses")
  }

  # molecule can only contain C and H
  if (length(setdiff(colnames(mol), c("C", "H"))) != 0){
    stop("Molecule can only contain C (carbon) and H (hydrogen)")
  }

  # get molecule counts
  mol_df <- data.frame(C = 6, H = 14)
  n_C <- mol_df$C
  n_H <- mol_df$H
  n_O2 <- (2 * n_C + n_H/2)/2

  # create the combustion equation dataframe
  comb_eq <- data.frame(place.holder = 1, O2 = n_O2, CO2 = n_C, H2O = n_H/2)
  names(comb_eq)[colnames(comb_eq) == "place.holder"] <- molecule

  # multiply by 2 for uneven number of atoms
  if ((n_O2 + n_C + n_H)%%1 != 0){
    comb_eq <- comb_eq*2
  }
  comb_eq
}
