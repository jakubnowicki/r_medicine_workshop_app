box::use(
  shiny[moduleServer, NS, checkboxGroupInput, reactive],
)

box::use(
  app/logic/data[filter_species, species],
)


#' @export
ui <- function(id) {
  ns <- NS(id)
  checkboxGroupInput(
    inputId = ns("species"),
    "Species",
    choices = species,
    selected = species
  )
}

#' @export
server <- function(id, data) {
  moduleServer(id, function(input, output, session) {
    reactive(
      filter_species(data(), input$species)
    )
  })
}
