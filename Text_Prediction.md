Data Science Coursera Capstone: Next Word Prediction (SwiftKey Dataset)
========================================================
author: Silvia Romero 
date:  14 July 2019
autosize: false

About
========================================================
- The Next Word Prediction Shiny application can be found [**here**] (https://romesil.shinyapps.io/Text_Prediction/)
- The app takes a set of words from the user, in a text box input and outputs a prediction of the next word (similarly to mobile keyboards apps implemented by Swiftkey), using Natural Language Processing techniques, following the steps below:
- Loads the N-GRAMS metadata files built previously (milestone 1).
- The N-Grams from User's Input are compared with the Stored N-Grams in this order: Quadgram, Trigram, Bigram, until it finds a match.
- If there is no match, the app will return a comment about it.
 
Data used
========================================================
- The data used for this application (only English files) is the Swifkey Company Dataset (texts from blogs, feeds and Twitter):
https://d396qusza40orc.cloudfront.net/dsscapstone/dataset/Coursera-SwiftKey.zip
- Milestone 1 of the project was about Loading, Understanding and Preparing the Data to be used later in a predictive text algorithm.
- The Data was cleaned in the following ways: converting all text to lowercase, removing numbers and punctuation, removing whitespaces and stopwords.
- The Data Cleaned was tokenized as: Unigram, Bigram, Trigram, Quadgram; also called N-Grams. This process serves to construct the predictive models.
- The N-Grams were sorted and metadata stored as a .rds files. These are matrices with frequencies of words, used into the algorithm to predict the next word based on the text entered by the user.

Application functionality
========================================================
- The Shiny application returns (predicts) the next word in a sentence inputed by the user. The predicted word is obtained comparing n-grams matrices (resulting from user's input) with tokenized frequency of 2, 3 and 4 grams sequences taken from the N-GRAM files stored, built in previous milestone.
- The app refreshes the output (word predicted) automatically in sync with user changing input.

![alt text here](screenshot.jpg)
</small>

 
Shiny files
========================================================
The application is built with the Shiny package (http://shiny.rstudio.com), consisting of 2 files:
- `ui.R`
- `server.R`

Both files can be found here: [**here**] (https://github.com/romesil/SilviaApp_Final)







