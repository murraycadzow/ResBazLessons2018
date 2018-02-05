## Load the Shiny package
library(shiny)

## Load the "cars" data set
data(cars)

ui <- fluidPage(
  
    ## Tell shiny what to plot - the "main_plot" object 
    ## associated with "output" generated
    ## by the server.R file
    mainPanel(
      plotOutput(outputId = "main_plot")
    )

)

## Create the function to be excuted by shiny 
server <- function(input, output) {
  
  ## Define an object called "main_plot" that will be drawn 
  ## by the "renderPlot" function
  output$main_plot <- renderPlot({
    
    ## Specify the plot that will be generated
    hist(cars[,"speed"])
  })
  
}

# Run the application 
shinyApp(ui = ui, server = server)

