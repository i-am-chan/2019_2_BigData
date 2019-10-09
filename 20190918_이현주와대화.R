setwd('R_Practice_Examples_1')

library(KoNLP)
library(wordcloud2)

jo <- readLines('KakaoTalk_20190918_1019_27_095_2현주 음악미술.txt')
# readLines('조국.txt', encoding='utf-8'??) -> 찾아보자.
# 난 그냥 ANSI 파일로 저장했다.

jo.list <- sapply(jo, extractNoun, USE.NAMES=F)
#View(jo.list)

jo.vector <- unlist(jo.list)
jo.vector <- Filter(function(x) {10 >= nchar(x) & nchar(x) >= 2}, jo.vector)

View(jo.list)

v = c('\\d+', '\\.', ' ', "\\'", "", "오전", "오후", "[2현주 음악미술]", "[김예찬_ Chan]", 
      "현조", "\\[", "(\\^)+", "(ㅋ)+")
for (ch in v) {
  jo.vector <- gsub(ch, '', jo.vector)
}

write(unlist(jo.vector), '이현주와대화_2.txt')
jo.table <- read.table('이현주와대화_2.txt')

wordcount <- table(jo.table)
wordcloud2(wordcount)