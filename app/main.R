box::use(
  shiny[bootstrapPage, moduleServer, NS, reactive, div, titlePanel],
)

box::use(
  app/view/table,
  app/view/chart,
  app/logic/data[fetch_data]
)

grid <- function(...) div(class = "grid", ...)
card <- function(...) div(class = "card", ...)

#' @export
ui <- function(id) {
  ns <- NS(id)
  bootstrapPage(
    titlePanel("Rhino population over time"),
    grid(
      card(table$ui(ns("table"))),
      card(chart$ui(ns("chart")))
    )
  )
}

#' @export
server <- function(id) {
  moduleServer(id, function(input, output, session) {
    data <- reactive(fetch_data())
    table$server("table", data)
    chart$server("chart", data)
  })
}
