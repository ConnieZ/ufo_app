# server.R
library(ggvis)
#read in files with data
milbases <- read.csv("data/milbases.csv")
reports <- read.csv("data/ufo_reports.csv")
#merge the data sets based on state
mergeddata <- merge(reports, milbases, by="State")
#server related script
shinyServer(
  function(input, output, session) {
      #input controls
      input_size <- reactive(input$size)
      input_model <- reactive(input$model)
      #create a ggvis plot
      mergeddata %>% 
        ggvis( ~Total, ~UFOReports) %>% 
        layer_points(fill := "blue", size := input_size) %>%
        layer_model_predictions(model = input_model, se = TRUE) %>%
        add_axis("y", title = "Num of UFO Reports", orient = "left", title_offset = 50) %>%
        bind_shiny("ggvis", "ggvis_ui")
            
  }
)