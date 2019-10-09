setwd('R_Practice_Examples_1')
# install.packages('KoNLP')
#install.packages('wordcloud2')

library(KoNLP)
library(wordcloud2)

useNIADic()

data1 <- readLines('seoul_new.txt')

data1

data2 <- sapply(data1, extractNoun, USE.NAMES = F)
# sapply(): 각 줄마다 일괄 apply해라.

data2[1]
data2[2]

head(data2, 10)
head(unlist(data2), 30)
tail(unlist(data2), 30)

# unlist(): 리스트를 더 보기 좋게 만들어준다...

data3 <- unlist(data2)
data3

# gsub():쓸데기 없는 명사를 제거하자.
# gsub(변경전 글자, 변경후 글자, 원본데이터)

data3 <- gsub('\\d+', '', data3)
data3 <- gsub('서울시|서울', '', data3)
data3 <- gsub('요청|제안', '', data3)
data3 <- gsub(' ', '', data3)
data3 <- gsub('-', '', data3)

write(unlist(data3), 'seoul_2.txt')

data4 <- read.table('seoul_2.txt')
data4

wordcount <- table(data4)
