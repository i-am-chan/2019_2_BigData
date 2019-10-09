# install.packages('dplyr')
# install.packages('devtools')
# install.packages('ggmap')

setwd('R_Practice_Examples_1')

library(ggmap)
library(devtools)
library(dplyr)
library(stringr)

googleAPIkey <- 'AIzaSyDGzDquzH9g8yPOh811mG4DFpOJ17Pz7pA'

register_google(googleAPIkey)

loc <- read.csv('서울_강동구_공영주차장_위경도.csv', header = T)

kd <- get_map('Amsa-dong', zoom = 13, maptype = 'roadmap')

kdmap <- ggmap(kd) + geom_point(data=loc, aes(x=LON, y=LAT), size = 3, alpha = 0.7, color = 'red')

kdmap + geom_text(data=loc, aes(x=LON, y=LAT+0.001, label = 주차장명), size=3)

loc2 <- str_sub(loc$주차장명, start = -2, end = -2)

colors <- c()
for (i in 1:length(loc2)) {
  if (loc2[i] == '구') {
    colors <- c(colors, 'red')
  } else {
    colors <- c(colors, 'blue')
  }
}

kd <- get_map('Amsa-dong', zoom = 13, maptype = 'roadmap')

kdmap <- ggmap(kd) + geom_point(data=loc, aes(x=LON, y=LAT), size = 3, alpha = 0.7, color = colors)

kdmap + geom_text(data=loc, aes(x=LON, y=LAT+0.001, label = 주차장명), size=3)
