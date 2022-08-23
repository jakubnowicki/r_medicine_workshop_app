box::use(
  shiny[moduleServer, NS, validate, need],
  echarts4r[echarts4rOutput, renderEcharts4r],
)

box::use(
  app/logic/chart[chart]
)

#' @export
ui <- function(id) {
  ns <- NS(id)
  echarts4rOutput(ns("chart"))
}

#' @export
server <- function(id, data) {
  moduleServer(id, function(input, output, session) {
    output$chart <- renderEcharts4r({
      validate(
        need(nrow(data()) > 0, "Select some species to see the chart")
      )
      chart(data())
    })
  })
}
