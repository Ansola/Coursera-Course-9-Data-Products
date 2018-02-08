

library(shiny)


shinyUI(fluidPage(
  
titlePanel("Diamond Cost Estimator"),
  
  
  sidebarLayout(
    sidebarPanel(
      helpText("Please enter the cut, color, clarity, and carat of your desired diamond to estimate its cost."),
      h3(helpText("Select:")),
      selectInput("cut", label = h5("Cut"), 
                  choices = list("Unknown" = "*", "Fair" = "Fair", "Good" = "Good",
                                 "Very Good" = "Very Good", "Premium" = "Premium",
                                 "Ideal" = "Ideal")),
      selectInput("col", label = h5("Color"), 
                  choices = list("Unknown" = "*", "D" = "D", "E" = "E",
                                 "F" = "F", "G" ="G",
                                 "H" = "H", "I" = "I",
                                 "J" = "J")),
      selectInput("clar", label = h5("Clarity"), 
                  choices = list("Unknown" = "*", "I1" = "I1", "SI2" = "SI2",
                                 "SI1" = "SI1", "VS2" = "VS2", "VS1" = "VS1",
                                 "VVS2" = "VVS2", "VVS1" = "VVS1", "IF" = "IF" )),
      numericInput("car", label = h5("Carats"), step = 0.01, value = 2)
    ),
    
      mainPanel(
      plotOutput("distPlot"),
      h4("In US Dollars the cost of this diamond is estimated to be:"),
      h3(textOutput("result"))
    )
  )
))
