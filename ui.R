library(shiny)
library(shinydashboard)


dashboardPage(
  dashboardHeader(title = "Results"),
  dashboardSidebar(

    box(
      width = NULL, background = "black",
      # Input: Selector for choosing variable ----
      checkboxGroupInput("variable", label = h5("Choose joint(s)"), #h3 is larger than h4 #Output is the names in vector format
                         choices = list("Trunk" = "thorax","Hip" = "hip", "Knee" = "knee", "Ankle" = "foot"),
                         selected = "knee"),
    ),
    box(
      width = NULL, background = "black",
      radioButtons("type", h5("Choose outcome measure"),
                   choices = list("Max" = "Max","Mean" = "Mean", "Var" = "var"),
                   selected = "Mean"),
    ),
    
    
    box(
      width = NULL, background = "black",
      div(
        style = "display: grid; 
        grid-template-columns: 50% repeat(2, 20%); ## same as repeat(4, 20%)
        grid-gap: 10px;",
        
        radioButtons("ACL", h5("ACL"),
                     choices = list("I" = "I", "NI" = "NI")), #Have changed affected to injured and non-affected to non-injured
        
        radioButtons("Healthy", h5("Healthy"),
                     choices = list("D" = "D", "ND" = "ND")),
        
      ),
    ),
    
    box(
      title = " ", width = NULL, solidHeader = FALSE,
      img(src='Umotionlab_logo.png', align = "middle"), #width in pixels
    )
  ),
  dashboardBody(
    tabBox(
      width="100%", height = "1000",
      
      tabPanel("Overall results", value=1,
               box(
                 width = NULL, solidHeader = FALSE,
                 helpText(h4("Supplementary material for the manuscript 'Analysis choices provide contrasting conclusions when evaluating 
jump performance: A multi-aspect inferential method applied to kinematic curves from the one-leg vertical hop in knee-injured and asymptomatic persons'"))
               ),
               
               fluidRow(
                 column(width = 4,
                        box(
                          title = "Number of individuals", width = NULL, solidHeader = TRUE, status = "primary",
                          tableOutput('NumberObs')
                        )
                 ),
                 column(width = 8,
                        box(
                          title = "Results of multivariate analysis", width = NULL, height = 7, solidHeader = TRUE , status = "primary",
                          plotOutput("multiaspect"),
                        )
                 )
                 
               ),
      ),
      
      tabPanel("Trunk", value=2,
               helpText("No results are shown on this tab if Trunk is not choosen."),
               conditionalPanel(condition = "output.variableType1 == 'thorax'",
                                plotOutput("data.thorax")
                                
               )
      ),
      
      
      tabPanel("Hip", value=3,
               helpText("No results are shown on this tab if Hip is not choosen."),
               conditionalPanel(condition = "output.variableType2 == 'hip'",
                                plotOutput("data.hip")
               )
      ),
      
      tabPanel("Knee", value=4,
               helpText("No results are shown on this tab if Knee is not choosen."),
               conditionalPanel(condition = "output.variableType3 == 'knee'",
                                plotOutput("data.knee")
                                
               )
               
      ),
      
      
      tabPanel("Ankle", value=5,
               helpText("No results are shown on this tab if Ankle is not choosen."),
               conditionalPanel(condition = "output.variableType4 == 'foot'",
                                plotOutput("data.foot")
               )
      )
    )
  )
)


