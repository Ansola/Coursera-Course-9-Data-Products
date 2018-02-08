library(shiny)
library(ggplot2)
library(dplyr)
dim <- diamonds[,c(1:4,7)]
shinyServer(function(input, output) {
  output$distPlot <- renderPlot({
       dim <- filter(diamonds, grepl(input$cut, cut), grepl(input$col, color), grepl(input$clar, clarity))
    fit <- lm( price~carat, dim)
    pr <- predict(fit, newdata = data.frame(cut = input$cut,
                                              color = input$col,
                                              clarity = input$clar,
                                              carat = input$car))
    
    plot <- ggplot(data=dim, aes(x=carat, y = price))+
      geom_jitter(aes(color = cut), alpha = 0.3)+
      geom_quantile(method = "lm")+
      geom_vline(xintercept = input$car, color = "green")+
      geom_hline(yintercept = pr, color = "red")
    plot
  })
  output$result <- renderText({
    dim <- filter(diamonds, grepl(input$cut, cut), grepl(input$col, color), grepl(input$clar, clarity))
    fit <- lm( price~carat, dim)
    pr  <- predict(fit, newdata = data.frame(cut = input$cut,
                                              color = input$col,
                                              clarity = input$clar,
                                              carat = input$car))
    rs <- paste(round(pr, digits = 2), "" )
    rs
  })
  
})
