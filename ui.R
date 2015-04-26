shinyUI(pageWithSidebar(
  headerPanel("Predicting Height"),
  sidebarPanel(
    radioButtons("id1", "Choose whose height you want to predict.",     
                         c("Father's Height" = "1",
                         "Son's Height" = "2")),
    numericInput("id2", "Enter height in inches", 66, min = 50, max = 100, step = .1)
  ),
  mainPanel(
    h3('The Results'),
    h4('The application lets you enter the height of either the parent or the child to predict the height of the other. '),
    h4('The prediction is based on the data in the father.son table in the inbuilt galton data.'),
    h4('The application shows you the value you entered in the Input Section and calculates the output in the Output Section. '),
    h4('The graph shows the data that was used along with the calculated linear model.'),
    h3('Input'),
    verbatimTextOutput("Tx1"),
    plotOutput('newPlot'),
    h3('Output'),
    verbatimTextOutput("Tx2")    
    )
))