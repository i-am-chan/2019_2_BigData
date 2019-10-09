setwd('R_Practice_Examples_2')
# D:/GitHub/project_jeju_bus/2019_2_BigData/

# install.packages('readxl')
# install.packages('dplyr')
# install.packages('psych')
library(readxl)
library(dplyr)
library(psych)

dust_list <- read_excel('dustdata.xlsx')
str(dust_list)
# Python Pandas -> .info()랑 유사?

dust_anal <- dust_list %>% filter(area %in% c('성북구', '중구'))
# SQL select랑 유사 or Python Pandas -> df.query('area in (...)')
# dust_anal

count(dust_anal, yyyymmdd) %>% arrange(desc(n))
# yyyymmdd에 따른 데이터 수 파악

count(dust_anal, area) %>% arrange(desc(n))
# area에 따른 데이터 수 파악

dust_anal_area_sb <- subset(dust_anal, area == '성북구')
# dust_anal %>% filter(area %in% c('성북구'))
dust_anal_area_jg <- subset(dust_anal, area == '중구')

describe(dust_anal_area_sb$finedust)
# 성북구 미세먼지량에 대한 기초 통계 

describe(dust_anal_area_jg$finedust)
# 중구~

boxplot(dust_anal_area_sb$finedust, dust_anal_area_jg$finedust,
        main='미세먼지 비교', xlab = '지역', names = c('성북구', '중구'),
        ylab = '미세먼지_PM', col = c('blue', 'red'))

