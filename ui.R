
# This is the user-interface definition of a Shiny web application.
# You can find out more about building applications with Shiny here:
#
# http://shiny.rstudio.com
#

library(shiny)
library(PubMedWordcloud)
shinyUI(fluidPage(
  # Application title
  titlePanel("Cat hopes this thing can work."),
  
  
  textInput("PMIDtest", "PMID title","20576513", width = '400px'),
  verbatimTextOutput("PMID_cat"), 
  verbatimTextOutput("PMID_value"),    
  
 # h3(textOutput("caption")),
  
  tags$head(tags$style("{color: red; font-size: 20px; font-style: italic;}")),
    # adding the new div tag to the sidebar            
    tags$div(class="header", checked=NA,
             tags$p("Cat world is built."),
             tags$a(href="http://www.google.com", "Google"),
             tags$br(),
             #tags$img(src="S__15827146.gif", width = "100px", height = "100px"),
             tags$img(src="寫輪貓臉.jpg", height = "100px"),
             tags$br(),
             tags$a(href="index.html", "Old cat mission"),
             tags$br(),
             tags$a(href="treemap.html", "Treemap simulation"),
             #tags$script(src="javascript/jquery-2.2.0.min.js"),
             textInput("article", "Article input place", width = '400px',placeholder = "cat is justice"),
             verbatimTextOutput("articlevalue"),
             
             textInput("default", "default title", "default cat.", width = '400px'),
             verbatimTextOutput("default_articlevalue"),            
             
             #
             
             bootstrapPage(
               textInput("Catarticle", "Cat Article input place", "article to tm", width = '400px',placeholder = "cat is justice"),
               verbatimTextOutput("Catarticletest"),
               
               #color the font by css.
               tags$head(tags$style("#Catarticletest{color: blue; font-size: 20px; font-style: italic; font-weight: bolder;}"))
               
               ),
  

             tags$br(),
             
             
             
             
             #tags$audio(src = "かっかかっかはるかっか鈴聲.mp3", type = "audio/mp3", autoplay = NA , loop = NA),
             #View(catIDF),
             
##########################
             
            actionButton("Catbutton", "Cat go"),

             
             
##########################
            tags$br(),

##########################

bootstrapPage(
  numericInput('n', 'Number of obs', 100),
  textOutput('Catcolor'),
  tags$head(tags$style("#Catcolor{color: red;
                       font-size: 20px;
                       font-style: italic;
                       }"
  )
  )
  ),

##########################



             
             tags$br(),
             tags$iframe(src = "convertcsv.htm", seamless=NA ,height='400px',width='20%'),
             tags$iframe(src = "Cp-_tngVIAAD6lo.jpg", seamless=NA ,height='400px',width='20%'),
             #tags$iframe(src = "catIDF.csv", seamless=NA ,height='400px',width='20%'),
             #if using the browsers except safari, it will be downloaded automatically.
             tags$iframe(src = "index.html", seamless=NA ,height='400px',width='20%'),
             tags$iframe(src = "treemap.html", seamless=NA ,height='400px',width='20%'),
             tags$br(),




             
             
             tags$i("Bottom of the website.")
             
             
    )

    )

  )

