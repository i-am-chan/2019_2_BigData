library(ggmap)

gc <- geocode(enc2utf8('����'))
cen <- as.numeric(gc)
map <- get_googlemap(center = cen)
ggmap(map)



gc <- geocode(enc2utf8('��û�ϵ� �ܾ籺'))
cen <- as.numeric(gc)
map <- get_googlemap(center = cen, maptype = 'roadmap', marker = gc)

ggmap(map, extent = 'device')



library(ggplot2)

names <- c('1. ������/����',
           '2. ����/������')

addr <- c('��û�ϵ� �ܾ籺 ������ ����� 644-33', '��û�ϵ� �ܾ籺 �ܼ��� ���ϰ��� 1337')

gc <- geocode(enc2utf8(addr))

df <- data.frame(names = names, lon = gc$lon, lat = gc$lat)

cen <- c(mean(df$lon), mean(df$lat))

map <- get_googlemap(center = cen, maptype = 'roadmap', zoom = 11, marker = gc)

ggmap(map) + geom_text(data = df, aes(x=lon, y=lat), size=5, label=df$name)
