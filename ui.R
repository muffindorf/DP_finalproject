library(shiny)

shinyUI(pageWithSidebar(
        headerPanel("Per-36 Stat and Percentile"),
        sidebarPanel(
                selectInput("inputX", "Select desired per-36 stat:", c("Points" = "pts", "Rebounds" = "trb", "Assists" = "ast")),
                numericInput("inputY", "Select desired value to check its percentile:", 10, min = 0, max = 72, step = 0.1),
                h5("Note:"),
                h6("This app takes a stat in NBA boxscore and a per-36 minute value for that stat and returns the value's percentile
                    during the '13-'14 NBA season, as well as the player with the most similar stat."),
                h6("In the NBA, per-36 minute stats are sometimes used as substitutes to raw stats or per-game stats because it adjusts 
                   for playing time, and it roughly approximates what the player's stats would be if he were playing starter's minutes,
                    i.e. 36 minutes."),
                h6("Use the dropdown menu above to select the desired stat, and use the numeric input to input the desired value for the
                    stat.")
        ),
        mainPanel(
                h3("Stat percentile during the '13-'14 NBA season"),
                textOutput("percentile"),
                h3("Player with the closest stat"),
                textOutput("simplyr")
        )
))