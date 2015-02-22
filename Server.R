library(shiny)
shinyServer(function(input, output) {
data <- mtcars

library(caret)
set.seed(2345)
fit <- train(mpg ~ am+wt+qsec,
             method = 'lmStepAIC',
             data = data)

mpg <- reactive({round(predict(fit,
                          cbind(
                          qsec=as.numeric(input$qsec),
                          am=as.numeric(input$am),
                          wt=as.numeric(input$wt))), digits = 2)})
output$results <- renderText({paste("Predicted MPG is :", mpg())})

output$plot <-  renderPlot({
  hist(data$mpg,
       xlab = "Fuel Consumption (mpg)",
       main = "Placement of Predicted value over fuel consmptions of all cars")
  abline(v=mpg(),col="red")})
})