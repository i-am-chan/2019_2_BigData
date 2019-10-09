setwd('R_Practice_Examples_2')
# D:/GitHub/project_jeju_bus/2019_2_BigData/

# install.packages('readxl')
# install.packages('dplyr')
# install.packages('treemap')
library(readxl)
library(dplyr)
library(treemap)

ck_store_list <- read_xlsx('치킨집_가공.xlsx')
# head(ck_store_list)

addr <- substr(ck_store_list$소재지전체주소, 12, 16)
# substr() 대신 Python split()과 같은 함수가 있는지 조사해야 될듯.

addr <- gsub('[0-9]', '', addr)
addr <- gsub(' ', '', addr)

addr_count <- addr %>% table() %>% data.frame()
addr_count <- arrange(addr_count, desc(Freq))
treemap(addr_count, index='.', vSize='Freq', title='서대문구 동별 치킨집 분표')

# addr_count <- data.frame(table(addr))
# addr_count <- arrange(addr_count, desc(Freq))
# treemap(addr_count, index='addr', vSize='Freq', title='서대문구 동별 치킨집 분표')