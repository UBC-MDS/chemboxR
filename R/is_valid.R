#' Check whether a given molecule in string format is chemically valid
#'
#' @param molecule string
#' @param molecule logical
#' @return logical
#' @export
#'
#' @examples
#' is_valid("NaOH")
#> [1] TRUE
#' is_valid("HF")
#> [1] TRUE
#' is_valid("Al(SO4)3")
#> [1] FALSE
is_valid <- function(molecule, simple_deck = FALSE) {
  library(tidyverse)
  if (!is.character(molecule)) {
    stop("Cannot calculate hte elements, the input molecule needs to be string")
  }
  conjugates <- read.csv("https://raw.githubusercontent.com/UBC-MDS/chembox/main/data/conjugates.csv")
  elements <- read.csv("https://raw.githubusercontent.com/UBC-MDS/chembox/main/data/elements.csv")
  components <- as.list(rep(0, length(conjugates$name)))
  names(components) <- conjugates$name
  for (conj in conjugates$name) {
    if (grepl(conj, molecule) == TRUE) {
      molecule <- gsub(conj, "", molecule)
      components[[conj]] <- 1
      multiple_loc <- str_locate(molecule, "\\(\\)")[2]

      # Handle if there are multiple conjugates
      if (!is.na(multiple_loc)) {
        ind_start <- multiple_loc + 1
        ind_end <- ind_start
        while (ind_end < nchar(molecule) && !is.na(as.numeric(substr(molecule, ind_end, ind_end)))) {
          ind_end <- ind_end + 1
        }
        # Get the subscript number
        num <- as.numeric(substr(molecule, ind_start, ind_end))

        # Update the count of the molecules
        components[[conj]] <- components[[conj]] * num
        # Remove the original string containing ()

        molecule <- gsub(paste("\\(\\)", as.character(num), sep = ""), "", molecule, )
      }
    }
  }
  # find if there exist brackets

  other_elem <- get_elements(molecule)

  for (i in seq(nrow(other_elem))) {
    components[[other_elem$element[i]]] <- other_elem$count[i]
  }

  valance <- 0
  for (c in names(components)) {
    if (nrow(conjugates[conjugates$name == c, ]) == 1) {
      valance <- valance + as.numeric(conjugates[conjugates$name == c, "valance"]) * components[[c]]
    } else if (nrow(elements[elements$Symbol == c, ]) == 1) {
      info <- elements[elements$Symbol == c, ]
      group <- as.numeric(info["Group"])
      ox_state <- (info["OxidationStates"])
      tryCatch(
        {
          elem_val <- as.numeric(ox_state)
        },
        error = function(e) {
          stop(paste0("Oxidation state of ", c, " could be multiple. The formula could not be easily checked."))
        }
      )
      valance <- valance + elem_val * components[[c]]
    } else {
      stop(paste0("An unknown element ", c, " entered. Please check your input."))
    }
  }
  if (simple_deck){
    TRUE
  } else {
    valance == 0
  }
}
print(is_valid("Na2CO3"))
