library(shiny)
shinyUI(
  pageWithSidebar(
    headerPanel("Developing Data Products Project"),
    sidebarPanel(
      h3('Variable Selections'),
      radioButtons("gear", "Number of forward gears:",
                   list("3" = "3",
                        "4" = "4",
                        "5" = "5")),
      radioButtons("am", "Transmission :",
                   list("Automatic" = "0",
                        "Manual" = "1")),
      numericInput("carb", 
                   "Number of carburetors [1-8]:", 
                   1, 
                   min = 1, 
                   max = 8, 
                   step = 1),
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
              Number of forward gears (gear), Number of carburetors (carb)
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