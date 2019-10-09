library(ggmap)

df <- head(quakes, 100)
cen <- c(mean(df$long), mean(df$lat))

gc <- data.frame(lon = df$long, lat = df$lat)

gc$lon <- ifelse(gc$lon > 180, -(360-gc$lon), gc$lon)

map <- get_googlemap(center = cen, scale = 1, maptype = 'roadmap', zoom = 5)

ggmap(map, fullpage = T) + geom_point(data=df, aes(x=long, y=lat, size=mag), alpha=0.5)

# https://blog.naver.com/PostView.nhn?blogId=definitice&logNo=221421349302&parentCategoryNo=&categoryNo=40&viewDate=&isShowPopularPosts=true&from=search