library(shiny)
library(shinythemes)
library(shinydashboard)
library(dplyr)
library(ggplot2)
library(DT)
library(xlsx)
library(dashboardthemes)
library(shinyjs)
library(tidyr)
library(tibble)
library(plotly)

#header----
header <- dashboardHeader(title = "Personal Finance")
#sideBar----
sideBar <- dashboardSidebar(
  shinyDashboardThemes(
    #blue_gradient
    #flat_red
    #grey_light
    #grey_dark
    #onenote
    #poor_mans_flatly
    #purple_gradient
    theme = "flat_red"
  ),
  sidebarMenu(
    menuItem("Home Page",
             tabName = "HomePage",
             icon = icon("home")),
    menuItem("Transactions",
             tabName = "Transactions",
             icon = icon("wallet"),
             menuSubItem("Expenses",tabName = "Expenses"),
             menuSubItem("Income",tabName = "Income"),
             menuSubItem("Analysis",tabName = "MultipleFile")),
    menuItem("Instructions",
             tabName = "Instructions",
             icon = icon("question-circle")),
    menuItem("About",
             tabName = "About",
             icon = icon("users")),
    menuSubItem("Source Code",
                href = "https://github.com/WEI-728/introdatascience/blob/main/dashboard/app.R"),
    menuItem("CPI Data",tabName = "CPIData",icon = icon("table"))
  )
)
#body----
body <-   dashboardBody(
  useShinyjs(),
  tags$head(tags$style(HTML('
                                      .main-header .logo{
                                      font-family: "Georgia",Times,"Times New Roman", serif;
                                      font-weight: bold;
                                      font-size: 20px;
                                      }
                                      '))),
  ##homepage----            
  tabItems(
    tabItem(tabName = "HomePage",
            fluidRow(
              column(width = 12,
                     box(
                       title = "World",
                       status = "primary",
                       solidHeader = TRUE,
                       collapsible = TRUE,
                       width = NULL,
                       h4("Since early 2019, an unexpected pandemic of Covid-19 has hit every country's economy."),
                       br(),
                       h4("As one of the most influencing countries globally, the US government has started printing money to release its economic stress."),
                       p("All-in money printing totally is 13 trillion. There are 5.2 trillion for COVID and 4.5 trillion for quantitative easing, and 3 trillion for infrastructure. And this behavior has caused significant inflation, even global-wise."),
                       br(),
                       h4("In 2019, the inflation rate in the US was 2.3%. In 2020 this number decreased to 1.4%. Last year, this number was shockingly 7%, the highest since 1982. One way to understand this is the price for everything has increased by 7%, including those necessities. Like the consumer price index, the Inflation rate is defined as the change in the costs of a basket of goods and services that specific groups of households typically purchase. A higher inflation rate means a household needs to pay more for the same goods before."),
                       br(),
                       h4("Typically, a high inflation rate means the economy is expanding. Unfortunately, that is not what's happening around the world. Economists are now worried about potential stagflation in which people get less money, and everything becomes more expensive."),
                       br(),
                       tags$img(src = 'USLabor.png',height = "500px"),
                       helpText("chart from https://tradingeconomics.com/united-states/inflation-cpi"),
                       br(),
                       h4("Across the ocean on the other side of the world, China has encountered continuous lockdown measures to avoid the spread of coronavirus, an effective way to contain the outbreak but damage the economy. The market for young graduates in the labour market is extremely tough."),
                       p(" Compared to 2019, 350k more graduates are looking for a job."),
                       h4("In the meantime, China's annual inflation rate fell to 1.5% in December 2021 from a 15-month high of 2.3% a month earlier. It was caused by a series of governments decisions to secure supply and the reimposition of lockdown measures in some regions since the Omicron strain spread rapidly."),
                       br(),
                       h4("One of the issues China is facing now is that after a series of lockdowns. People have no need to consume because everything is in lockdown. Except for their everyday spending, If no one buys, then the factory has no order to produce and leading to a deflation scenario."),
                       br(),
                       h4("All of the information above proves one thing. That is the importance of cost managing. It's not saying that saving money is the optimal choice. A high inflation rate will cause the cash to be less and less valuable."),
                       br(),
                       tags$img(src = 'China.png',height = "500px"),
                       helpText("chart from https://tradingeconomics.com/china/inflation-cpi"),
                       br(),
                       plotlyOutput("World",height = "700px"),
                       helpText("CPI index is the index that show the changes of the price")
                     ),
                     
                     box(
                       tags$head(tags$style(('
                                      p{
                                      font-weight: bold;
                                      font-size: 18px;
                                      }
                                      '))),
                       title = "Malaysia",
                       status = "warning",
                       solidHeader = TRUE,
                       collapsible = TRUE,
                       collapsed = TRUE,
                       h4("Nowadays, doing personal finance is very important to everyone. The prices continued to rise, but the salary has not increased. Therefore, We have to plan our expenses carefully to prevent us be in debt. "),
                       br(),
                       p("According to the Department of Statistics Malaysia, the starting salary of the fresh graduate of bachelor degree decreased from RM2000-2500 to about RM1000-1500 in 2020."),
                       br(),
                       h4("Someone may say that the decrement is due to the pandemic of Covid-19. Well, we can also prove that using the data before 2020."),
                       br(),
                       p("The statistics from the Central Bank of Malaysia also showed that the salaries of bachelor's degree graduates decreased from RM1993 in 2010 to RM1983 in 2018. For graduates of Diploma, their salaries decreased from RM1458 in 2010 to RM1376 in 2018. Worst for Master graduates, from RM 2923 in 2010 to RM 2707 in 2018."),
                       h4("Due to the \"stable\" salary, the prices of the goods and services that keep increasing make more people live in anxiety and depression."),
                       br(),
                       p("CPI Index (Consumer Price Index)"),
                       br(),
                       h4("CPI index is the index that measured by changes in the price of the goods and services in that market basket.The higher the CPI Index means the higher the price compared to the base(100). The graph below also show the continuous increment of the index from 1960 to 2005."),
                       p("In 2017, the CPI index was 119.6, 2018 was 120.7, 2019 was 121.5 and until 2021, it had already come to 122.7."),
                       plotlyOutput("line",height = "700px"),
                       h4("Since we cannot change the environment, making changes to our behavior will give great help. It's never too late to change but afraid of not changing. "),
                       p("Start managing your cost today; it definitely will bring a significant effect on your future."),
                       width = NULL
                       
                     ),
                     box(
                       title = "Common Way to start deposit",
                       background = "teal",
                       solidHeader = TRUE,
                       collapsible = TRUE,
                       collapsed = TRUE,
                       width = NULL,
                       column(width = 4,
                              h4("1. Theory 5-3-2"),
                              h4("2. Theory 1-3-6"),
                              h4("3. Theory 3-3-3"),
                              h4("4. Multiple Bank Account"),
                              h4("5. Theory 365"),
                              h4("6. Piggybank")
                              ),
                       column(width = 8,
                              h4("Well, may be some one who knows these theory will find out that these 6 ways are similar."),
                              h4("Yes, They are actually having the similar concept - budget your expenses by a certain ratio. We all have to know that no such easiest way to saving our money without self-disciplin."),
                              br(),
                              h4("First theory, 5-3-2 means out of 100% income, 50% will be the expenses, 30% savings and 20% for investment or entertainment purpose."),
                              h4("Theory 1-3-6 is 60% for all kind of expenses, 30% savings and 10% will be the emergency fund"),
                              h4("The 3-3-3 theory is just equally divided your income to 3 parts, Investment, Savings and Expenses, This methods is good for the begineers, it is the simplest way since we don't need to think too complicated. However, dividing income equally is unrealistic for most people. Therefore, after some time, we can change into theory 1-3-6 and 5-3-2 depends on your own situation"),
                              h4("Multiple Bank Account is the step continued from previous theory. In most of the case, people cannot control themselves if their money are just beside them. Put them into different bank account according your plan. Whenever you want to purchase something, the process that login to bank account, keyin the password and so on may make you calm down and finally prevent impulse purchase."),
                              br(),
                              h4("Theory 365 and Piggybank are different because they don't set a ratio for the income. I think the name 'Theory 365' already showed that this is a yearly saving plan, which saving 1 dollar in day1, 2 dollar in day2,...,365 dollar in day 365. However, most people will give up during day 200-300, so there is another suggestion that we make this a monthly cycle or weekly cycle depending your ability."),
                              h4("Finally, the piggy, in this theory, it only ask us to save to coin, when you get a coin, just put it into the piggybank. May be someone will say that what can the coin do, it can't ever buy a bottle of water. Change your mind, many a little makes a mickle, the coin will eventually become a large amount of money you never think before. It is not suitable for those always use e-wallet or online banking as payment methods, but it still good to know so that when you have a coin, even 5 cent, you can put into your small little piggy.")
                              )
                       
                     )
                     
              )
            )
    ),
    #Expenses----    
    tabItem(tabName = "Expenses",
            h3("Type of Expenses"),
            fluidRow(
              box(
                title = "Renting/Housing",
                numericInput("cost1","Cost:",0, min = 0),
                width = 2,
                collapsible = TRUE
              ),
              
              box(
                title = "Regular Payments",
                numericInput("cost2","Cost:",0, min = 0),
                width = 2,
                collapsible = TRUE
              ),
              
              box(
                title = "Food and Beverage",
                numericInput("cost3","Cost:",0, min = 0),
                width = 2,
                collapsible = TRUE
              ),
              
              box(
                title = "Personal Expenses",
                numericInput("cost4","Cost:",0, min = 0),
                width = 2,
                collapsible = TRUE
              ),
              
              box(
                title = "Transportation",
                numericInput("cost5","Cost:",0, min = 0),
                width = 2,
                collapsible = TRUE
              ),
              
              box(
                title = "Miscellaneous",
                numericInput("cost6","Cost:",0, min = 0),
                width = 2,
                collapsible = TRUE
              )
              
            ),
            fluidRow(
              column(width = 8,
                     actionButton("action","Comfirm")
              ),
              column(width = 4,
                     textOutput("totalSpend"))
            ),
            p(),
            fluidRow(
              tabBox(
                title = "X",
                id = "tabset1",
                width = 12,
                tabPanel("Pie Chart",plotOutput("pieChart",height = "800px")),
                tabPanel("Bar Chart",plotOutput("barChart",height = "800px"))
              )
            )
            
    ),
    #income----              
    tabItem(tabName = "Income",
            h3("Type of Income"),
            fluidRow(
              column(width = 4,
                     h4("Active Income:"),
                     box(
                       title = "Wages / Salary",
                       numericInput("income1","Amount:",0, min = 0),
                       width = NULL,
                       collapsible = TRUE
                     ),
                     
                     box(
                       title = "Commission / Tips",
                       numericInput("income2","Amount:",0, min = 0),
                       width = NULL,
                       collapsible = TRUE
                     ),
                     
                     box(
                       title = "Selling",
                       numericInput("income3","Amount:",0, min = 0),
                       width = NULL,
                       collapsible = TRUE
                     )
              ),
              column(width = 4,
                     h4("Portfolio Income"),
                     box(
                       title = "Investments",
                       numericInput("income4","Amount:",0, min = 0),
                       width = NULL,
                       collapsible = TRUE
                     ),
                     
                     box(
                       title = "Dividens / Interest",
                       numericInput("income5","Amount:",0, min = 0),
                       width = NULL,
                       collapsible = TRUE
                     ),
                     box(
                       title = "Others",
                       numericInput("income6","Amount:",0, min = 0),
                       width = NULL,
                       collapsible = TRUE
                     )
                     
              ),
              
              column(width = 4,
                     h4("Passive Income"),
                     box(
                       title = "Royalties",
                       numericInput("income7","Amount:",0, min = 0),
                       width = NULL,
                       collapsible = TRUE
                     ),
                     
                     box(
                       title = "Renting",
                       numericInput("income8","Amount:",0, min = 0),
                       width = NULL,
                       collapsible = TRUE
                     ),
                     actionButton("action2","Comfirm"),
                     br(),
                     textOutput("totalIncome")
              )
            ),
            fluidRow(
              tabBox(
                title = "Y",
                id = "tabset2",
                width = 12,
                tabPanel("Pie Chart",plotOutput("pieChart2",height = "800px")),
                tabPanel("Bar Chart",plotOutput("barChart2",height = "800px"))
              )
            )
            
    ),
    #Multiple File----              
    tabItem(tabName = "MultipleFile",
            fluidRow(
              box(
                fileInput("MultiExcel","Upload the Excel file:",accept = ".xlsx", multiple = T),
                helpText("Max file size is 5 MB"),
                helpText("Max number of file is 12 (January to December)"),
                h5(helpText("Please use the template provided!!! To get template:"),a("Click Here",href = "https://stackoverflow.com/questions/33200383/fileinput-how-to-create-a-dataframe-from-a-xlsx-file-within-shiny"))
              ),
              tabBox(title = "Z",
                     id = "tabset3",
                     width = 12,
                     tabPanel("Table",
                              column(width = 3, radioButtons("incomeDataTable","For income, Show:",choices = c("Actual","Budget","Both"),selected = "Both")),
                              column(width = 3, radioButtons("expensesDataTable","For expenses, Show:",choices = c("Actual","Budget","Both"),selected = "Both")),
                              column(width = 3, radioButtons("savingDataTable","For saving, Show:",choices = c("Actual","Budget","Both"),selected = "Both")),
                              dataTableOutput("incomeTable2"),
                              br(),
                              dataTableOutput("expensesTable2"),
                              br(),
                              dataTableOutput("savingTable2"),
                              br(),
                              disabled(downloadButton("download","Download"))
                     ),
                     tabPanel("Summary",
                              fluidRow(
                                column(width = 3,
                                       radioButtons("Criteria1",
                                                    "Show:",
                                                    choices = c("Total Income","Total Expenses","Total Saving"),
                                                    selected = "Total Saving")
                                ),
                                column(width = 3,
                                       radioButtons("Criteria5",
                                                    "Show:",
                                                    choices = c("Actual","Budget"),
                                                    selected = "Actual")
                                )
                              ),
                              plotlyOutput("Chart6",
                                           height = "700px"),
                              fluidRow(
                                column(width = 4,
                                       htmlOutput("summary")
                                ),
                                column(width = 4,
                                       htmlOutput("summary2")
                                ),
                                column(width = 4,
                                       htmlOutput("summary3")
                                )
                              )
                     ),
                     tabPanel("Details",
                              
                              fluidRow(
                                column(width = 3,
                                       radioButtons("chartType2",
                                                    "Type of Chart:",
                                                    choices = c("Pie","Stacked Bar"),
                                                    selected = "Stacked Bar")
                                ),
                                column(width = 3,
                                       radioButtons("Criteria2",
                                                    "Show:",
                                                    choices = c("Actual","Budget"),
                                                    selected = "Actual")
                                ),
                                column(width = 3,
                                       radioButtons("Label",
                                                    "X-axis:",
                                                    choices = c("Month","Type"),
                                                    selected = "Month")
                                       
                                ),
                                column(width = 3,
                                       radioButtons("Label3",
                                                    "Label:",
                                                    choices = c("Yes","No"),
                                                    selected = "Yes")
                                       
                                )
                              ),
                              
                              plotOutput("Chart3",
                                         height = "700px"),
                              
                              fluidRow(
                                column(width = 3,
                                       radioButtons("chartType3",
                                                    "Type of Chart:",
                                                    choices = c("Pie","Stacked Bar"),
                                                    selected = "Stacked Bar")
                                ),
                                column(width = 3,
                                       radioButtons("Criteria3",
                                                    "Show:",
                                                    choices = c("Actual","Budget"),
                                                    selected = "Actual")
                                ),
                                column(width = 3,
                                       radioButtons("Label2",
                                                    "X-axis:",
                                                    choices = c("Month","Type"),
                                                    selected = "Month")
                                ),
                                column(width = 3,
                                       radioButtons("Label4",
                                                    "Label:",
                                                    choices = c("Yes","No"),
                                                    selected = "Yes")
                                )
                                
                              ),
                              
                              plotOutput("Chart4",
                                         height = "700px"),
                              
                              fluidRow(
                                column(width = 3,
                                       radioButtons("chartType4",
                                                    "Type of Chart:",
                                                    choices = c("Pie","Stacked Bar"),
                                                    selected = "Stacked Bar")
                                ),
                                column(width = 3,
                                       radioButtons("Criteria4",
                                                    "Show:",
                                                    choices = c("Actual","Budget"),
                                                    selected = "Actual")
                                )
                                
                              ),
                              
                              plotOutput("Chart5",
                                         height = "700px")
                              
                              
                     ),
              )
              
              
              
            )
    ),
    #Instruction----    
    tabItem(tabName = "Instructions",
            p("Please READ the Instruction Before Using This App!!!"),
            h5("The instructions page consists of 7 boxs, 6 of them are the guideline to use this Personal Finance Dashboard and the last one is the guideline to use the Excel Template for the Multiple File Analysis"),
            h5("Please read carefully especially for the Analysis - Multiple File and the Excel File"),
    
            br(),
            fluidRow(
              box(width = 12,
                  color = "yellow",
                  title = "Personal Finance Dashboard (Home Page)",
                  status = "primary",
                  collapsible = TRUE,
                  collapsed = TRUE,
                  column(width = 4,
                         tags$img(src = 'sidebar-homepage.png',height = "200px",width = "400px"),
                         h5("The home page is the main web page of this Pesonal Finance Dashboard."),
                         h5("It have 3 box which contains the paragraph about the reason of doing personal finance."),
                         h5("The first box is World, describing the overall situation of the financial problem of the world, next is Malaysia, telling the specific situation occured in Malaysia while the last is common ways to start deposit."),
                         h5("If you are interested, feel free to make a look, it won't take you a long time.")
                  ),
                  column(width = 8,
                         tags$img(src = 'home_page.png',height = "400px",width = "800px")
                         
                  ),
                  
              )
            ),
            fluidRow(
              box(width = 12,
                  title = "Personal Finance Dashboard (Transactions: Expenses)",
                  status = "primary",
                  collapsible = TRUE,
                  collapsed = TRUE,
                  column(width = 4,height="900px",
                         tags$img(src = 'sidebar-Expenses.png',height = "200px",width = "400px"),
                         h5("These sections generate Graphs from the data inserted."),
                         h5("There are 6 categories in the Expenses section: "),
                         h6("1.Renting/Housing"),
                         h6("2.Regular Payment"),
                         h6("3.Food and Beverage"),
                         h6("4.Personal Expenses"),
                         h6("5.Transportation"),
                         h6("6.Miscellaneous"),
                         h5("ONLY input numbers,then press the Comfirm button every time you want to generate a new graph. Pie Chart and bar chart provided, in two different tabs.")
                  ),
                  column(width = 8,
                         tags$img(src = 'Expenses_Pie.png',height = "400px",width = "800px")
                  )
              )
            ),
            fluidRow(
              box(width = 12,
                  title = "Personal Finance Dashboard (Transactions: Income)",
                  status = "primary",
                  collapsible = TRUE,
                  collapsed = TRUE,
                  column(width = 4,height="900px",
                         tags$img(src = 'sidebar-Expenses.png',height = "200px",width = "400px"),
                         h5("These sections generate Graphs from the data inserted."),
                         h5("There are 8 categories in the Income section: "),
                         h6("1.Wages/Salary"),
                         h6("2.Commission/Tips"),
                         h6("3.Selling"),
                         h6("4.Investment"),
                         h6("5.Dividens/Interest"),
                         h6("6.Royalties"),
                         h6("7.Renting"),
                         h6("8.Others"),
                         h5("ONLY input numbers,then press the Comfirm button every time you want to generate a new graph. Pie Chart and bar chart provided, in two different tabs.")
                  ),
                  column(width = 8,
                         tags$img(src = 'Income_Pie.png',height = "400px",width = "800px")
                  )
              )
            ),
            fluidRow(
              box(width = 12,
                  title = "Personal Finance Dashboard (Transactions: Analysis - Multiple File)",
                  status = "primary",
                  collapsible = TRUE,
                  collapsed = TRUE,
                  column(width = 4,
                         tags$img(src = 'sidebar-Analysis.png',height = "200px",width = "400px"),
                         h5("Upload excel file(s) here by pressing the Browse button. You are allowed to upload max 12 files with max size of 5MB."),
                         helpText("The excel file(s) must be the template provided,just make changes on that template, ifelse, the analysis will not work properly. To download the template, click the \"Click Here\" hyperlink"),
                         h5("As mentioned, the 12 files uploaded must be the data between January and December,each only once. Errors will be generated if there are repeated months!!!"),
                         helpText("About the selection of month in the uploaded file, please refer to the box {Personal Finance (Excel File)} in this page. "),
                         br(),br(),
                         h5("After uploaded all excel file(s), three tables will be generated, which are Income table, Expenses table and Total table. You can change which data to display(Actual, Budget or Both)"),
                         helpText("If you are someone love tidy table and data, press the Download button, you will get a csv file with three tables in a same sheet."),
                         br(),br(),br(),br(), br(), br(),br(),br(), br(), br(),br(),br(), br(), br(),br(),
                         h5("In the Summary tab, the line chart shows the total income, total expenses or savings of each month. You can have some interaction with this chart. Put your mouse on the point of the chart, the extract amount will show up. You can also zoom in and zoom out your chart, and the important part, you are allowed to download this chart by clicking the \"Download plot as a png\", the one with the camera icon."),
                         br(),br(),
                         h5("The details tab includes pie chart and stacked bar chart to display the data of the previous three tables. Similarly, you can choose some conditions to determine the chart showed.(Stacked Bar Chart/Pie Chart),(Actual/Budget),(Month/Type),(Label/No Label).")
                         
                  ),
                  column(width = 8,
                         tags$img(src = 'Analysis.png',height = "400px",width = "800px"),
                         br(),br(),br(),br(),br(),
                         tags$img(src = 'Analysis_Table.png',height = "400px",width = "800px"),
                         br(),br(),
                         tags$img(src = 'Analysis_Summary2.png',height = "400px",width = "800px"),
                         br(),br(),
                         tags$img(src = 'Analysis_Details.jpeg',height = "800px",width = "800px")
                         
                  ),
                  
              )
            ),
            fluidRow(
              box(width = 12,
                  title = "Personal Finance Dashboard (About)",
                  status = "primary",
                  collapsible = TRUE,
                  collapsed = TRUE,
                  column(width = 4,
                         tags$img(src = 'sidebar-about.png',height = "200px",width = "400px"),
                         h5("The about pages introduce the team members involved in the project.")
                  ),
                  column(width = 8,
                         tags$img(src = 'about.png',height = "400px",width = "800px")
                  )
              )
            ),
            fluidRow(
              box(width = 12,
                  title = "Personal Finance Dashboard (Source Code)",
                  status = "primary",
                  collapsible = TRUE,
                  collapsed = TRUE,
                  column(width = 4,
                         tags$img(src = 'sidebar-sourceCode.png',height = "200px",width = "400px"),
                         h5("If you are interested in our code, you can go to Github to have a look and download.")
                  ),
                  column(width = 8,
                         tags$img(src = 'home_page.png',height = "400px",width = "800px")
                         
                  ),
                  
              )
            ),
            fluidRow(
              box(width = 12,
                  title = "Personal Finance Dashboard (CPI Data)",
                  status = "primary",
                  collapsible = TRUE,
                  collapsed = TRUE,
                  column(width = 4,
                         tags$img(src = 'sidebar-CPIdata.png',height = "200px",width = "400px"),
                         h5("This is the data used in the home page introduction, if you interest about the CPI index of your country, please have a look."),
                         h5("Each column can be sort ascending or descending, you can also search the Country Name"),
                         br(),br(),br(),br(),br(),br(),br(),
                         h5("You can also download this table as csv file by clicking the download button, or go the website where we get this dataset.")
                  ),
                  column(width = 8,
                         tags$img(src = 'CPIdata.png',height = "400px",width = "800px"),
                         br(),br(),br(),
                         tags$img(src = 'CPIdata2.png',height = "100px",width = "800px")
                  )
              )
            ),
            fluidRow(
              box(width = 12,
                  title = "Personal Finance (Excel File)",
                  status = "primary",
                  collapsible = TRUE,
                  collapsed = TRUE,
                  column(width = 4,
                         tags$img(src = 'Excel_Budget.png',height = "800px",width = "400px")
                         
                  ),
                  column(width = 3,
                         tags$div(
                           tags$span(style = "color: red;", "The RED part is to choose the Month of the excel file (January to December),other words are totally not allowed.")
                           ),
                         br(),br(),br(),br(),br(),br(),br(),br(),br(),br(),
                         tags$div(
                           tags$span(style = "color: blue;", "The BLUE part shows types of the Income and the Expenses."),
                           br(),
                           tags$span(style = "color: green;", "For the GREEN part, which is the white cells in the Excel file, you can edit these cell by entering the AMOUNT."),
                           br(),br(),br(),
                           tags$span(style = "color: magenta;", "For the PINK part, the YELLOW cells in the Excel file, DO NOT edit these cells, it will affect the formula that used to calculate the total amount."),
                           br(),
                           tags$span(style = "color: magenta;", "The total amount will be calculate according to the amount you entered in the other 5 sheets (Week 1 to Week 5)."),
                           br(),
                           tags$span(style = "color: plum;","About the sheets(Week 1 Expenses - Week 5 Expenses), It is the same as the previous, only edit the parts with white cells, the other parts DON'T EDIT.")
                         )
                  ),
                  column(width = 5,
                         tags$img(src = 'Excel_Month.png',height = "250px",width = "450px"),
                         br(),br(),br(),br(),br(),br(),
                         tags$img(src = 'Excelbar.png',height = "50px",width = "500px"),
                         tags$img(src = 'Excel_Week.png',height = "300px",width = "500px"),
                  )
              )
            )
    ),
    #about----    
    tabItem(tabName = "About",
            fluidRow(
              column(width = 6,
                     box(
                       title = p("LAI KE WEI"),
                       h5("Matric No. : U2102777"),
                       h5("Currently study in Bachelor Degree of Computer Science and Information Technology (Artificial Intelligence), University Malaya"),
                       width = NULL,
                       background = "teal"
                     ),
                     
                     box(
                       title = p("Jianbang Dai"),
                       h5("Matric No. : S2116427"),
                       h5("Currently study in Bachelor Degree of Computer Science and Information Technology (Artificial Intelligence), University Malaya"),
                       solidHeader = TRUE,
                       width = NULL,
                       status = "success"
                     )
                     
              ),
              
              column(width = 6,
                     box(
                       title = p("Sizhao Zou"),
                       h5("Matric No. : S2104420"),
                       h5("Currently study in Bachelor Degree of Computer Science and Information Technology (Artificial Intelligence), University Malaya"),
                       solidHeader = TRUE,
                       width = NULL,
                       status = "info"
                     ),
                     
                     box(
                       title = p("Shizheng Zhang"),
                       h5("Matric No. : S2023000"),
                       h5("Currently study in Bachelor Degree of Computer Science and Information Technology (Artificial Intelligence), University Malaya"),
                       width = NULL,
                       background = "aqua"
                     )
                     
              )
            )
    ),
    #SourceCode----
    tabItem(tabName = "SourceCode"
            
    ),
    #CPI----
    tabItem(tabName = "CPIData",
            h3("CPI INDEX FOR 266 COUNTRIES"),
            dataTableOutput("CPI"),
            h5("Data Source:",a("https://data.worldbank.org/indicator/FP.CPI.TOTL",href = "https://data.worldbank.org/indicator/FP.CPI.TOTL")),
            downloadButton("downloadData","Download")
    )
    
  )
)




#ui----
ui <- dashboardPage(header,sideBar,body)
#server----
server <- function(input, output) {
  #load data----
  CPI <- read.csv("CPI.csv")
  names(CPI) <- substring(names(CPI),2)
  CPI <- rename(CPI, Country.Name = ountry.Name)
  CPI <- rename(CPI, Country.Code = ountry.Code)
  CPI <- rename(CPI, Indicator.Name = ndicator.Name)
  CPI <- rename(CPI, Indicator.Code = ndicator.Code)
  CPI_Malaysia <- CPI %>% filter(Country.Name == "Malaysia")
  CPI_Malaysia <- select(CPI_Malaysia,5:65)
  CPI_Malaysia <- as.data.frame(t(CPI_Malaysia))
  colnames(CPI_Malaysia) <- "Malaysia"
  CPI_Malaysia <- rownames_to_column(CPI_Malaysia,"Year")
  Overall <- as.data.frame(colSums(Filter(is.numeric, CPI),na.rm = TRUE)/colSums(!is.na(CPI[-c(1:4)])))
  names(Overall)<-"CPI_Index"
  Overall <- rownames_to_column(Overall,"Year")
  #datamerge----
  datamerge <- reactive({
    file_selected <- input$MultiExcel
    if(is.null(file_selected)){
      return() 
    }else{
      nfiles = nrow(input$MultiExcel)
      Excel = list()
      Expenses = list()
      for(i in 1 : nfiles)
      {
        Excel[[i]] <- read.xlsx(file_selected$datapath[i],sheetName = "Personal Budget Worksheet")
        X <-  Excel[[i]]
        Month <- select(X[2,],NA..1)
        Month <- Month[1,]
        Expenses[[i]] <- select(Excel[[i]][c(4:12,15,25,35,40,50,56,62,63),],PERSONAL.BUDGET.WORKSHEET....,NA.,NA..1)
        names(Expenses[[i]]) <- ifelse(names(Expenses[[i]]) %in% "PERSONAL.BUDGET.WORKSHEET....", paste("Expenses_",Month),names(Expenses[[i]]))
        names(Expenses[[i]]) <- ifelse(names(Expenses[[i]]) %in% "NA.", paste(Month,"Budget"),names(Expenses[[i]]))
        names(Expenses[[i]]) <- ifelse(names(Expenses[[i]]) %in% "NA..1", paste(Month,"Actual"),names(Expenses[[i]]))
      }
      dataset <- do.call(cbind,Expenses)
      rownames(dataset) <- c(1:17)
      dataset <- dataset %>% mutate("Criteria" = dataset[,1]) %>%
        select(c("Criteria",starts_with("January"),starts_with("February"),starts_with("March"),starts_with("April"),
                 starts_with("May"),starts_with("June"),starts_with("July"),starts_with("August"),
                 starts_with("September"),starts_with("October"),starts_with("November"),starts_with("December")))
      dataset[17,1] <- "Saving"
      dataset
      
    }
  })
  
  #save----
  save <- reactive({
    wb <- openxlsx::createWorkbook()
    openxlsx::addWorksheet(wb, sheetName = "Personal Finance")
    data1 <- datamerge() %>% slice(-c(9:17)) %>% rename(Income = Criteria)
    data2 <- datamerge() %>% slice(-c(1:9,16,17)) %>% rename(Expenses = Criteria)
    
    dataset <- datamerge() %>% slice(-c(1:8,10:15)) %>% rename(Total = Criteria)
    dataset2 <- suppressWarnings(as.data.frame(lapply(dataset,as.numeric)))
    dataset <- dataset %>% mutate("Total Actual" = rowSums(select(dataset2,contains("Actual"))))
    data3 <- dataset %>% mutate("Total Budget" = rowSums(select(dataset2,contains("Budget"))))
    
    openxlsx::writeData(wb, sheet = 1, x = data1, startCol = 1, startRow = 1)
    openxlsx::writeData(wb, sheet = 1, x = data2, startCol = 1, startRow = 11)
    openxlsx::writeData(wb, sheet = 1, x = data3, startCol = 1, startRow = 19)
    wb
  })
  output$World <- renderPlotly({
    theme_set(theme_classic())
    gg<- ggplot(Overall, aes(x=Year)) +
      geom_line(aes(y=CPI_Index),group=1) +
      labs(title="Mean CPI Index from 1960 to 2020 in the World", 
           subtitle="Base: 2010 = 100", 
           caption="Source: WORLD BANK GROUP", y="CPI Index",x = "Years") +
      geom_point(aes(y=CPI_Index))+
      theme(axis.text.x = element_text(angle = 45, vjust=0.5),panel.grid.minor = element_blank())
    ggplotly(gg)
    })
  
  #output----
  output$line <- renderPlotly({
    theme_set(theme_classic())
    gg<- ggplot(CPI_Malaysia, aes(x=Year)) + 
      geom_line(aes(y=Malaysia),group=1) +
      labs(title="CPI Index from 1960 to 2020 in Malaysia", 
           subtitle="Base: 2010 = 100", 
           caption="Source: WORLD BANK GROUP", y="CPI Index",x = "Years") +
      geom_point(aes(y=Malaysia))+
      theme(axis.text.x = element_text(angle = 45, vjust=0.5),panel.grid.minor = element_blank())
    ggplotly(gg)
  })
  
  output$totalSpend <- renderText({
    if(input$action == 0){
      return() 
    }
    isolate(x <- c(input$cost1,input$cost2,input$cost3,input$cost4,input$cost5,input$cost6))
    isolate(name <- c("Renting and Housing","Regular Payments","Food and Beverage","Personal Expenses","Transportation","Miscellaneous"))
    isolate(paste("Total Expenses in this month is RM",round(sum(x),digits = 2),", mostly in ",name[which.max(x)]))
  })
  
  output$pieChart <- renderPlot({
    if(input$action == 0){
      return() 
    }
    isolate(x <- c(input$cost1,input$cost2,input$cost3,input$cost4,input$cost5,input$cost6))
    isolate(labs <- c("Renting and Housing","Regular Payments","Food and Beverage","Personal Expenses","Transportation","Miscellaneous"))
    isolate(piepercent<- round(100*x/sum(x), 2))
    isolate(pie(x,paste(piepercent,"%"),main = "Expenses",col = terrain.colors(length(x))))
    isolate(legend("topright",labs, cex = 1.5, fill = terrain.colors(length(x))))
  })
  
  output$barChart <- renderPlot({
    if(input$action == 0){
      return() 
    }
    isolate(x <- c(input$cost1,input$cost2,input$cost3,input$cost4,input$cost5,input$cost6))
    isolate(labs <- c("Renting and Housing","Regular Payments","Food and Beverage","Personal Expenses","Transportation","Miscellaneous"))
    isolate(barplot(x,xlab = "Type of Expenses",ylab = "Amount",main = "Expenses in Bar Chart",names.arg = labs,col =  terrain.colors(length(x))))
  })
  
  output$totalIncome <- renderText({
    if(input$action2 == 0){
      return() 
    }
    isolate(x <- c(input$income1,input$income2,input$income3,input$income4,input$income5,input$income7,input$income8,input$income9,input$income6))
    isolate(name <- c("Wages/Salary","Commission/Tips","Selling","Investment","Dividens/Interest","Royalties","Renting","Others"))
    isolate(paste("Total Income in this month is RM",round(sum(x),digits = 2),", mostly in ",name[which.max(x)]))
  })
  
  output$pieChart2 <- renderPlot({
    if(input$action2 == 0){
      return() 
    }
    isolate(x <- c(input$income1,input$income2,input$income3,input$income4,input$income5,input$income7,input$income8,input$income9,input$income6))
    isolate(labs <- c("Wages/Salary","Commission/Tips","Selling","Investment","Dividens/Interest","Royalties","Renting","Others"))
    isolate(piepercent<- round(100*x/sum(x), 2))
    isolate(pie(x,paste(piepercent,"%"),main = "Income",col = topo.colors(length(x))))
    isolate(legend("topright",labs, cex = 1.5, fill = topo.colors(length(x))))
  })
  
  output$barChart2 <- renderPlot({
    if(input$action2 == 0){
      return() 
    }
    isolate(x <- c(input$income1,input$income2,input$income3,input$income4,input$income5,input$income7,input$income8,input$income9,input$income6))
    isolate(labs <- c("Wages/Salary","Commission/Tips","Selling","Investment","Dividens/Interest","Royalties","Renting","Others"))
    isolate(barplot(x,xlab = "Type of Income",ylab = "Amount",main = "Income in Bar Chart",names.arg = labs,col =  topo.colors(length(x))))
  })
  
  #output$expensesTable2 <- renderDataTable(----
  output$expensesTable2 <- renderDataTable(options=list(scrollX = TRUE,
                                                        bLengthChange=0,
                                                        bFilter=0,
                                                        bInfo=0,
                                                        #bAutoWidth=0,
                                                        bPaginate=0
  ),{
    if(is.null(input$MultiExcel)){
      return() 
    }else{
      if(input$expensesDataTable == "Both")
        datamerge() %>% slice(-c(1:9,16,17)) %>% rename(Expenses = Criteria)
      else if(input$expensesDataTable == "Actual")
        datamerge() %>% slice(-c(1:9,16,17)) %>% select(c("Criteria",contains("Actual"))) %>% rename(Expenses = Criteria)
      else
        datamerge() %>% slice(-c(1:9,16,17)) %>% rename(Expenses = Criteria) %>% select(c("Expenses",contains("Budget")))
      
    }}
  )
  
  #output$incomeTable2 <- renderDataTable(----
  output$incomeTable2 <- renderDataTable(options=list(scrollX = TRUE,
                                                      bLengthChange=0,
                                                      bFilter=0,
                                                      bInfo=0,
                                                      #bAutoWidth=0,
                                                      bPaginate=0
  ),{
    if(is.null(input$MultiExcel)){
      return() 
    }else{
      if(input$incomeDataTable == "Both")
        datamerge() %>% slice(-c(9:17)) %>% rename(Income = Criteria)
      else if(input$incomeDataTable == "Actual")
        datamerge() %>% slice(-c(9:17)) %>% rename(Income = Criteria) %>% select(c("Income",contains("Actual")))
      else
        datamerge() %>% slice(-c(9:17)) %>% rename(Income = Criteria) %>% select(c("Income",contains("Budget")))
      
      
    }}
  )
  
  #output$savingTable2 <- renderDataTable(----
  output$savingTable2 <- renderDataTable(options=list(scrollX = TRUE,
                                                      bLengthChange=0,
                                                      bFilter=0,
                                                      bInfo=0,
                                                      #bAutoWidth=0,
                                                      bPaginate=0
  ),{
    if(is.null(input$MultiExcel)){
      return() 
    }else{
      if(input$savingDataTable == "Both"){
        dataset <- datamerge() %>% slice(-c(1:8,10:15)) %>% rename(Total = Criteria)
        dataset2 <- suppressWarnings(as.data.frame(lapply(dataset,as.numeric)))
        dataset <- dataset %>% mutate("Total Actual" = rowSums(select(dataset2,contains("Actual"))))
        dataset %>% mutate("Total Budget" = rowSums(select(dataset2,contains("Budget"))))
      }else if(input$savingDataTable == "Actual"){
        dataset <- datamerge() %>% slice(-c(1:8,10:15)) %>% rename(Total = Criteria) %>% select(c("Total",contains("Actual")))
        dataset2 <- suppressWarnings(as.data.frame(lapply(dataset,as.numeric)))
        dataset %>% mutate("Total Actual" = rowSums(select(dataset2,contains("Actual"))))
      }else{
        dataset <- datamerge() %>% slice(-c(1:8,10:15)) %>% rename(Total = Criteria) %>% select(c("Total",contains("Budget")))
        dataset2 <- suppressWarnings(as.data.frame(lapply(dataset,as.numeric)))
        dataset %>% mutate("Total Budget" = rowSums(select(dataset2,contains("Budget"))))
      }
      
      
    }}
  ) 
  
  #----    
  output$Chart3 <- renderPlot({
    if(is.null(input$MultiExcel))
      return() 
    
    dataset <- datamerge() %>% slice(-c(9:17)) %>% rename(Income = Criteria)
    Income <- dataset[,1]
    dataset2 <- suppressWarnings(as.data.frame(lapply(dataset,as.numeric)))
    dataset2 <- dataset2[,-1]
    dataset <- cbind.data.frame(Income,dataset2)
    Name <- dataset[,1]
    Name2 <- names(dataset)
    if(input$Criteria2 == "Actual"){
      dataset <- select(dataset,c("Income",contains("Actual")))
    }else if(input$Criteria2 == "Budget"){
      dataset <- select(dataset,c("Income",contains("Budget")))
    }
    
    dataset <-
      dataset %>%
      pivot_longer(-Income) %>%
      filter(value > 0) %>%
      mutate(Income = factor(Income, Name))%>%
      mutate(name = factor(name, Name2))
    
    if(input$chartType2 == "Stacked Bar"){
      if(input$Label == "Type"){
        if(input$Label3 == "Yes"){
          gg <- ggplot(dataset,aes(fill = forcats::fct_rev(name), y = value, x = Income, label = value)) +
            geom_bar(position="stack", stat="identity") +
            geom_text(aes(label=value),position = position_stack(vjust = 0.5)) + labs(title="Income",x ="Income Sources", y = "Amount")+
            theme(legend.title = element_blank())+theme(plot.title = element_text(size = 20,hjust = 0.5))
          plot(gg)
          
        }else if(input$Label3 == "No"){
          gg <- ggplot(dataset,aes(fill = forcats::fct_rev(name), y = value, x = Income, label = value)) +
            geom_bar(position="stack", stat="identity") + labs(title="Income",x ="Income Sources", y = "Amount")+
            theme(legend.title = element_blank())+theme(plot.title = element_text(size = 20,hjust = 0.5))
          plot(gg)
        }
        
      }else if(input$Label == "Month"){
        if(input$Label3 == "Yes"){
          gg <- ggplot(dataset,aes(fill = forcats::fct_rev(Income), y = value, x = name, label = value)) +
            geom_bar(position="stack", stat="identity") +
            geom_text(aes(label=value),position = position_stack(vjust = 0.5)) + labs(title="Income",x ="Month", y = "Amount")+
            theme(legend.title = element_blank())+theme(plot.title = element_text(size = 20,hjust = 0.5))
          plot(gg)
        }else if(input$Label3 == "No"){
          gg <- ggplot(dataset,aes(fill = forcats::fct_rev(Income), y = value, x = name, label = value)) +
            geom_bar(position="stack", stat="identity") + labs(title="Income",x ="Month", y = "Amount")+
            theme(legend.title = element_blank())+theme(plot.title = element_text(size = 20,hjust = 0.5))
          plot(gg)
        }
        
        
      }
      
    }else if(input$chartType2 == "Pie"){
      if(input$Label == "Type"){
        if(input$Label3 == "Yes"){
          dataPie <- dataset %>%
            count(Income, name) %>%
            group_by(Income) %>%
            mutate(prop = n / sum(n)) %>%
            select(-n) %>%
            spread(key = name, value = prop)
          
          dataPie <-
            dataPie %>%
            pivot_longer(-Income) %>%
            filter(value > 0) %>% 
            mutate(Income = factor(Income, levels = Name))%>%
            mutate(name = factor(name, Name2))
          
          gg <- ggplot(dataPie, aes(x=" ", y=value, group=name, colour=name, fill=name)) +
            geom_bar(width = 1, stat = "identity",color = "white", size = 1,position = "fill") + geom_text(aes(x = 1.7,label = paste(round(value*100,digits = 2),"%"),vjust = 0.5),position = position_fill(vjust = 0.5),color = "black") +
            coord_polar("y", start=0) + labs(title="Income")+
            facet_wrap(~Income) +theme_void()+ theme(plot.title = element_text(size = 20,hjust = 0.5),legend.title = element_blank())
          plot(gg)
        }else if(input$Label3 == "No"){
          gg <- ggplot(dataset, aes(x=" ", y=value, group=name, colour=name, fill=name)) +
            geom_bar(width = 1, stat = "identity",color = "white", size = 1,position = "fill") +
            coord_polar("y", start=0) + labs(title="Income")+
            facet_wrap(~Income) +theme_void()+ theme(plot.title = element_text(size = 20,hjust = 0.5),legend.title = element_blank())
          plot(gg)
        }
        
      }else if(input$Label == "Month"){
        if(input$Label3 == "Yes"){
          dataPie <- dataset %>%
            count(Income, name) %>%
            group_by(name) %>%
            mutate(prop = n / sum(n)) %>%
            select(-n) %>%
            spread(key = Income, value = prop)
          
          dataPie <-
            dataPie %>%
            rename(Categories = name) %>%
            pivot_longer(-Categories) %>%
            filter(value > 0) %>% 
            mutate(name = factor(name, Name))
          
          gg <- ggplot(dataPie, aes(x=" ", y=value, group=name, colour=name, fill=name)) +
            geom_bar(width = 1, stat = "identity",color = "white", size = 1,position = "fill") + geom_text(aes(x = 1.7,label = paste(round(value*100, digits = 2),"%"),vjust = 0.5),position = position_fill(vjust = 0.5),color = "black") +
            coord_polar("y", start=0) + labs(title="Income")+
            facet_wrap(~Categories) +theme_void()+ theme(plot.title = element_text(size = 20,hjust = 0.5),legend.title = element_blank())
          plot(gg)
        }else if(input$Label3 == "No"){
          gg <- ggplot(dataset, aes(x=" ", y=value, group=Income, colour=Income, fill=Income)) +
            geom_bar(width = 1, stat = "identity",color = "white", size = 1,position = "fill") +
            coord_polar("y", start=0) + labs(title="Income")+
            facet_wrap(~name) +theme_void()+ theme(plot.title = element_text(size = 20,hjust = 0.5),legend.title = element_blank())
          plot(gg)
        }
        
      }
      
    }
    
    
  })
  
  output$Chart4 <- renderPlot({
    if(is.null(input$MultiExcel))
      return() 
    
    dataset <- datamerge() %>% slice(-c(1:9,16,17)) %>% rename(Expenses = Criteria)
    Expenses <- dataset[,1]
    dataset2 <- suppressWarnings(as.data.frame(lapply(dataset,as.numeric)))
    dataset2 <- dataset2[,-1]
    dataset <- cbind.data.frame(Expenses,dataset2)
    Name <- dataset[,1]
    Name2 <- names(dataset)
    if(input$Criteria3 == "Actual"){
      dataset <- select(dataset,c("Expenses",contains("Actual")))
    }else if(input$Criteria3 == "Budget"){
      dataset <- select(dataset,c("Expenses",contains("Budget")))
    }
    
    dataset <-
      dataset %>%
      pivot_longer(-Expenses) %>%
      filter(value > 0) %>% 
      mutate(Expenses = factor(Expenses, levels = Name))%>%
      mutate(name = factor(name, Name2))
    
    if(input$chartType3 == "Stacked Bar"){
      if(input$Label2 == "Type"){
        if(input$Label4 == "Yes"){
          gg <- ggplot(dataset,aes(fill = forcats::fct_rev(name), y = value, x = Expenses, label = value)) +
            geom_bar(position="stack", stat="identity") +
            geom_text(aes(label=value),position = position_stack(vjust = 0.5)) + labs(title="Expenses",x ="Type of Expenses", y = "Amount")+
            theme(legend.title = element_blank())+theme(plot.title = element_text(size = 20,hjust = 0.5))
          plot(gg)
        }else if(input$Label4 == "No"){
          gg <- ggplot(dataset,aes(fill = forcats::fct_rev(name), y = value, x = Expenses, label = value)) +
            geom_bar(position="stack", stat="identity") +labs(title="Expenses",x ="Type of Expenses", y = "Amount")+
            theme(legend.title = element_blank())+theme(plot.title = element_text(size = 20,hjust = 0.5))
          plot(gg)
        }
        
      }else if(input$Label2 == "Month"){
        if(input$Label4 == "Yes"){
          gg <- ggplot(dataset,aes(fill = forcats::fct_rev(Expenses), y = value, x = name, label = value)) +
            geom_bar(position="stack", stat="identity") +
            geom_text(aes(label=value),position = position_stack(vjust = 0.5)) + labs(title="Expenses",x ="Type of Expenses", y = "Amount")+
            theme(legend.title = element_blank())+theme(plot.title = element_text(size = 20,hjust = 0.5))
          plot(gg)
        }else if(input$Label4 == "No"){
          gg <- ggplot(dataset,aes(fill = forcats::fct_rev(Expenses), y = value, x = name, label = value)) +
            geom_bar(position="stack", stat="identity") + labs(title="Expenses",x ="Type of Expenses", y = "Amount")+
            theme(legend.title = element_blank())+theme(plot.title = element_text(size = 20,hjust = 0.5))
          plot(gg)
        }
        
      }
      
    }else if(input$chartType3 == "Pie"){
      if(input$Label2 == "Type"){
        if(input$Label4 == "Yes"){
          #Pie Chart Type----
          dataPie <- dataset %>%
            count(Expenses, name) %>%
            group_by(Expenses) %>%
            mutate(prop = n / sum(n)) %>%
            select(-n) %>%
            spread(key = name, value = prop)
          
          dataPie <-
            dataPie %>%
            pivot_longer(-Expenses) %>%
            filter(value > 0) %>% 
            mutate(Expenses = factor(Expenses, levels = Name))%>%
            mutate(name = factor(name, Name2))
          
          gg <- ggplot(dataPie, aes(x=" ", y=value, group=name, colour=name, fill=name)) +
            geom_bar(width = 1, stat = "identity",color = "white", size = 1,position = "fill") + geom_text(aes(x = 1.7,label = paste(round(value*100,digits = 2),"%"),vjust = 0.5),position = position_fill(vjust = 0.5),color = "black") +
            coord_polar("y", start=0) + labs(title="Expenses")+
            facet_wrap(~Expenses) +theme_void()+ theme(plot.title = element_text(size = 20,hjust = 0.5),legend.title = element_blank())
          plot(gg)
        }else if(input$Label4 == "No"){
          gg <- ggplot(dataset, aes(x=" ", y=value, group=name, colour=name, fill=name)) +
            geom_bar(width = 1, stat = "identity",color = "white", size = 1,position = "fill")+
            coord_polar("y", start=0) + labs(title="Expenses")+
            facet_wrap(~Expenses) +theme_void()+ theme(plot.title = element_text(size = 20,hjust = 0.5),legend.title = element_blank())
          plot(gg)
        }
        
      }else if(input$Label2 == "Month"){
        if(input$Label4 == "Yes"){
          dataPie <- dataset %>%
            count(Expenses, name) %>%
            group_by(name) %>%
            mutate(prop = n / sum(n)) %>%
            select(-n) %>%
            spread(key = Expenses, value = prop)
          
          dataPie <-
            dataPie %>%
            rename(Categories = name) %>%
            pivot_longer(-Categories) %>%
            filter(value > 0) %>% 
            mutate(name = factor(name, Name))
          
          gg <- ggplot(dataPie, aes(x=" ", y=value, group=name, colour=name, fill=name)) +
            geom_bar(width = 1, stat = "identity",color = "white", size = 1,position = "fill") + geom_text(aes(x = 1.7,label = paste(round(value*100,digits = 2),"%"),vjust = 0.5),position = position_fill(vjust = 0.5),color = "black") +
            coord_polar("y", start=0) + labs(title="Expenses")+
            facet_wrap(~ Categories) +theme_void()+ theme(plot.title = element_text(size = 20,hjust = 0.5),legend.title = element_blank())
          plot(gg)
        }else if(input$Label4 == "No"){
          gg <- ggplot(dataset, aes(x=" ", y=value, group=Expenses, colour=Expenses, fill=Expenses)) +
            geom_bar(width = 1, stat = "identity",color = "white", size = 1,position = "fill") +
            coord_polar("y", start=0) + labs(title="Expenses")+
            facet_wrap(~name) +theme_void()+ theme(plot.title = element_text(size = 20,hjust = 0.5),legend.title = element_blank())
          plot(gg)
        }
        
      }
    }
    
    
  })
  
  output$Chart5 <- renderPlot({
    if(is.null(input$MultiExcel))
      return()
    
    dataset <- datamerge() %>% slice(-c(1:8,10:15)) %>% rename(Total = Criteria)
    Total <- dataset[,1]
    dataset2 <- suppressWarnings(as.data.frame(lapply(dataset,as.numeric)))
    dataset2 <- dataset2[,-1]
    dataset <- cbind.data.frame(Total,dataset2)
    dataset <- dataset %>% mutate("Total Actual" = rowSums(select(dataset,contains("Actual"))))
    dataset <- dataset %>% mutate("Total Budget" = rowSums(select(dataset,contains("Budget"))))
    Name2 <- names(dataset)
    Name <- dataset[,1]
    if(input$Criteria4 == "Actual"){
      dataset <- select(dataset,c("Total",contains("Actual")))
      dataset <- dataset[, which(names(dataset) != "Total Actual")]
    }else if(input$Criteria4 == "Budget"){
      dataset <- select(dataset,c("Total",contains("Budget")))
      dataset <- dataset[, which(names(dataset) != "Total Budget")]
    }
    
    dataset <-
      dataset %>%
      pivot_longer(-Total) %>%
      filter(value > 0) %>% 
      mutate(Total = factor(Total, levels = Name))%>%
      mutate(name = factor(name, Name2))
    
    if(input$chartType4 == "Stacked Bar"){
      gg <- ggplot(dataset,aes(fill = forcats::fct_rev(name), y = value, x = Total, label = value)) +
        geom_bar(position="stack", stat="identity") +
        geom_text(aes(label=value),position = position_stack(vjust = 0.5)) + labs(x ="Criteria", y = "Amount")+
        theme(legend.title = element_blank())
      plot(gg)
    }else if(input$chartType4 == "Pie"){
      dataPie <- dataset %>%
        count(Total, name) %>%
        group_by(Total) %>%
        mutate(prop = n / sum(n)) %>%
        select(-n) %>%
        spread(key = name, value = prop)
      
      dataPie <-
        dataPie %>%
        pivot_longer(-Total) %>%
        filter(value > 0) %>% 
        mutate(Total = factor(Total, levels = Name))%>%
        mutate(name = factor(name, Name2))
      
      gg <- ggplot(dataPie, aes(x=" ", y=value, group=name, colour=name, fill= name)) +
        geom_bar(width = 1, stat = "identity",color = "white", size = 1,position = "fill") + geom_text(aes(x = 1.7,label = paste(round(value*100,digits = 2),"%"),vjust = 0.5),position = position_fill(vjust = 0.5),color = "black") + 
        coord_polar("y", start=0) + 
        facet_wrap(~ Total) +theme_void()
      plot(gg)
    }
    
    
  })
  
  output$Chart6 <- renderPlotly({
    if(is.null(input$MultiExcel))
      return()
    
    dataset <- datamerge() %>% slice(-c(1:8,10:15)) %>% rename(Total = Criteria)
    Total <- dataset[,1]
    dataset2 <- suppressWarnings(as.data.frame(lapply(dataset,as.numeric)))
    dataset2 <- dataset2[,-1]
    dataset <- cbind.data.frame(Total,dataset2)
    dataset <- dataset %>% mutate("Total Actual" = rowSums(select(dataset,contains("Actual"))))
    dataset <- dataset %>% mutate("Total Budget" = rowSums(select(dataset,contains("Budget"))))
    Name2 <- names(dataset)
    Name <- dataset[,1]
    if(input$Criteria5 == "Actual"){
      dataset <- select(dataset,c("Total",contains("Actual")))
      dataset <- dataset[, which(names(dataset) != "Total Actual")]
    }else if(input$Criteria5 == "Budget"){
      dataset <- select(dataset,c("Total",contains("Budget")))
      dataset <- dataset[, which(names(dataset) != "Total Budget")]
    }
    
    
    if(input$Criteria1 == "Total Income"){
      totalIncome <- dataset[1,]
      totalIncome <-
        totalIncome %>%
        pivot_longer(-Total) %>%
        mutate(name = factor(name, Name2)) %>%
        rename(Month = name) %>%
        rename(Amount = value)
      
      gg<- ggplot(totalIncome,aes(x=Month))+
        geom_line(aes(x =Month,y =(Amount),group=1),inherit.aes = FALSE) +
        geom_point(aes(y=Amount))+
        labs(x="Month",y="Amount",title = "Total Income for Months")+
        theme(axis.text.x = element_text(angle = 45,hjust = 1),plot.title = element_text(size = 20,hjust = 0.5))
      ggplotly(gg)
    }else if(input$Criteria1 == "Total Expenses"){
      totalExpenses <- dataset[2,]
      totalExpenses <-
        totalExpenses %>%
        pivot_longer(-Total) %>%
        mutate(name = factor(name, Name2))%>%
        rename(Month = name) %>%
        rename(Amount = value)
      
      gg<- ggplot(totalExpenses,aes(x=Month))+
        geom_line(aes(x =Month,y =(Amount),group=1),inherit.aes = FALSE) +
        geom_point(aes(y=Amount))+
        labs(x="Month",y="Amount",title = "Total Expenses for Months")+
        theme(axis.text.x = element_text(angle = 45,hjust = 1),plot.title = element_text(size = 20,hjust = 0.5))
      ggplotly(gg)
    }else if(input$Criteria1 == "Total Saving"){
      saving <- dataset[3,]
      saving <-
        saving %>%
        pivot_longer(-Total) %>%
        mutate(name = factor(name, Name2))%>%
        rename(Month = name) %>%
        rename(Amount = value)
      
      gg<- ggplot(saving,aes(x=Month))+
        geom_line(aes(x =Month,y =(Amount),group=1),inherit.aes = FALSE) +
        geom_point(aes(y=Amount))+
        labs(x="Month",y="Amount",title = "Total Saving for Months")+
        theme(axis.text.x = element_text(angle = 45,hjust = 1),plot.title = element_text(size = 20,hjust = 0.5))
      ggplotly(gg)
    }
    
    
    
    
  })
  
  output$summary <- renderUI({
    if(is.null(input$MultiExcel)||nrow(input$MultiExcel) == 1)
      return()      
    dataset <- datamerge() %>% slice(-c(1:8,10:15)) %>% rename(Total = Criteria)
    Total <- dataset[,1]
    dataset2 <- suppressWarnings(as.data.frame(lapply(dataset,as.numeric)))
    dataset2 <- dataset2[,-1]
    dataset <- cbind.data.frame(Total,dataset2)
    dataset <- select(dataset,c("Total",contains("Actual")))
    Income <- dataset[1,]
    Expenses <- dataset[2,]
    Saving <- dataset[3,]
    
    a <- apply(Income[,-1], MARGIN=1, FUN=max,na.rm = TRUE)
    a1 <- names(which.max(Income[,-1]))
    a1 <- sub(".Actual",'',a1)
    b <- apply(Expenses[,-1], MARGIN=1, FUN=max,na.rm = TRUE)
    b1 <- names(which.max(Expenses[,-1]))
    b1 <- sub(".Actual",'',b1)
    c <- apply(Saving[,-1], MARGIN=1, FUN=max,na.rm = TRUE)
    c1 <- names(which.max(Saving[,-1]))
    c1 <- sub(".Actual",'',c1)
    
    HTML(paste(br(),"Maximum monthly income : RM",a,"(",a1,")",br(),
               "Maximum monthly expenses : RM",b,"(",b1,")",br(),
               "Maximum monthly savings : RM",c,"(",c1,")"))
    
  })
  
  output$summary2 <- renderUI({
    if(is.null(input$MultiExcel)||nrow(input$MultiExcel) == 1)
      return()      
    dataset <- datamerge() %>% slice(-c(9:17)) %>% rename(Income = Criteria)
    Income <- dataset[,1]
    dataset2 <- suppressWarnings(as.data.frame(lapply(dataset,as.numeric)))
    dataset2 <- dataset2[,-1]
    dataset <- cbind.data.frame(Income,dataset2)
    dataset <- select(dataset,c("Income",contains("Actual")))
    dataset$Total <- rowSums(dataset[,-1],na.rm = TRUE)
    a <- max(dataset$Total)
    a1 <- which.max(dataset$Total)
    a2 <- dataset[a1,1]
    a3 <- (length(dataset)-2)
    a4 <- round((a/a3), digits=2)
    
    dataset <- datamerge() %>% slice(-c(1:9,16,17)) %>% rename(Expenses = Criteria)
    Expenses <- dataset[,1]
    dataset2 <- suppressWarnings(as.data.frame(lapply(dataset,as.numeric)))
    dataset2 <- dataset2[,-1]
    dataset <- cbind.data.frame(Expenses,dataset2)
    dataset <- select(dataset,c("Expenses",contains("Actual")))
    dataset$Total <- rowSums(dataset[,-1],na.rm = TRUE)
    b <- max(dataset$Total)
    b1 <- which.max(dataset$Total)
    b2 <-dataset[a1,1]
    b3 <- (length(dataset)-2)
    b4 <- round((b/b3), digits=2)
    
    
    
    
    HTML(paste(br(),"Major Income Source : ",a2,br(),"( Total:RM",a,", Average per Month: ",a4," )",br(),
               "Major Expenses : ",b2,br(),"( Total:RM",b,", Average per Month: ",b4," )"))
    
  })
  
  #output$CPI <- renderDataTable(----    
  output$CPI <- renderDataTable(CPI,options = list(scrollX = TRUE))
  #downloadCPI----    
  output$downloadData <- downloadHandler(
    filename = function(){
      paste("CPI_index_1960_2021","csv",sep = ".")
    },
    content = function(file){
      write.csv(CPI,file)
    }
  )
  
  observeEvent(input$MultiExcel, {
    enable("download")
  })
  
  
  #download----    
  output$download <- downloadHandler(
    
    filename = function(){
      paste("Personal_Finance","xlsx",sep = ".")
    },
    content = function(file){
      openxlsx::saveWorkbook(save(), file = file, overwrite = TRUE)
    },
    
  )
}
#----
shinyApp(ui = ui, server = server)
