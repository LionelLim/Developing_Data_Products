library(shiny)
shinyServer(function(input, output) {
data <- mtcars

library(caret)
fit <- train(mpg ~ carb+am+gear,
             method = 'lmStepAIC',
             data = data)

#predictdf <- data.frame(cyl=as.factor(character()),
#                        wt=as.numeric(character()), 
#                        disp=as.numeric(character()), 
#                        hp=as.numeric(character()))

#output$cyl = renderText(paste("Input cylinder is : ", input$cyl))
#output$cyl = predictdf$cyl = renderText({input$cyl})

#output$wt = renderText(paste("Input weight is : ", input$wt))
#output$wt = predictdf$wt = renderText(input$wt)

#output$disp = renderText(paste("Input displacement is : ", input$disp))
#output$disp = predictdf$disp = renderText(input$disp)

#output$hp = renderText(paste("Input hoursepower is : ", input$hp))
#output$hp = predictdf$hp = renderText(input$hp)

mpg <- reactive({round(predict(fit,
                          cbind(am=as.numeric(input$am),
                          gear=as.numeric(input$gear),
                          carb=as.numeric(input$carb))), digits = 2)})
output$results <- renderText({paste("Predicted MPG is :", mpg())})

output$plot <-  renderPlot({
  hist(data$mpg,
       xlab = "Fuel Consumption (mpg)",
       main = "Placement of Predicted value over fuel consmptions of all cars")
  abline(v=mpg(),col="red")})
})