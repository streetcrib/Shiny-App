library(plotly)
library(colourpicker)
library(ggplot2)
library(gapminder)
library(shinycustomloader)
library(DT)

ui <- fluidPage(
    
    # This is the application header, it's easy.
    titlePanel("Easy Visulizetion through plot-ly and making easier applications"),
    
    # This is for the laying out the side-bars and other important stuff
    sidebarLayout(
        
        # Using side-bars in order to built panils.
        sidebarPanel(
            
            # Using easier options and other things
            textInput("main", "main", "avoid plagiarism"),
            numericInput("main", "main", 1, 1),
            checkboxInput("fi-t", "best fi-t", FALSE),
            colourInput("shades", "shadingg", value = "green"),
            
            
            selectInput("county", "County",
                        choices = c("everything", levels(gapminder$continent))),
            
            sliderInput(inputId = "easy", label = "peasy",
                        min = 0, max = 120,
                        value = c(30, 50)),
            downloadButton("itsdonenow")
            
            
        ),
        
        # This is the outline that one can use
        mainPanel(
            
            # The final outcome using various features and stuff
            tabsetPanel(type = "finals",
                        
                        tabPanel("Plottingmax", withLoader(plotlyOutput("plottingmax")) ),
                        tabPanel("Tabulature", withLoader(DT::dataTableOutput("tabulature")))
                 
                        
            )
            
        )
    )
)
