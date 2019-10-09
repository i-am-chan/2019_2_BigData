setwd('R_Practice_Examples_1')

library(KoNLP)
library(wordcloud2)

jo <- readLines('조국.txt')
# readLines('조국.txt', encoding='utf-8'??) -> 찾아보자.
# 난 그냥 ANSI 파일로 저장했다.

jo.list <- sapply(jo, extractNoun, USE.NAMES=F)
View(jo.list)

jo.vector <- unlist(jo.list)
jo.vector <- Filter(function(x) {10 >= nchar(x) & nchar(x) >= 2}, jo.vector)

View(jo.list)

v = c('\\d+', '\\.', ' ', "\\'", "", "조국", "교수")
for (ch in v) {
  jo.vector <- gsub(ch, '', jo.vector)
}

write(unlist(jo.vector), '조국_2.txt')
jo.table <- read.table('조국_2.txt')

wordcount <- table(jo.table)
wordcloud2(wordcount)