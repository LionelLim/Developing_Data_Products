library(shiny)
shinyServer(function(input, output) {
data <- mtcars

library(caret)
fit <- train(mpg ~ hp+am+wt,
             method = 'lmStepAIC',
             data = data)

mpg <- reactive({round(predict(fit,
                          cbind(am=as.numeric(input$am),
                          hp=as.numeric(input$hp),
                          wt=as.numeric(input$wt))), digits = 2)})
output$results <- renderText({paste("Predicted MPG is :", mpg())})

output$plot <-  renderPlot({
  hist(data$mpg,
       xlab = "Fuel Consumption (mpg)",
       main = "Placement of Predicted value over fuel consmptions of all cars")
  abline(v=mpg(),col="red")})
})