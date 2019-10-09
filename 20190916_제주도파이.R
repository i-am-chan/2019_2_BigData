# setwd()

library(KoNLP)
library(wordcloud2)
library(stringr)

useSejongDic()
mergeUserDic(data.frame(readLines('力林档咯青瘤.txt'), 'ncn'))

txt <- readLines('jeju.txt')
place <- sapply(txt, extractNount, USE.NAMEs=F)

cdata <- unlist(place)
place <- str_replace_all(cdata, '[^[:alpha:]]', '')

place <- gsub(' ', '', place)

txt <- readLines('力林档咯青内胶gsub.txt')

for (ch in txt) {
  place <- gsub(ch, '', place)
}

place <- Filter(function(x) {nchar(x) >= 2}, place)
write(unlist(place), 'jeju_2.txt')
rev <- read.table('jeju_2.txt')
wordcount <- table(rev)

top10 <- head(sort(wordcount, decreading=T), 10)
pie(top10, main='jeju')