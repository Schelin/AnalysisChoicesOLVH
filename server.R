library(shiny)
library(shinydashboard)

function(input, output)
{
  
  ###########
  # TABLE
  ###########
  output$NumberObs<-renderTable({
     temp.var <- input$variable[1]
     if (temp.var == "thorax"){temp.var <- "Thorax"}
     ACL.temp <- input$ACL
     load(paste0("Data/Number_of_ind_",input$type,"_VJ_ACL_",temp.var,"_X_",input$ACL,"_", input$Healthy,".RData"))
     colnames(temp) <- c("Group", "# Ind")
     temp <- temp
   })
  
  ###########
  # "Reactive" to variables included
  ###########
  
  output$variableType1 = eventReactive(input$variable, {
    if("thorax" %in% input$variable){
      return("thorax")
    }
  })
  outputOptions(output, "variableType1", suspendWhenHidden = FALSE)
  
  
  output$variableType2 = eventReactive(input$variable, {
    if("hip" %in% input$variable){
      return("hip")
    }
  })
  outputOptions(output, "variableType2", suspendWhenHidden = FALSE)
  
  output$variableType3 = eventReactive(input$variable, {
    if("knee" %in% input$variable){
      return("knee")
    }
  })
  outputOptions(output, "variableType3", suspendWhenHidden = FALSE)
  
  output$variableType4 = eventReactive(input$variable, {
    if("foot" %in% input$variable){
      return("foot")
    }
  })
  outputOptions(output, "variableType4", suspendWhenHidden = FALSE)
  
  ###########
  # PLOT DATA all planes
  ###########
  output$data.thorax <- renderImage({
    order.variable.in.files <- c("knee", "hip", "foot", "thorax")
    variables <- order.variable.in.files[sort(match(input$variable, order.variable.in.files))]
    filename <- normalizePath(file.path("Figures", 
                                        paste("Figure", input$type,"_", paste(variables, collapse ="&"),"_", input$ACL,"_",input$Healthy, "_thorax", ".png", sep = "")))
     list(src = filename)  
  }, deleteFile = FALSE)
  
  output$data.hip <- renderImage({
    order.variable.in.files <- c("knee", "hip", "foot", "thorax")
    variables <- order.variable.in.files[sort(match(input$variable, order.variable.in.files))]
    filename <- normalizePath(file.path("Figures", 
                                        paste("Figure", input$type,"_", paste(variables, collapse ="&"),"_", input$ACL,"_",input$Healthy, "_hip", ".png", sep = "")))
    list(src = filename)  
  }, deleteFile = FALSE)
  
  output$data.knee <- renderImage({
    order.variable.in.files <- c("knee", "hip", "foot", "thorax")
    variables <- order.variable.in.files[sort(match(input$variable, order.variable.in.files))]
    filename <- normalizePath(file.path("Figures", 
                                        paste("Figure", input$type,"_", paste(variables, collapse ="&"),"_", input$ACL,"_",input$Healthy, "_knee", ".png", sep = "")))
    list(src = filename)  
  }, deleteFile = FALSE)
  
  output$data.foot <- renderImage({
    order.variable.in.files <- c("knee", "hip", "foot", "thorax")
    variables <- order.variable.in.files[sort(match(input$variable, order.variable.in.files))]
    filename <- normalizePath(file.path("Figures", 
                                        paste("Figure", input$type,"_", paste(variables, collapse ="&"),"_", input$ACL,"_",input$Healthy, "_foot", ".png", sep = "")))
    list(src = filename)  
  }, deleteFile = FALSE)
 
  
  ###########
  # PLOT RESULTS multiaspect
  ###########
  
  output$multiaspect <- renderImage({
    order.variable.in.files <- c("knee", "hip", "foot", "thorax")
    variables <- order.variable.in.files[sort(match(input$variable, order.variable.in.files))]
    filename <- normalizePath(file.path("Figures", 
                                        paste("Multivariate_pvalue_adj", input$type,"_", paste(variables, collapse ="&"),"_", input$ACL,"_",input$Healthy, ".png", sep = "")))
    list(src = filename)  
    
  }, deleteFile = FALSE)
}


