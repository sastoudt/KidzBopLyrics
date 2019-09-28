kb <- read.csv("../data/kbSongs.csv", stringsAsFactors = F)

ui <- fluidPage(
  titlePanel("Compare Kidz Bop Lyrics to the Original"),
  fluidRow(
    column(
      3,
      wellPanel(
        hr("Pick a song"),
        selectInput("songChoice", "Original Song", kb$song_name,
          selected = "Truth Hurts", multiple = FALSE,
          selectize = TRUE, width = NULL, size = NULL
        )
      )
    ),
    column(
      9,
      htmlOutput("diffobj_element")
    )
  )
)