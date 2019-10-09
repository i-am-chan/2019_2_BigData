setwd('R_Practice_Examples_2')

library(devtools)
library(ggmap)
library(dplyr)

ck_data <- read.csv('치킨집_가공.csv') 

str(ck_data)

googleAPIkey <- 'AIzaSyDGzDquzH9g8yPOh811mG4DFpOJ17Pz7pA'
register_google(googleAPIkey)

station_code <- as.character(station_data$'구주소') %>% enc2utf8() %>% geocode()

station_code <- cbind(station_data, station_code)

seodaemun_map <- get_googlemap('seodaemungu', maptype='roadmap', zoom=13)
ggmap(seodaemun_map)
