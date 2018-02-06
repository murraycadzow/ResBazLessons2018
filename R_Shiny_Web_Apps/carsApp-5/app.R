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
                selected = "speed"),
    
    ## Add a conditionalPanel containing the slider - define it as "condition 1"
    conditionalPanel(condition="input.conditionedPanels==1",
                     sliderInput(inputId = "nbins",
                                 label = "Number of bins",
                                 min=2,
                                 max=15,
                                 value=10,
                                 round=TRUE)
    )
  ),
  
  ## Tell shiny what to plot - the "main_plot" object 
  ## associated with "output" generated
  ## by the server.R file
  mainPanel(
    
    ## Add tabs
    tabsetPanel(
      
      ## Define a tab for the histogram
      tabPanel(
        h4("Plot of cars data"),
        plotOutput(outputId = "main_plot")
        
        ## Define the value of this tab
        , value=1
      ),
      
      ## And a tab for the boxplot
      tabPanel(
        h4("Boxplot of cars data"),
        plotOutput(outputId = "second_plot")
      )
      ## Name the panel to correspond to the codition defined in sidebarPanel
      , id = "conditionedPanels"
      
    )
  )
)

## Create the function to be excuted by shiny 
server <- function(input, output) {
  
  ## Define an object called "main_plot" that will be drawn 
  ## by the "renderPlot" function
  output$main_plot <- renderPlot({
    
    ## Specify the plot that will be generated
    hist(cars[,input$plot_var], breaks = input$nbins)  
  })
  
  ## Define a second plot
  output$second_plot <- renderPlot({
    
    ## Specify the plot that will be generated
    boxplot(cars[,input$plot_var])
  })
  
}

# Run the application 
shinyApp(ui = ui, server = server)
