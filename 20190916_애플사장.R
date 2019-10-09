# setwd()

# install.packages('tm')

library(tm)
library(wordcloud2)

data1 <- readLines('steve.txt')

corp1 <- VCorpus(VectorSource(data1))

corp2 <- tm_map(corp1, stripWhitespace)
corp2 <- tm_map(corp2, tolower)
corp2 <- tm_map(corp2, removeNumbers)
corp2 <- tm_map(corp2, removePunctuation)
corp2 <- tm_map(corp2, PlainTextDocument)

stopword2 <- c(stopwords('en'), 'and', 'but')
corp2 <- tm_map(corp2, removeWords, stopword2)
corp3 <- TermDocumentMatrix(corp2, 
                            control = list(wordLengths=c(1, Inf)))

corp3

findFreqTerms(corp3, 10)
findAssocs(corp3, 'apple', 0.5)

corp4 <- as.matrix(corp3)
corp4

freq1 <- sort(rowSums(corp4), decreasing=T)
freq2 <- sort(colSums(corp4), decreasing=T) #?

#head(freq2, 20)

df = data.frame(name=names(freq1), Freq=data.frame(freq1)$freq1)
# 수정 필요...

wordcloud2(df)
