setwd('R_Practice_Examples_1')

# install.packages('grid')
library(grid)

pop <- read.csv('지역별인구현황_2014_4월기준.csv', header = T)

lon <- pop$LON
lat <- pop$LAT

data <- pop$총인구수

df <- data.frame(lon, lat, data)

map1 <- get_googlemap('Jeonju', zoom = 7, maptype = 'roadmap')

map1 <- ggmap(map1)

map1 + geom_point(aes(x = lon, y = lat, colour = data, size = data), data = df)

