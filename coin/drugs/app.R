#
# This is a Shiny web application. You can run the application by clicking
# the 'Run App' button above.
#
# Find out more about building applications with Shiny here:
#
#    http://shiny.rstudio.com/
#

library(shiny)
library(ggplot2)
source("simul.R")
# Define UI for application that draws a histogram
ui <- fluidPage(

    # Application title
    titlePanel("Simulated Randomised Response surveys on Vic Drugs Dataset"),

    # Sidebar with a slider input for number of bins 
    sidebarLayout(
        sidebarPanel(
            selectInput("school_selection", "Select a school",
                        ""),
            sliderInput("samples", label = "Sample Size:",
                        min = 50, max = 1000, value = 100, step = 50)
        ),

        # Show a plot of the generated distribution
        mainPanel(
           actionButton("simulate", "Simulate"),
           plotOutput("distPlot"),
           
        )
    )
)



# Define server logic required to draw a histogram
server <- function(input, output,session) {
    df<-read.csv("schools2.csv")
    
    updateSelectInput(session, "school_selection", choices = df$DHS_AREA)  
    
    observeEvent(input$simulate,{
        output$distPlot <- renderPlot({
            students <-df[which(df$DHS_AREA ==input$school_selection),"students"]
            yes<-df[which(df$DHS_AREA ==input$school_selection),"yes"]
            simulations<-simulate_N(yes/students,isolate(input$samples))
            hist(simulations,ylab = "frequency",xlab = "prediction from survey",main = paste("1000 Simulations of Randomised response surveys in",input$school_selection))
            abline(v=yes/students, col="red")
            abline(v=quantile(simulations,0.025), col="green",lty = 2)
            abline(v=quantile(simulations,0.975), col="green",lty = 2)
            legend("left", legend = c("ground truth","95% of simulations"), col = c("red","green"), lty=1:2, cex=0.8)
            
        })
    })

}

# Run the application 
shinyApp(ui = ui, server = server)
