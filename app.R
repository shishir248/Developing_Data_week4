library(shiny)
library(plotly)
library(dplyr)
library(tidyverse)

ui_App <- fluidPage(
    #For the title of the page
    titlePanel("Air Passenger no. travelling between 2009-2018"),
    
    
    column(5, h4("Choose year"),
           selectInput("noPassenger", "Number of Passengers in year:", c(2009:2018))),
    
    mainPanel(
        #Our output for the plot
        plotOutput("number") 
    )
)


Air<-dataset #Reading data
x<-c(1,2,3,4,5,6,7,8,9,10,11,12) #Creating x axis


server_App <- function(input, output,session){
    
    
    output$number<-renderPlot({
        z<-(as.integer(input$noPassenger)-2007)*12-11 
        y<-(as.integer(input$noPassenger)-2007)*12
        
        plot(x,Air[z:y,1],type="l",main=paste("No of Travellers in",input$noPassenger, sep=" "), 
             xlab = "Month", ylab=" No. of Passengers ")
        
        axis(side=1,1:12,cex.axis=1)
    })  
    
}

shinyApp(ui = ui_App, server = server_App)