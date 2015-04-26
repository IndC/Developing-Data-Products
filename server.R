library(UsingR)
data(galton)

Ax <- function(FatherSon) if (FatherSon == 1){father.son$fheight} else {father.son$sheight}
Ay <- function(FatherSon) if (FatherSon == 1){father.son$sheight} else {father.son$fheight}
Axl <- function(FatherSon) if (FatherSon == 1){"Father's height"} else {"Son's height"}
Ayl <- function(FatherSon) if (FatherSon == 1){"Son's height"} else {"Father's height"}

Opt <- function(FatherSon, Ht) {
  ln <- lm(Ay(FatherSon) ~ Ax(FatherSon))
  round(ln$coef[1] + ln$coef[2]* Ht,2)
}

shinyServer(
  function(input, output) {
    output$oid1 <- renderPrint({input$id1})
    output$Tx1 <- renderPrint(paste(if (input$id1 == 1){"You entered Father's Height as: "} else {"You entered Son's Height as: "}, input$id2, "inches"))
    output$Tx2 <- renderPrint(paste(if (input$id1 == 1){"Son's Height is: "} else {"Father's Height is: "}, Opt(input$id1, input$id2), "inches"))
    
    output$newPlot <- renderPlot({
      plot(Ax(input$id1), Ay(input$id1),
           xlab = Axl(input$id1),
           ylab = Ayl(input$id1),
           bg = "lightblue", col = "black", cex = 1.1, pch = 21,
           frame = FALSE)     
      abline(lm(Ay(input$id1) ~ Ax(input$id1)))
    })
  }
)
