setwd('R_Practice_Examples_1')

#install.packages('KoNLP', 'wordcloud2')
#install.packages('stringr')

library(KoNLP)
library(wordcloud2)
library(stringr)

useNIADic()
mergeUserDic(data.frame(readLines('力林档咯青瘤.txt'), 'ncn'))

txt <- readLines('jeju.txt')
place <- sapply(txt, extractNoun, USE.NAMES=F)
place

cdata <- unlist(place)
place <- str_replace_all(cdata, '[^[:alpha:]]', '')

place <- gsub(' ', '', place)
txt <- readLines('力林档咯青内胶gsub.txt')
for (ch in txt) {
  place <- gsub(ch, '', place)
}

place <- Filter(function(x) { nchar(x) >= 2 }, place)
write(unlist(place), 'jeju_2.txt')

rev <- read.table('jeju_2.txt')
wordcount <- table(rev)

head(sort(wordcount, decreading=T), 30)