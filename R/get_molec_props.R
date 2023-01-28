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
  library(tidyverse)

  elements <- read.csv("https://raw.githubusercontent.com/UBC-MDS/chembox/main/data/elements.csv") |>
    rename(c(Element = EnglishName,
             "Density(g/cm3)" = Density,
             "AtomicRadius(pm)" = AtomicRadius,
             Config = Configuration,
             ShellConfig = ShellConfiguration,
             OxiStates = OxidationStates)) |>
    select(c(Symbol,
             Element,
             AtomicNumber,
             AtomicMass,
             "Density(g/cm3)",
             "AtomicRadius(pm)",
             Config,
             ShellConfig,
             OxiStates))

  molecule_df <- get_elements(molecule)

  elements <- elements |>
    filter(Symbol %in% molecule_df$element)

  elements
}
