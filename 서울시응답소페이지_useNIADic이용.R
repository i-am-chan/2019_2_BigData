setwd('R_Practice_Examples_1')

library(KoNLP) # 비상용... python은 더 다양한 한글형태소 분석 패키지가 있어요.
library(wordcloud2)

#useSejongDic()
useNIADic()
mergeUserDic(data.frame('택시', 'ncn'))
# ncn: 서술명사...

data1 <- readLines('seoul_new.txt')
# txt 파일에 문제가 있나요? UTF-8 인코딩 시도...
# data1은 list이므로 sapply()
data2 <- sapply(data1, extractNoun, USE.NAMES = F)
data3 <- unlist(data2)

v <- c('\\d+', ' ', '-', '서울시|서울', '요청', '제안', '님', 'OO',  
       '관련', '개선', '구', '문제', '민원', '설치', '건의', '들', '장', '한')

for (ch in v) {
  data3 <- gsub((ch), '', data3)
}

# unlist는 vector로 만들어라...
write(unlist(data3), 'seoul_new_v2.txt')
data4 <- read.table('seoul_new_v2.txt')
# 변수명 지정안하고 read해서 칼럼명이 임의로 V1이 된다...
wordcount <- table(data4)

s = sort(wordcount, decreasing=T) # 나만의 비법...
wordcloud2(s)
