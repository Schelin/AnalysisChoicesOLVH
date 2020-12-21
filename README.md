# AnalysisChoicesOLVH
Supplementary material for manuscript "Analysis choices impact movement evaluation: A multi-aspect inferential method applied to kinematic curves of vertical hops in knee-injured and asymptomatic persons". This ShinyApp allows for a complete and interactiv exploration of the different choices of aoutcome measures, leg comparisons and included joint comparisons. 

## INSTALLATION ##

You can run the app in several ways:

**Run it on the web**

We are currently preparing for the possibility to look at it online without an R installation. 

If you are familiar with R, we encourage you to instead install the ShinyApp locally.

**Run it locally with installation**

Save the repository on your local machine. Open either the ui.R or the server.R file with RStudio, then click on "Run App".

If the app does not run directly, you might need to install the packages "shiny" and "shinydashboard". RStudio will notify you if this is needed. If it still does not run after that, we suggest that you try to update R. 

**Run it locally without installation**

You need to download the app from GitHub through R and it will run locally. However, as soon as you will close R, the app will not be available anymore and you need it to download it again. All the packages and dependencies have to be installed first.

install.packages(c("shiny", "shinydashboard"), dependencies = TRUE)

shiny::runGitHub("AnalysisChoiscesOLVH", user="Schelin")

## ABOUT THE APP ##

When running the ShinyApp, you can make your choices on the left hand side, and the displayed results are organized in the following way:
- The first panel shows the overall results (p-value curve for the multivariate analysis) for the choosen outcome measure, and the chosen combination of joints and legs.
- The second panel shows original data and p-value curves in the sagittal, frontal and transverse plane for Trunk, if Trunk is chosen.
- The third panel shows original data and p-value curves in the sagittal, frontal and transverse plane for Hip, if Hip is chosen.
- The forth panel shows original data and p-value curves in the sagittal, frontal and transverse plane for Knee, if Knee is chosen. 
- The fift panel shows original data and p-value curves in the sagittal, frontal and transverse plane for Ankle, if Ankle is chosen. 
