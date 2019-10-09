# install.packages('googleVis')
library(googleVis)
library(ggplot2)

str(economics) # economics: R에 내장된 학습용 데이터...

motion <- gvisMotionChart(economics, idvar='psavert', timevar='date')
plot(motion)
# ??? -> 작동안함...

str(CityPopularity)
head(CityPopularity)

# 게이지의 측정 데이터(labelvar)는 도시명, 값(numvar)은 인구수, 눈금은 0~1000으로 옵션 지정
gauge <- gvisGauge(CityPopularity, labelvar="City", numvar="Popularity", options=list(min=0, max=1000))
plot(gauge)                          # gauge 변수 값으로 그래프 그리기

# 게이지 색상 영역 설정
Gauge <- gvisGauge(CityPopularity, options=list(min=0, max=1000, greenFrom=800, greenTo=1000, yellowFrom=500, yellowTo=800, redFrom=0, redTo=500, width=400, height=300)) 
plot(Gauge)

ggplot(airquality, aes(x=Day, y=Temp))
ggplot(airquality, aes(x=Day, y=Temp)) + geom_point()

ggplot(airquality, aes(x=Day, y=Temp)) + geom_point(size = 3, color = "red")

ggplot(airquality, aes(x=Day, y=Temp)) + geom_line()

ggplot(airquality, aes(x=Day, y=Temp))+
  geom_line()+
  geom_point()

ggplot(airquality, aes(x=Day, y=Temp)) +
  geom_line(color="red", size=1) +
  geom_point(size=3)

ggplot(mtcars, aes(x= cyl)) + geom_bar(width=0.5)

# aes: 미적요소..?

ggplot(mtcars, aes(x= factor(cyl))) + geom_bar(width=0.5) # -> 빈 범주는 제외하여라.

ggplot(mtcars, aes(x = factor(cyl))) + geom_bar(aes(fill = factor(gear)))

ggplot(mtcars, aes(x = wt, y = mpg)) + geom_point() + annotate('rect', xmin = 3, xmax = 4, ymin = 12, ymax = 21, alpha = 1, fill='skyblue') + annotate('segment', x = 2.5, xend = 3.7, y=10, yend=17, color='red', arrow=arrow()) + annotate('text', x=2.5, y=10, label='point')

ggplot(mtcars, aes(x=gear))+geom_bar() + labs(x='기어수', y='자동차수', title='변속기 기어별 자동차수')

install.packages('devtools')
library(dev)