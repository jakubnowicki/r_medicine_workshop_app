box::use(
  reactable,
)

#' @export
table <- function(data) {
  data |>
    reactable$reactable()
}
