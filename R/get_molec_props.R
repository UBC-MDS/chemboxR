#' get_molec_props
#'
#' @param molecule A character vector with one molecule
#'
#' @return A dataframe with various atomic properties of the elements in the
#' molecule
#' @export
#'
#' @examples
#' get_molec_props('CH4')
get_molec_props <- function(molecule) {
<<<<<<< HEAD
  TRUE
}
=======
  library(tidyverse)

  molecule_df <- get_elements(molecule)

  elements <- read.csv("https://raw.githubusercontent.com/UBC-MDS/chembox/main/data/elements.csv") |>
    rename(c(Element = EnglishName,
             Config = Configuration,
             ShellConfig = ShellConfiguration,
             OxiStates = OxidationStates)) |>
    select(c(Symbol,
             Element,
             AtomicNumber,
             AtomicMass,
             Density,
             AtomicRadius,
             Config,
             ShellConfig,
             OxiStates)) |>
    filter(Symbol %in% molecule_df$element) |>
    arrange(Element)

  elements
}
>>>>>>> de410a9b016f1d9335327dc45f0e6ae340717688
