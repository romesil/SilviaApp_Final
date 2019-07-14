## Capstone: Coursera Data Science
## Final Project - Predictive Text Analytics
# user-interface definition of a Shiny web application
# Find out more about building applications with Shiny here:
#    http://shiny.rstudio.com/

# Predict the next word after an user's input phrase
# Based on Swiftkey Dataset, that have been cleansed and tokenized in the first milestone of this project (week 2 capstone)

library(shiny)
library(markdown)
  
# Define UI for application for the Text Prediction, text inputed by user
shinyUI(fluidPage(
  
  # Application title
  titlePanel("Predicting Next Word"),
  
  # Sidebar with options selectors 
  sidebarLayout(
    sidebarPanel(
      helpText("Enter a Word, Text or Sentence and this app will try to predict next word in the sequence"),
      hr(),
      textInput("inputText", "Enter Word/Text/Sentence Here",value = "")
    ),
    
    # Show a plot with diamonds and regression line
    mainPanel(
      h2("Next Word Predicted"),
      verbatimTextOutput("prediction"),
      strong("Word / Text / Sentence Entered:"),
      strong(code(textOutput('sentence1'))),
      br(),
      strong("Next Word Predicted based on N-GRAMS search:"),
      strong(code(textOutput('sentence2')))
    )
  )
))
