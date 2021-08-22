#
# This is a Shiny web application. You can run the application by clicking
# the 'Run App' button above.
#
# Find out more about building applications with Shiny here:
#
#    http://shiny.rstudio.com/
#

library(shiny)
source("my_functions.R")

# Define UI for application that draws a histogram
ui <- fluidPage(

    # Application title
    titlePanel("Anonymous Covid Survey v2"),
    # Sidebar with a slider input for number of bins 
    sidebarLayout(
        sidebarPanel(
            selectInput("userA_response", "Did you break lockdown in the last week?", c("YES","NO")),
            actionButton("randomise", "Randomise"),
            br(),
            br(),
            
            htmlOutput("userA_polynomial"),
            br(),
            br(),
            br(),
            selectInput("visibility", "Visibility", c("What you see","What User B sees","What User C sees","Combined Visibility","Summed Polynomial")),
            br(),
            br(),
            htmlOutput("explanation")
        ),
        
        mainPanel(
           plotOutput("distPlot"),
           br()
        )
    ),
    fluidRow(column(width=2, 
                    br(),
                    actionButton("btn", "REVEAL"),
                    br(),
                    uiOutput("coin")))
    
)

# Define server logic required to draw a histogram
server <- function(input, output) {
    polynomial_A<-reactiveVal(c(1,-5,6))
    polynomial_B<-reactiveVal(c(1,-4,1))
    polynomial_C<-reactiveVal(c(0.5,0.5,0))
    X<-c(0,1,2,3)
    
    #animation
    vals <- reactiveValues(img = "blank.jpg",
                           flag = FALSE,
                           started = FALSE)
    
    observeEvent(input$btn, {
        vals$flag <- TRUE
        vals$started<-TRUE
        if (vals$flag) vals$img <- "smoke.gif"
        
    })
    
    observe({
        input$btn
        if (isolate(vals$flag)) {
            vals$flag <- FALSE
            invalidateLater(1000)
        } else if (!isolate(vals$started)){
            
            }else {
            vals$img <- if (input$userA_response =="YES") "bad_2_good_1.jpg" else "bad_1_good_2.jpg" 
        }
    })
    
    output$coin <- renderUI({
        tags$div(
            tags$img(id = "anim", src = vals$img, width = 800)
        )
    })
    
    #logic
    
    output$distPlot <- renderPlot({
        # generate bins based on input$bins from ui.R
        x <-seq(0,3,0.01)
        ylim = c(
            min(c(polynomial(polynomial_A(),0:3),polynomial(polynomial_B(),0:3),polynomial(polynomial_C(),0:3))),
            max(c(polynomial(polynomial_A(),0:3),polynomial(polynomial_B(),0:3),polynomial(polynomial_C(),0:3)))
            )
        if (input$visibility =="What you see"){
            ys =cbind(polynomial(polynomial_A(),x))
            matplot(x,ys ,type = 'l',col = c("red"),lwd = 2,ylim = ylim,main = "Participants polynomials",ylab = "y")
            points(1, polynomial(polynomial_A(),1),col = "red",lwd = 4)
            points(1, polynomial(polynomial_B(),1),col = "green",lwd = 4)
            points(1, polynomial(polynomial_C(),1),col = "blue",lwd = 4)
            
            
        } else if (input$visibility =="What User B sees"){
            ys =cbind(polynomial(polynomial_B(),x))
            matplot(x,ys ,type = 'l',col = c("green"),lwd = 2,ylim = ylim,main = "Participants polynomials",ylab = "y")
            points(2, polynomial(polynomial_A(),2),col = "red",lwd = 4)
            points(2, polynomial(polynomial_B(),2),col = "green",lwd = 4)
            points(2, polynomial(polynomial_C(),2),col = "blue",lwd = 4)            
            
        } else if (input$visibility =="What User C sees"){
            ys =cbind(polynomial(polynomial_C(),x))
            matplot(x,ys ,type = 'l',col = c("blue"),lwd = 2,ylim = ylim,main = "Participants polynomials",ylab = "y")
            points(3, polynomial(polynomial_A(),3),col = "red",lwd = 4)
            points(3, polynomial(polynomial_B(),3),col = "green",lwd = 4)                  
            points(3, polynomial(polynomial_C(),3),col = "blue",lwd = 4)
            
        } else if (input$visibility =="Combined Visibility"){
            ys =cbind(polynomial(polynomial_A(),x),polynomial(polynomial_B(),x),polynomial(polynomial_C(),x))
            matplot(x,ys ,type = 'l',col = c("red","green","blue"),lwd = c(6,2,2),main = "Participants polynomials",ylab = "y")
            points(3, polynomial(polynomial_A(),3),col = "red",lwd = 4)
            points(3, polynomial(polynomial_B(),3),col = "green",lwd = 4)                  
            points(3, polynomial(polynomial_C(),3),col = "blue",lwd = 4)
            points(2, polynomial(polynomial_A(),2),col = "red",lwd = 4)
            points(2, polynomial(polynomial_B(),2),col = "green",lwd = 4)
            points(2, polynomial(polynomial_C(),2),col = "blue",lwd = 4)
            points(1, polynomial(polynomial_A(),1),col = "red",lwd = 4)
            points(1, polynomial(polynomial_B(),1),col = "green",lwd = 4)
            points(1, polynomial(polynomial_C(),1),col = "blue",lwd = 4)
            #total
            points(1, polynomial(polynomial_A()+polynomial_B()+polynomial_C(),1),col = "orange",lwd = 4)
            points(2, polynomial(polynomial_A()+polynomial_B()+polynomial_C(),2),col = "orange",lwd = 4)
            points(3, polynomial(polynomial_A()+polynomial_B()+polynomial_C(),3),col = "orange",lwd = 4)
        } else{
            ys =cbind(polynomial(polynomial_A(),x),polynomial(polynomial_B(),x),polynomial(polynomial_C(),x),polynomial(polynomial_A()+polynomial_B()+polynomial_C(),x))
            matplot(x,ys ,type = 'l',col = c("red","green","blue","orange"),lwd = c(6,2,2,4),main = "Participants Polynomials",ylab = "y")
            
        }
        abline(v=0,col = "orange",lty = "dotted")
        abline(v=1,col = "red",lty = "dotted")
        abline(v=2,col = "green",lty = "dotted")
        abline(v=3,col = "blue",lty ="dotted")
    })
    toListen <- reactive({
        list(input$randomise,input$userA_response)
    })
    observeEvent(toListen(),{
        polynomial_A(
            c(runif(2,-1,0.5),if (input$userA_response=="YES") 1 else 0)
        )
    })
    observeEvent(input$visibility,{
        if (input$visibility =="What you see"){
            output$explanation<- renderText({
                c("You only know your own polynomial as well as the polynomials of other participants evaluated at x = 1"
                )})
            
        } else if (input$visibility =="What User B sees"){
            output$explanation<- renderText({
                c("User B only knows their own polynomial as well as the polynomials of other participants evaluated at x = 2"
                )})
        } else if (input$visibility =="What User C sees"){
            output$explanation<- renderText({
                c("User C only knows their own polynomial as well as the polynomials of other participants evaluated at x = 3"
                )})
        } else if (input$visibility =="Combined Visibility"){
            output$explanation<- renderText({
                c("By summing A(1) + B(1) + C(1) you know f(1).",
                  "<br>",
                  "By summing A(2) + B(2) + C(2) User B knows f(2).",
                  "<br>",
                  "By summing A(3) + B(3) + C(3) User C knows f(3)."
                )})
        } else{
            output$explanation<- renderText({
                c("Now we apply Lagrangian polynomial interpolation on f(1), f(2), f(3) to get f(x). This lets us find f(0)."
                )})
        }
    })
    
    output$userA_polynomial<- renderText({
        c("<b>Your polynomial: </b>",
          "<br>",
          print_polynomial(polynomial_A()),
          "<br>",
          "<br>",
          
          "<b>f(x) = A(x)+B(x)+C(x)</b>"
        )})

    
    
}

# Run the application 
shinyApp(ui = ui, server = server)
