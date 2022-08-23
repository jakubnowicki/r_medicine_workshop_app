box::use(
  rhino,
  dplyr,
)

#' @export
species <- c(
  "Black Rhino",
  "Indian Rhino",
  "Javan Rhino",
  "Southern White Rhino",
  "Sumatran Rhino"
)

#' @export
fetch_data <- function() {
  rhino::rhinos #exception
}

#' @export
filter_species <- function(data, species) {
  data |>
    dplyr$filter(Species %in% species)
}
