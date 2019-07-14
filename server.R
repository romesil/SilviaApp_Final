## Capstone: Coursera Data Science
## Final Project: Predictive Text Analytics

# SHINY SERVER 
library(shiny); library(stringr); library(tm)

# Loading bigram, trigram and quadgram frequencies words matrix frequencies, built in Project first Milestone
bg <- readRDS("bigram.RData"); tg <- readRDS("trigram.RData"); qd <- readRDS("quadgram.RData")

names(bg)[names(bg) == 'word1'] <- 'w1'; names(bg)[names(bg) == 'word2'] <- 'w2';
names(tg)[names(tg) == 'word1'] <- 'w1'; names(tg)[names(tg) == 'word2'] <- 'w2'; names(tg)[names(tg) == 'word3'] <- 'w3';
names(qd)[names(qd) == 'word1'] <- 'w1'; names(qd)[names(qd) == 'word2'] <- 'w2'; names(qd)[names(qd) == 'word3'] <- 'w3'
names(qd)[names(qd) == 'word4'] <- 'w4';
message <- "" ## cleaning message

## Predict Next Word (via 'tm' library):
predictNW <- function(wordI) {
  word_add <- stripWhitespace(removeNumbers(removePunctuation(tolower(wordI),preserve_intra_word_dashes = TRUE)))
  wordI <- strsplit(word_add, " ")[[1]]
  n <- length(wordI)
  
  ########### depending on 'n' value, we'll use Quadgram, Trigram or Bigram
  ####### Bigram
  if (n == 1) {wordI <- as.character(tail(wordI,1)); functionBigram(wordI)}
  
  ####### Trigram
  else if (n == 2) {wordI <- as.character(tail(wordI,2)); functionTrigram(wordI)}
  
  ####### Quadgram
  else if (n >= 3) {wordI <- as.character(tail(wordI,3)); functionQuadgram(wordI)}
}
########################################################################
functionBigram <- function(wordI) {
  if (identical(character(0),as.character(head(bg[bg$w1 == wordI[1], 2], 1)))) {
    message<<-"No word found" 
    as.character(head(" ",1))
  }
  else {
    message <<- "Prediction via Bigram Frequency Matrix"
    as.character(head(bg[bg$w1 == wordI[1],2], 1))
  }
}
########################################################################
functionTrigram <- function(wordI) {
  if (identical(character(0),as.character(head(tg[tg$w1 == wordI[1]
                                                  & tg$w2 == wordI[2], 3], 1)))) {
    as.character(predictNW(wordI[2]))
  }
  else {
    message<<- "Prediction via Trigram Frequency Matrix"
    as.character(head(tg[tg$w1 == wordI[1]
                         & tg$w2 == wordI[2], 3], 1))
  }
}
########################################################################
functionQuadgram <- function(wordI) {
  if (identical(character(0),as.character(head(qd[qd$w1 == wordI[1]
                                                  & qd$w2 == wordI[2]
                                                  & qd$w3 == wordI[3], 4], 1)))) {
    as.character(predictNW(paste(wordI[2],wordI[3],sep=" ")))
  }
  else {
    message <<- "Prediction via Quadgram Frequency Matrix"
    as.character(head(qd[qd$w1 == wordI[1] 
                         & qd$w2 == wordI[2]
                         & qd$w3 == wordI[3], 4], 1))
  }       
}
#################################################

## ShineServer code to call the function predictNW
shinyServer(function(input, output) {
  output$prediction <- renderPrint({
    result <- predictNW(input$inputText)
    output$sentence2 <- renderText({message})
    result
  });
  output$sentence1 <- renderText({
    input$inputText});
}
)
