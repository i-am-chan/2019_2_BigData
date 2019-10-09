library(ggmap)

gc <- geocode(enc2utf8('¼­¿ï'))
cen <- as.numeric(gc)
map <- get_googlemap(center = cen)
ggmap(map)



gc <- geocode(enc2utf8('ÃæÃ»ºÏµµ ´Ü¾ç±º'))
cen <- as.numeric(gc)
map <- get_googlemap(center = cen, maptype = 'roadmap', marker = gc)

ggmap(map, extent = 'device')



library(ggplot2)

names <- c('1. µµ´ã»ïºÀ/¼®¹®',
           '2. ±¸´ã/¿Á¼øºÀ')

addr <- c('ÃæÃ»ºÏµµ ´Ü¾ç±º ¸ÅÆ÷À¾ »ïºÀ·Î 644-33', 'ÃæÃ»ºÏµµ ´Ü¾ç±º ´Ü¼º¸é ¼±¾Ï°è°î·Î 1337')

gc <- geocode(enc2utf8(addr))

df <- data.frame(names = names, lon = gc$lon, lat = gc$lat)

cen <- c(mean(df$lon), mean(df$lat))

map <- get_googlemap(center = cen, maptype = 'roadmap', zoom = 11, marker = gc)

ggmap(map) + geom_text(data = df, aes(x=lon, y=lat), size=5, label=df$name)
