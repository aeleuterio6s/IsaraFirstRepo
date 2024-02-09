library(shiny)

# Define a UI para o aplicativo Shiny
ui <- fluidPage(
  titlePanel("Calculateur de Moyenne"),
  
  sidebarLayout(
    sidebarPanel(
      textInput("numbers", "Entrez les nombres séparés par des virgules:"),
      actionButton("calculate", "Calculer"),
      verbatimTextOutput("result")
    ),
    
    mainPanel()
  )
)

# Define o servidor para o aplicativo Shiny
server <- function(input, output) {
  
  observeEvent(input$calculate, {
    # Obtenir les nombres entrés en tant que chaîne de caractères
    numbers <- input$numbers
    
    # Séparer la chaîne en nombres individuels
    numbers <- as.numeric(unlist(strsplit(numbers, ",")))
    
    # Calculer la moyenne des nombres
    result <- mean(numbers, na.rm = TRUE)
    
    # Afficher le résultat
    output$result <- renderPrint({
      if (is.nan(result)) {
        "Veuillez entrer des nombres valides."
      } else {
        paste("La moyenne est :", result)
      }
    })
  })
}

# Créer l'application Shiny
shinyApp(ui = ui, server = server)
