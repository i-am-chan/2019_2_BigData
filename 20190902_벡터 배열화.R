# 실행: ctrl+enter
x <- c(1, 2, 3, 4, 5, 6)

m1 <- matrix(x, nrow=2, ncol=3)
m2 <- matrix(x, nrow=2, ncol=3, byrow=T)

m1
m2

# -> 알 수 있는 사실: R은 열우선이다.

y <- x
a1 <- array(y, dim=c(2,2,3))

a1

# -> 알 수 있는 사실: 3차원 배열...?

l1 <- list(c(1, 2, '3'), 'hello')
l1

l2 <- list(id = 10, age = 15, name = 'chan')
l2
l2$name

# -> 알 수 있는 사실: 리스트는 자료형 통일안해도 된다.


ID <- c(1,2,3,4,5,6,7,8,9,10)
SEX <- c('F','M','F','M','F',
         'M','F','M','F','F')
AGE <- c(50, 40, 28, 50, 27,
         23, 56, 47, 20, 38)
AREA <- c('서울', '경기', '제주',
          '서울', '서울', '경기',
          '강원', '인천', '부산',
          '강원')

df <- data.frame(ID, SEX, AGE, AREA)
df

# -> 데이터 프레임

getwd() # working directory 확인
# setwd('~~~') : set working directory
# d:\ (X) d:\\ (O) d:/ (O)
write.table(df, '20190902_test.csv')


#Chap 2. R을 활용한 텍스트 분석 소개 소스코드

txt1 <- "Start R programming with R-LOVE book."
txt1

strsplit(txt1, ' ')

# install.packages('KoNLP')
library(KoNLP) # Python에 비유하면... import KoNLP

txt2 <- "R맹이 책으로 R 프로그래밍을 시작하세요~!"
txt2

strsplit(txt2, ' ')
extractNoun(txt2)

