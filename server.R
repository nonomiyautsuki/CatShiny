
# This is the server logic for a Shiny web application.
# You can find out more about building applications with Shiny here:
#
# http://shiny.rstudio.com
#

library(shiny)
library(PubMedWordcloud)

shinyServer(
  function(input, output) {
  
########Copy the input word########
    
    
    pmid <- renderText({input$PMIDtest})
    #a<-isolate(pmid())
    #print(a)
    output$PMID_cat <-pmid

    #abstract<-getAbstracts(a)
    isolate(output$PMID_value <- renderText({getAbstracts(pmid())}))
    #output$PMID_value <- renderText({getAbstracts('28761062')})    
    
    #Can link back to front, but can't front to back

        output$articlevalue <- renderText({ input$article })
        articletext <- renderText({ input$article })
        
        #output$articlevalue <- strsplit(articletext, " ")
#        output$articlevalue <- renderText({ input$article })
#        if(input$article == "cat")
#         input$article <- "dog"#Try to change the word but failed.
        


        
        output$default_articlevalue <- renderText({ input$default })
        
##################   
        
        output$Catarticletest  <- eventReactive(input$Catbutton, {
          
        
        output$Catarticletest <- renderText({ paste("Cat wrote:",input$Catarticle)})})
        
        #output$plot <- renderPlot({
       #   hist(randomVals())
        #})
       # Catarticle<-"This is a cat of test in UI."
        
        output$Catcolor <- renderText({ paste("hello input is",input$n) })

##################        
        output$contents <- renderTable({
          
          # input$CsvFile will be NULL initially. After the user selects
          # and uploads a file, head of that data file by default,
          # or all rows if selected, will be shown.
          
          req(input$CsvFile)
          
          # df <- read.csv(input$CsvFile$datapath,
          #                header = input$header,
          #                sep = input$sep,
          #                quote = input$quote)
          df <- read.csv(input$CsvFile$datapath,
                         header = TRUE,
                         sep = ",",
                         quote = '"',
                         nrows = 0
                         )
          
          if(input$disp == "head") {
            return(head(df))
          }
          # else if (input$disp == "Number"){
          #   return("10")
          # }
          else {
            return(df)
          }
          
        })
        
        
        
        
        ##################        
        output$catcontents <- renderTable({
          
        catdataframe <- read.csv("www/meow database.csv",
                         header = TRUE,
                         sep = ",",
                         quote = '"',
                         nrows =20)
        
        
        } )
          

        
##################   

        
        output$line_report_PDF<- renderImage({
          
          PDFfile="www/0671-0682.pdf"
          print(paste("file exists:",file.exists(PDFfile)))
          list(src=PDFfile)
        }, deleteFile=FALSE)
   
##################       
        # Reactive expression to generate the requested distribution. This is 
        # called whenever the inputs change. The output renderers defined 
        # below then all used the value computed from this expression
        data <- reactive({  
          dist <- switch(input$dist,
                         norm = rnorm,
                         unif = runif,
                         lnorm = rlnorm,
                         exp = rexp,
                         rnorm)
          
          dist(input$n)
        })
        
        # Generate a plot of the data. Also uses the inputs to build the 
        # plot label. Note that the dependencies on both the inputs and
        # the data reactive expression are both tracked, and all expressions 
        # are called in the sequence implied by the dependency graph
        output$plot <- renderPlot({
          dist <- input$dist
          n <- input$n
          
          hist(data(), 
               main=paste('r', dist, '(', n, ')', sep=''))
        })
        
        # Generate a summary of the data
        output$summary <- renderPrint({
          summary(data())
        })
        
        # Generate an HTML table view of the data
        output$table <- renderTable({
          data.frame(x=data())
        })
      }
      )



