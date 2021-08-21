library(shiny)

ui <- fluidPage(
    
    # Application title
    titlePanel("Anonymous Covid Survey v1"),
    
    # Sidebar with a slider input for number of bins
    sidebarLayout(
        sidebarPanel(
            htmlOutput("info"),
            tags$head(
                tags$script(src = "coin.js")
            ),
            br(),
            actionButton("btn", "Toss a coin", onclick = "coinTossing();"),
            br(),
            br(),
            br(),
            
            tags$img(id = "anim", src = "stationary_coin.jpg", width = 200)
            
            
    
            
        ),
        
        # Show a plot of the generated distribution
        mainPanel(
            htmlOutput("infoU"),
            
            
            br(),
            selectInput("question", "Have you broken any covid rules in the last week?",
                        c("YES","NO")),
            br(),
            br(),
            br(),
            
            htmlOutput("infoL"),
            br(),
            
            actionButton("submit", "Submit Response"),
            htmlOutput("infoD")

        )
    )    

)

server <- function(input, output, session){
    output$info<- renderText({
        c("<h3>Instructions:</h3>",
          "1. Flip a coin either with the button below or <b>a physical coin!</b>",
          "<br>",
          "2. If heads answer truthfully.",
          "<br>",
          "3. If tails answer YES",
          "<br>",
          "In the aggregate, responses will inform the Australian government without implicating you because your YES could simply be from a toss of the coin"
          )})
    
    output$infoL<- renderText({
        #c("We promise you will not be implicated by your response in this survey.")
    })
    
    output$infoU<- renderText({
        c("<h3> Survey Question</h3>")
    })
    
    observeEvent(input$submit,{
        output$infoD<- renderText({
            c("<p style=\"color:#FF0000\";>Thank you! Your response has been submitted.</p>")
        })
    })

        
}

shinyApp(ui, server)

