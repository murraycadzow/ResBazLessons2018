## Load the Shiny package
library(shiny)

## Load the "cars" data set
data(cars)

ui <- fluidPage(
  
  ## Give the application a title
  headerPanel("My awesome plotting app"),
  
  ## Put the input controls in a sidebar panel
  sidebarPanel(
  
  ## Add a pull-down menu to allow selection of
  ## the variable to be plotted
  selectInput(inputId = "plot_var",
              label = "Variable to plot",
              choices = c("speed", "dist"),
              selected = "speed")
  ),
  
  ## Tell shiny what to plot - the "main_plot" object 
  ## associated with "output" generated
  ## by the server.R file
  mainPanel(
    
    ## Give the panel a name
    h4("Plot of cars data"),
    
    plotOutput(outputId = "main_plot")
  )
  
)

## Create the function to be excuted by shiny 
server <- function(input, output) {
  
  ## Define an object called "main_plot" that will be drawn 
  ## by the "renderPlot" function
  output$main_plot <- renderPlot({
    
    ## Specify the plot that will be generated
    hist(cars[,input$plot_var])
  })
  
}

# Run the application 
shinyApp(ui = ui, server = server)
