library(shiny)
library(shinythemes)
library(shinydashboard)
#library(xlsx)
#library(shinyWidgets)

header <- dashboardHeader(title = "Personal Finance")

sideBar <- dashboardSidebar(
              #selectInput("skin","Choose the background colour: ",choices = c("blue","black","purple","green","red","yellow")),
              #thinking----
              sidebarMenu(
                menuItem("Home Page",
                  tabName = "HomePage",
                  icon = icon("home")),
                menuItem("Transactions",
                  tabName = "Transactions",
                  icon = icon("wallet")),
                menuItem("FAQ",
                  tabName = "FAQ",
                  icon = icon("question-circle")),
                menuItem("About",
                  tabName = "About",
                  icon = icon("users")),
                menuSubItem("Source Code",
                  href = "https://stackoverflow.com/questions/55857538/how-to-direct-html-links-to-siderbar-items-in-r-shiny")
    
              )
            )

body <-   dashboardBody(
            tags$head(tags$style(HTML('
                                      .main-header .logo{
                                      font-family: "Georgia",Times,"Times New Roman", serif;
                                      font-weight: bold;
                                      font-size: 20px;
                                      }
                                      '))),
            tabItems(
              tabItem(tabName = "HomePage",
                      fluidRow(
                        column(width = 12,
                          box(
                            title = "World",
                            status = "primary",
                            collapsible = TRUE,
                            width = NULL
                          ),
                          
                          box(
                            title = "Malaysia",
                            background = "maroon",
                            width = NULL
                            
                          )
                          
                        )
                      )
              ),
    
              tabItem(tabName = "Transactions",
                      h3("Type of Cost"),
                      fluidRow(
                        box(
                          title = "Food and Beverage",
                          numericInput("cost1","Cost:",0, min = 0),
                          width = 2,
                          collapsible = TRUE
                        ),
                        
                        box(
                          title = "Transportation",
                          numericInput("cost2","Cost:",0, min = 0),
                          width = 2,
                          collapsible = TRUE
                        ),
                        
                        box(
                          title = "Clothing and Shoes",
                          numericInput("cost3","Cost:",0, min = 0),
                          width = 2,
                          collapsible = TRUE
                        ),
                        
                        box(
                          title = "Sport And Leisure",
                          numericInput("cost4","Cost:",0, min = 0),
                          width = 2,
                          collapsible = TRUE
                        ),
                        
                        box(
                          title = "Groceries",
                          numericInput("cost5","Cost:",0, min = 0),
                          width = 2,
                          collapsible = TRUE
                        )
                        
                      ),
                      fluidRow(
                        box(
                          title = "Entertainment",
                          numericInput("cost6","Cost:",0, min = 0),
                          width = 2,
                          collapsible = TRUE
                        ),
                        
                        box(
                          title = "Utilities",
                          numericInput("cost7","Cost:",0, min = 0),
                          width = 2,
                          collapsible = TRUE
                        ),
                        
                        box(
                          title = "Rent",
                          numericInput("cost8","Cost:",0, min = 0),
                          width = 2,
                          collapsible = TRUE
                        ),
                        
                        box(
                          title = "Others",
                          numericInput("cost9","Cost:",0, min = 0),
                          width = 2,
                          collapsible = TRUE
                        ),
                        actionButton("action","Comfirm")
                        
                      ),
                      
                      fluidRow(
                        tabBox(
                          title = "X",
                          id = "tabset1",
                          width = 12,
                          tabPanel("Pie Chart",plotOutput("pieChart")),
                          tabPanel("Bar Chart",plotOutput("barChart"))
                        )
                      )
                      
              ),
    
              tabItem(tabName = "FAQ",
                      fluidRow(
                        box(
                          title = "First box",
                          height = 100
                        ),
                        
                        box(
                          title = " box",
                          sliderInput("slider","Testing",0,100,50)
                        )
                        
                      )
              ),
    
              tabItem(tabName = "About",
                      fluidRow(
                        column(width = 6,
                               box(
                                 title = "LAI KE WEI",
                                 width = NULL,
                                 background = "teal"
                               ),
                               
                               box(
                                 title = "NAME2",
                                 solidHeader = TRUE,
                                 width = NULL,
                                 status = "success"
                               )
                               
                        ),
                        
                        column(width = 6,
                               box(
                                 title = "NAME3",
                                 solidHeader = TRUE,
                                 width = NULL,
                                 status = "info"
                               ),
                               
                               box(
                                 title = "NAME4",
                                 width = NULL,
                                 background = "blue"
                               )
                               
                        )
                      )
              ),
              tabItem(tabName = "SourceCode",
                      
              )
              
    
            )
          )





ui <- dashboardPage(header,sideBar,body)

server <- function(input, output) {
  
    output$pieChart <- renderPlot({
      if(input$action == 0){
        return() 
      }
      isolate(x <- c(input$cost1,input$cost2,input$cost3,input$cost4,input$cost5,input$cost6,input$cost7,input$cost8,input$cost9))
      isolate(labs <- c("Food and Beverage","Transportation","Clothing And Shoes","Sports And Leisure","Groceries","Entertainment","Utilities","Rent","Others"))
      isolate(piepercent<- round(100*x/sum(x), 1))
      isolate(pie(x,piepercent,main = "Cost Ratio",col = terrain.colors(length(x))))
      isolate(legend("topright",labs, cex = 0.8, fill = terrain.colors(length(x))))
    })
    
    output$barChart <- renderPlot({
      if(input$action == 0){
        return() 
      }
      isolate(x <- c(input$cost1,input$cost2,input$cost3,input$cost4,input$cost5,input$cost6,input$cost7,input$cost8,input$cost9))
      isolate(labs <- c("Food and Beverage","Transportation","Clothing And Shoes","Sports And Leisure","Groceries","Entertainment","Utilities","Rent","Others"))
      isolate(piepercent<- round(100*x/sum(x), 1))
      isolate(pie(x,piepercent,main = "Cost Ratio",col = terrain.colors(length(x))))
      isolate(legend("topright",labs, cex = 0.8, fill = terrain.colors(length(x))))
    })
}

shinyApp(ui = ui, server = server)
