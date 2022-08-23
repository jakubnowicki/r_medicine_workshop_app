box::use(
  echarts4r,
  dplyr,
  htmlwidgets[JS],
)

#' @export
chart <- function(data) {
  data |>
    dplyr$group_by(Species) |>
    echarts4r$e_chart(Year) |>
    echarts4r$e_line(Population) |>
    echarts4r$e_x_axis(Year, formatter = JS("App.formatYear")) |>
    echarts4r$e_tooltip()
}
