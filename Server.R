library(shiny)
shinyServer(function(input, output) {
data <- mtcars
data$am = as.factor(data$am)
data$cyl = as.factor(data$cyl)
data$gear = as.factor(data$gear)
library(caret)
set.seed(2345)
fit <- train(mpg ~ am+wt+cyl+hp,
             method = 'lmStepAIC',
             data = data)

mpg <- reactive({round(predict(fit,
                          data.frame(
                          am=as.factor(as.numeric(input$am)),
                          cyl=as.factor(as.numeric(input$cyl)),
                          hp=as.numeric(input$hp),
                          wt=as.numeric(input$wt))), digits = 2)})
output$results <- renderText({paste("Predicted MPG is :", mpg())})

output$plot <-  renderPlot({
  hist(data$mpg,
       xlab = "Fuel Consumption (mpg)",
       main = "Placement of Predicted value over fuel consmptions of all cars")
  abline(v=mpg(),col="red")})
})