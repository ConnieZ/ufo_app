# ui.R
library(ggvis)
shinyUI(fluidPage(
  titlePanel("UFO Reports"),
  
  sidebarLayout(
    sidebarPanel(
      helpText("See the number of UFO reports in relation to 
               the number of military bases by state (USA)."),
      #input controls
      sliderInput("size", label = "Point Size",min = 10, max = 100, value = 20),
      selectInput("model", label = "Model type", 
                     choices = c("Linear" = "lm", "LOESS" = "loess"),
                     selected = "lm"),
      #ggvis ui
      uiOutput("ggvis_ui")
      
      
    ),
    
    mainPanel(
      #show the ggvis plot in the main plot
      ggvisOutput('ggvis'))
    
  )
))