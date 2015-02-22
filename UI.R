library(shiny)
shinyUI(
  pageWithSidebar(
    headerPanel("Developing Data Products Project"),
    sidebarPanel(
      h3('Variable Selections'),
      numericInput("hp", 
                   "Gross horsepower : ", 
                   50, 
                   min = 50, 
                   max = 350, 
                   step = 1),
      radioButtons("am", "Transmission : ",
                   list("Automatic" = "0",
                        "Manual" = "1")),
      numericInput("wt", 
                   "Weight (lb/1000) : ", 
                   1.001, 
                   min = 1, 
                   max = 6, 
                   step = 0.001),
      submitButton("Submit")
        ),
    
    mainPanel(
      tabsetPanel(
        ##Creating a subpanel to display the Data and App
        tabPanel(
          "About it",
          h4('About the Application'),
          div('This is an application to predict the fuel consumption
              of a car produced between 1973 and 1974. 
              The users only needs to enter some basic information 
              about the car for the prediction.'),
          h4('About the Data'),
          div('The data was extracted from the 1974 Motor Trend US magazine,
              and comprises fuel consumption and 10 aspects of automobile design 
              and performance for 32 automobiles (1973-74 models).'),
          h4('Data Exploration'),
          div('Through data exploration, 
              the variables that have statistical influence 
              to the target Miles Per Gallon (mpg) are 
              Weight (lb/1000) (wt), Gross horsepower (hp)
              and Transmission (am).'),
          h4('Source'),
          div('Henderson and Velleman (1981), 
              Building multiple regression models interactively. 
              Biometrics, 37, 391-411.')
          ),
      
        ##Creating a subpanel to display the analysis
        tabPanel("Analysis", 
                 h4('Analysis Details'),
                 textOutput("results"),
                 plotOutput("plot", width = "100%")
                 )
    )
)))