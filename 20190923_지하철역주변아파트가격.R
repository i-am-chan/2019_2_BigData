setwd('R_Practice_Examples_2')

# install.packages('devtools')
# 권장하지 않는 ggmap 설치법: install_github('dkahle/ggmap') 하단 URL 참고
# https://github.com/dkahle/ggmap/issues/268
# install.packages('ggmap')

library(devtools)
library(ggmap)
library(dplyr)

station_data <- read.csv('역별_주소_및_전화번호.csv') 
# 파일명이 이상하다... 역명_구주소... 전화번호는 없는데...

str(station_data)

station_code <- as.character(station_data$'구주소')

googleAPIkey <- 'AIzaSyDGzDquzH9g8yPOh811mG4DFpOJ17Pz7pA'
register_google(googleAPIkey)

station_code <- as.character(station_data$'구주소') %>% enc2utf8() %>% geocode()
station_code <- cbind(station_data, station_code)

apart_data <- read.csv('아파트_실거래가_20180526.csv')

apart_data$전용면적 = round(apart_data$전용면적)

count(apart_data, 전용면적) %>% arrange(desc(n))

apart_data_85 <- subset(apart_data, 전용면적 == 85)

apart_data_85$거래금액 <- gsub(',', '', apart_data_85$거래금액)

apart_data_85_cost <- aggregate(as.integer(거래금액) ~ 단지명, apart_data_85, mean)

apart_data_85_cost <- rename(apart_data_85_cost, '거래금액' = 'as.integer(거래금액)')

apart_data_85 <- apart_data_85[!duplicated(apart_data_85$단지명)]

apart_data_85 <- left_join(apart_data_85, apart_data_85_cost, by = '단지명')

apart_data_85 <- apart_data_85 %>% select('단지명', '시군구', '번지', '전용면적', '거래금액.y')

apart_data_85 <- rename(apart_data_85, '거래금액' = '거래금액.y')

apart_address <- paste(apart_data_85$'시군구', apart_data_85$'번지') %>% data.frame()

apart_address <- rename(apart_address, '주소' = '.')

apart_address_code <- as.character(apart_address$'주소') %>% enc2utf8() %>% geocode()

apart_code_final <- cbind(apart_data_85, apart_address, apart_address_code) %>% select('단지명', '전용면적', '거래금액', '주소', lon, lat)

mapo_map <- get_googlemap('mapogu', maptype = 'roadmap', zoom = 12)
ggmap(mapo_map)

# install.packages('ggplot2')
library(ggplot2)
ggmap(mapo_map) + 
  geom_point(data = station_code, aes(x = lon, y = lat), colour = 'red', size = 3) +
  geom_text(data = station_code, aes(label = 역명, vjust = -1))

hongdae_map <- get_googlemap('hongdae station', maptype = 'hybrid', zoom = 15)

ggmap(hongdae_map) +
  geom_point(data = station_code, aes(x = lon, y = lat), colour = 'red', size = 3) +
  geom_text(data = station_code, aes(label = 역명, vjust = -1)) +
  geom_point(data = apart_code_final, aes(x = lon, y = lat)) +
  geom_text(data = apart_code_final, aes(label = 단지명, vjust = -1)) +
  geom_text(data = apart_code_final, aes(label = 거래금액, vjust = 1))

# cbind
# rbind 
# 조사 -철수

# maptype = 'roadmap', 'hybird', 'satellite'