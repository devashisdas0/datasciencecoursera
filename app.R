library(shiny)

ui <- fluidPage(
  titlePanel("Dynamic Histogram for Plant Data"),
  
  sidebarLayout(

    sidebarPanel(
      p("To see the histogram of plants in granular detail, slide the bar below"),
      # Input: Slider
      sliderInput(inputId = "bins",
                  label = "Number of bins:",
                  min = 1,
                  max = 20,
                  value = 10)
      
    ),

    mainPanel(

      plotOutput(outputId = "distPlot")
      
    )
  )
)


server <- function(input, output) {

  output$distPlot <- renderPlot({
    
    x    <- PlantGrowth$weight
    bins <- seq(min(x), max(x), length.out = input$bins + 1)
    
    hist(x, breaks = bins, col = "#228B22", border = "yellow",
         xlab = "Plant Weight",
         main = "Histogram of Plant Weights")
    
  })
  
}

shinyApp(ui = ui, server = server)