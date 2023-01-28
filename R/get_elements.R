#' Convert a chemical molecule into its constituent elements with its respective counts as a dictionary.
#'
#' @param molecule string
#'
#' @return dictionary
#' @export
#'
#' @examples
#' get_elements("(C2H4)5")
#' get_elements("Al2(SO4)3")
get_elements <- function(molecule) {
  library(tidyverse)
  if (!typeof(molecule) == "character") {
    stop("Incorrect input type, the input molecule needs to be a type of string")
  }
  if (str_count(molecule[1] > 0, "\\d")) {
    stop("Incorrect input type, the first letter of molecule should not represent a number")
  }
  # 1 Replace parenthesis
  molecule <- str_split(string = molecule, "[()]")
  if (molecule[[1]][1] == "") {
    molecule[[1]] <- molecule[[1]][2:length(molecule[[1]])]
  }
  # print(molecule)

  # 2 Check parenthesis
  if (length(molecule[[1]]) > 1) { # // parenthesis

    # 2.1 Prepare each element chunk and its multiplication
    adj_mol <- 0
    skip <- FALSE
    for (i in seq_along(molecule[[1]])) {
      if (i < length(molecule[[1]]) & (skip == FALSE)) {
        convertible <- all(grepl("^(?=.)([+-]?([0-9]*)(\\.([0-9]+))?)$", molecule[[1]][i + 1], perl = TRUE))

        if (!convertible) {
          # print(i)
          # print(molecule[[1]][i])
          # print(molecule[[1]][i+1])
          # print('Add 1')
          # print(convertible)
          adj_mol <- append(adj_mol, molecule[[1]][i])
          adj_mol <- append(adj_mol, 1)
        } else {
          # print(i)
          # print(molecule[[1]][i])
          # print(molecule[[1]][i+1])
          # print('Add number')
          # print(convertible)
          adj_mol <- append(adj_mol, molecule[[1]][i])
          adj_mol <- append(adj_mol, molecule[[1]][i + 1])
          skip <- TRUE
        }
      } else {
        skip <- FALSE
      }
      # // end for
    }
    if (!all(grepl("^(?=.)([+-]?([0-9]*)(\\.([0-9]+))?)$", molecule[[1]][length(molecule[[1]])], perl = TRUE))) {
      adj_mol <- append(adj_mol, molecule[[1]][length(molecule[[1]])])
      adj_mol <- append(adj_mol, 1)
    }
    # print(adj_mol)
    molecule <- adj_mol
    # print(molecule)

    # 2.2 Find number of each chunk
    final_elm <- 0
    final_num <- 0
    for (k in seq_along(molecule)) { # // k-loop
      if ((k > 1) & (((k %% 2) == 0))) { # inside loop
        # print(k)
        # print(molecule[k])
        this_mol <- molecule[k]
        this_mol <- str_split(string = as.character(this_mol), "(?=[[:upper:]])")
        # print(this_mol)

        # 2a Extract numbers
        elm <- 0
        num <- 0
        for (i in seq_along(this_mol[[1]])) {
          if ((i > 1) & (nchar(this_mol[[1]][i]) == 1)) {
            elm[i] <- this_mol[[1]][i]
            num[i] <- 1
          } else if ((i > 1) & (nchar(this_mol[[1]][i]) > 1)) {
            temp <- this_mol[[1]][i]
            no_digit <- str_count(temp, "\\d")
            if (no_digit != 0) {
              elm[i] <- substr(temp, 1, nchar(temp) - no_digit)
              num[i] <- substr(temp, nchar(temp) - no_digit + 1, nchar(temp))
            } else {
              elm[i] <- this_mol[[1]][i]
              num[i] <- 1
            }
          }
        }
        # print(elm)
        # print(num)

        # 2b Extract elements and numbers into dataframe
        df <- data.frame(element = elm, number = as.numeric(num))
        df <- df[-1, ]
        # print(df)
        element <- 0
        element_num <- 0
        for (i in seq_along(unique(df$element))) {
          element[i] <- unique(df$element)[i]
          element_num[i] <- df |>
            filter(element == unique(df$element)[i]) |>
            select(number) |>
            sum()
        }
        # print(element)
        # print(element_num*as.numeric(molecule[k+1]))

        # 2c Output final dataframe
        final_elm <- append(final_elm, element)
        final_num <- append(final_num, element_num * as.numeric(molecule[k + 1]))
        # print(final_elm)
        # print(final_num)

        # inside loop
      }

      # // k-loop
    }

    # 2.3 Combine duplicate elements
    df <- data.frame(element = final_elm, number = as.numeric(final_num))
    df <- df[-1, ]
    adj_element <- 0
    adj_element_num <- 0
    for (i in seq_along(unique(df$element))) {
      adj_element[i] <- unique(df$element)[i]
      adj_element_num[i] <- df |>
        filter(element == unique(df$element)[i]) |>
        select(number) |>
        sum()
    }

    # 2.4 Output final dataframe
    final_df <- data.frame(element = adj_element, count = adj_element_num)
    final_df
    # print(final_df)
    # ////////////////////////////////////////////

    # // parenthesis
  } else { # // no parenthesis
    # 3.1 Split by upper case
    molecule <- str_split(string = as.character(molecule), "(?=[[:upper:]])")

    # 3.2 Extract numbers
    # print(molecule)
    elm <- 0
    num <- 0
    for (i in seq_along(molecule[[1]])) {
      if ((i > 1) & (nchar(molecule[[1]][i]) == 1)) {
        elm[i] <- molecule[[1]][i]
        num[i] <- 1
      } else if ((i > 1) & (nchar(molecule[[1]][i]) > 1)) {
        temp <- molecule[[1]][i]
        no_digit <- str_count(temp, "\\d")
        if (no_digit != 0) {
          elm[i] <- substr(temp, 1, nchar(temp) - no_digit)
          num[i] <- substr(temp, nchar(temp) - no_digit + 1, nchar(temp))
        } else {
          elm[i] <- molecule[[1]][i]
          num[i] <- 1
        }
      }
    }
    # print(elm)
    # print(num)

    # 3.3 Extract elements and numbers into dataframe
    df <- data.frame(element = elm, number = as.numeric(num))
    df <- df[-1, ]
    element <- 0
    element_num <- 0
    for (i in seq_along(unique(df$element))) {
      element[i] <- unique(df$element)[i]
      element_num[i] <- df |>
        filter(element == unique(df$element)[i]) |>
        select(number) |>
        sum()
    }
    # df
    # print(element)
    # print(element_num)

    # 3.4 Output final dataframe
    final_df <- data.frame(element = element, count = element_num)
    final_df
    # ///////////////////////////////////////////

    # // no parenthesis
  }

  # // end function
}
