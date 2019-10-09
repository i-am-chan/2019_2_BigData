setwd('R_Practice_Examples_1')

library(devtools)
library(ggmap)
library(dplyr)

loc <- read.csv('지역별장애인도서관정보.csv', header=T)

googleAPIkey <- 'AIzaSyDGzDquzH9g8yPOh811mG4DFpOJ17Pz7pA'

register_google(googleAPIkey)

kor <- get_googlemap('seoul', zoom=11, maptype='roadmap')

kor_map <- ggmap(kor) + geom_point(data = loc, aes(x = LON, y = LAT), color = 'red', size = 5, alpha = 0.7)

kor_map + geom_text(data = loc, aes(x = LON, y = LAT+0.01, label = 자치구명), size = 3, color = 'red')

