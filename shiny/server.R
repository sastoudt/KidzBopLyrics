library(diffobj)
server <- function(input, output, session) {
  
  load(file = "../data/kbLyrics.RData")
  load(file = "../data/ogLyrics.RData")
  load(file = "../data/OG_artist_KB.RData")
  load(file = "../data/OG_artist_name_KB.RData")
  kb <- read.csv("../data/kbSongs.csv", stringsAsFactors = F)
  
  
  idx <- reactive({

    which(kb$song_name == input$songChoice)
    
  })

  output$diffobj_element <- renderUI({
    HTML(
      as.character(
        diffPrint(
          as.data.frame(ogLyrics[[idx()]]$line), as.data.frame(kbLyrics[[idx()]]$result$line),
          mode = "sidebyside",
          format = "html", 
          style = list(html.output = "page") #diff.w.style
        )
      )
    )
  })
}