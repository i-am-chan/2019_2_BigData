install.packages('rvest')

library(rvest)

url <- 'http://www.bobaedream.co.kr/cyber/CyberCar.php?gubun=K&page=1'

usedCar <- read_html(url)

carInfos <- html_nodes(usedCar, css='.tit')

titles <- carInfos %>% html_nodes('a') %>% html_text()

titles

carInfos %>% 
