box::use(
  shiny[bootstrapPage, moduleServer, NS, reactive],
)

box::use(
  app/view/table,
  app/view/chart,
  app/logic/data[fetch_data]
)


#' @export
ui <- function(id) {
  ns <- NS(id)
  bootstrapPage(
    table$ui(ns("table")),
    chart$ui(ns("chart"))
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
