library(shiny)

shinyServer(function(input, output) {
        nba2013 <- read.csv("nba_2013.csv")
        pctfunc <- reactive({
                stat <- as.character(input$inputX)
                name <- nba2013$player
                stat.36 <- nba2013[, grep(stat, names(nba2013))]/(nba2013$mp/36)
                x36 <- data.frame("name" = name, "stat.36" = stat.36)
                pct <- ecdf(x36$stat.36)
                pctile <- round(pct(input$inputY)*100, 1)
                print(paste(pctile, "th Percentile"))
        })
        
        splyr <- reactive({
                stat <- as.character(input$inputX)
                name <- nba2013$player
                stat.36 <- nba2013[, grep(stat, names(nba2013))]/(nba2013$mp/36)
                x36 <- data.frame("name" = name, "stat.36" = stat.36)
                simplyr <- x36[which.min(abs(input$inputY-x36$stat.36)),]
                print(paste(simplyr$name, "-", round(simplyr$stat.36,1)))
        })
        output$percentile <- renderText({pctfunc()})
        output$simplyr <- renderText({splyr()})
})
