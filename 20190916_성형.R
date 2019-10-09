#setwd('R_Practice_Examples_1')

library(KoNLP) # 비상용... python은 더 다양한 한글형태소 분석 패키지가 있어요.
library(wordcloud2)

#useSejongDic()
useNIADic()

data1 <- readLines('remake.txt')
#View(data1)

data2 <- sapply(data1, extractNoun, USE.NAMES=F)
#View(data2)

data3 <- unlist(data2)

v = c('\\d+', '\\.', ' ', "\\'", "하이")
for (ch in v) {
  data3 <- gsub(ch, '', data3)
}

data3 <- gsub('쌍수|쌍커풀', '쌍꺼풀', data3)
data3 <- gsub('메부리코', '매부리코', data3)
data3 <- Filter(function(x) { nchar(x) <= 10}, data3)

write(unlist(data3), 'remake_2.txt')
data4 <- read.table('remake_2.txt')

wordcount <- table(data4)
head(sort(wordcount, decreasing=T), 20)

txt <- readLines('성형gsub.txt')
for (ch in txt) {
  data3 <- gsub(ch, "", data3)
}
data3 <- Filter(function(x) { nchar(x) >= 2}, data3)

write(unlist(data3), 'remake_2.txt')

data4 <- read.table('remake_2.txt')
#View(data4)

wordcount <- table(data4)
wordcloud2(wordcount)
