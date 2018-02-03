shinyUI(pageWithSidebar(
  
  ## Give the application a title
  headerPanel("My awesome plotting app"),
  
  ## Put the input controls in a sidebar 
  sidebarPanel(
    
    selectInput(inputId = "plot_var",
                label = "Variable to plot",
                choices = c("speed", "dist"),
                selected = "speed"),
    
    conditionalPanel(condition="input.conditionedPanels==1",
                     sliderInput(inputId = "nbins",
                                 label = "Number of bins",
                                 min=2,
                                 max=15,
                                 value=10,
                                 round=TRUE)
    )
  ),
  
  ## Put the outout in the main panel
  mainPanel(
    
    ## Add tabs
    tabsetPanel(
      
      ## Define a tab for the histogram
      tabPanel(
        ## Give the panel a name
        h4("Histogram of cars data"),
        ## Plot stuff
        plotOutput(outputId = "main_plot")
        ,value=1
      ),
        
      tabPanel( 
        ## Give the panel a name
        h4("Boxplot of cars data"),
        ## Plot stuff
        plotOutput(outputId = "second_plot")
        ,value=0
      )
    ,id="conditionedPanels")
  )
))