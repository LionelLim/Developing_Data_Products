---
title       : Shiny App Presentation
subtitle    : Fuel Consumption Prediction
author      : Lione Lim
job         : Consultant
framework   : io2012        # {io2012, html5slides, shower, dzslides, ...}
highlighter : highlight.js  # {highlight.js, prettify, highlight}
hitheme     : tomorrow      # 
widgets     : []            # {mathjax, quiz, bootstrap}
mode        : selfcontained # {standalone, draft}
knit        : slidify::knit2slides
---

## About the Application

1. Fuel consumption of cars are not commonly made known to buyers, and buyer only know some basic information of the car when purchasing. 
2. This an application developed in Shiny to predict the fuel consumption of a car produced between 1973 and 1974. 
3. The users only needs to enter some basic information about the car for the prediction.
4. Development in Shiny was simple and yet enables powerful web-based interactive data product in R.

--- .class #id 

## About the Data
1. The data was extracted from the 1974 Motor Trend US magazine
2. It comprises fuel consumption and 10 aspects of automobile design and performance for 32 automobiles (1973-74 models).
3. The variables provides includes Number of cylinders, Displacement, Horsepower, Transmission and etc.
4. The source is Henderson and Velleman (1981), Building multiple regression models interactively. Biometrics, 37, 391-411.

---

## Exploring the Data

1. Review of the variables significance to the predictor (mpg) using linear model was done.
2. Remaining variables shown are Weight (wt), Tranmission (am), 1/4 mile time(qsec), Horsepower (hp) and Number of Cylinders (cyl)



```r
varImp(object = fit$finalModel, scale=0)
```

```
##      Overall
## cyl6   1.702
## hp     1.748
## wt     3.435
## qsec   1.485
## am1    2.153
```

```r
fit$result
```

```
##   parameter  RMSE Rsquared RMSESD RsquaredSD
## 1      none 5.825    0.501  2.772     0.2866
```

---
## Building the model

1. Based on the original model qsec was usedm however, qsec was the least important and not commonly known, we tried removing the variable and the accuracy of model greatly increases. The Rsquared jumped from 0.585 to 0.815
2. Therefore the final model was built with only 4 variables.


```r
fit <- train(mpg ~ am+wt+cyl+hp,
             method = 'lmStepAIC',
             data = data)
```

```r
varImp(object = fit$finalModel, scale=0)
```

```
##      Overall
## am1    1.733
## wt     3.097
## cyl6   2.039
## hp     4.459
```

```r
fit$result
```

```
##   parameter  RMSE Rsquared RMSESD RsquaredSD
## 1      none 3.048   0.8125 0.4859    0.07114
```

---
## Time to try
The URL to the application is :

https://lionelim.shinyapps.io/Developing_Data_Products/
