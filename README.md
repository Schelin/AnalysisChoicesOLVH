# AnalysisChoicesOLVH
Supplementary material for manuscript "TITLE". This ShinyApp allows for a complete and interactiv exploration of the different choices of aoutcome measures, leg comparisons and included joint comparisons. 

INSTALLATION

You can run the apps in several ways:

**Run it on the web!**

This shiny app is hosted online at xxx.shinyapp.io... . It does not need R installation and it can be immediately used by just clicking on the link. It only allows for 25 active hours per month. 

If you are familiar with R, we encourage you to install the shiny app locally.

**Run it locally without installation**

You need to download the app from GitHub through R and it will run locally. However, as soon as you will close R, the app will not be available anymore and you need it to download it again. All the packages and dependencies have to be installed first.

install.packages(c("shiny", "shinydashboard"), dependencies = TRUE)

shiny::runGitHub("AnalysisChoiscesOLVH", user="schelin")

**Run it locally with installation**

Save the repository on your local machine. Open either the ui.R or the server.R file with RStudio, then click on "Run App".
