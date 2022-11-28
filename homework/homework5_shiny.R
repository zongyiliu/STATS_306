#
# This is a Shiny web application. You can run the application by clicking
# the 'Run App' button above.
#
# Find out more about building applications with Shiny here:
#
#    http://shiny.rstudio.com/
#

library(shiny)
library(tidyverse)
message(getwd())
load("./homework5_shiny_data.rda")



# Define UI for application that draws a histogram
ui <- fluidPage(

    # Application title
    titlePanel("Congressional Retweets"),

    # Sidebar with a slider input for number of bins 
    sidebarLayout(
        sidebarPanel(
        ),

        # Show a plot of the generated distribution
        mainPanel(
           plotOutput("mainPlot")
        )
    )
)

# Define server logic required to draw a histogram
server <- function(input, output) {

    output$mainPlot <- renderPlot({
      ggplot(retweets_tags, aes(x = party)) + geom_bar()
    })
}

# Run the application 
shinyApp(ui = ui, server = server)
