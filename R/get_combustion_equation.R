#' get_combustion_equation
#'
#' @param molecule A character vector with one element, to describe a chemical
#' formula
#'
#' @return A data.frame with the balanced combustion equation
#' @import stringr
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

  # get molecule counts
  mol_df <- get_elements(molecule)
  mol_elem <- mol_df$element
  CH <- c("C", "H")

  # molecule can only contain C and H
  if (length(union(setdiff(CH, mol_elem), setdiff(mol_elem, CH))) != 0 ){
    stop("Molecule can only contain C (carbon) and H (hydrogen)")
  }

  for (i in seq_along(mol_df$element)) {
    elem <- mol_df$element[i]
    if (elem == "C"){
      n_C <- mol_df$count[i]
    }
    else {
      n_H <- mol_df$count[i]
    }
  }

  # n_C <- mol_df$C
  # n_H <- mol_df$H
  n_O2 <- (2 * n_C + n_H/2)/2

  # create the combustion equation dataframe
  comb_eq <- data.frame(place.holder = 1, O2 = n_O2, CO2 = n_C, H2O = n_H/2)
  names(comb_eq)[colnames(comb_eq) == "place.holder"] <- molecule
  i <- 0
  # multiply by 2 for uneven number of atoms
  while ((n_O2 + n_C + n_H)%%1 != 0){
    if (i > 4){
      break
    }
    comb_eq <- comb_eq*2
    n_C <- comb_eq$CO2
    n_H <- comb_eq$H2O
    n_O2 <- (2 * n_C + n_H)/2

  }

  comb_eq
}
