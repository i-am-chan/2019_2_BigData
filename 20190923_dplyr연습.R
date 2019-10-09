setwd('R_Practice_Examples_2')

library(readxl)

exdata1 <- read_excel('Sample1.xlsx')
#exdata1#str(exdata1)

library(dplyr)

exdata1 <- rename(exdata1, Y17_AMT = AMT17, Y16_AMT = AMT16)
#exdata1

exdata1$AMT <- exdata1$Y17_AMT + exdata1$Y16_AMT

exdata1$CNT <- exdata1$Y17_CNT + exdata1$Y16_CNT

exdata1$AGE50_YN <- ifelse(exdata1$AGE >= 50, 'Y', 'N')

exdata1$AGE_GR10 <- ifelse(exdata1$AGE >= 50, 'A1.50++',
                           ifelse(exdata1$AGE >= 40, 'A2.4049',
                                  ifelse(exdata1$AGE >= 30, 'A3.3039',
                                         ifelse(exdata1$AGE >= 20, 'A4.2029', 'A5.0019'))))

exdata1 %>% select(ID)
exdata1 %>% select(ID, AREA, Y17_CNT)
exdata1 %>% select(-AREA)
exdata1 %>% select(-AREA, -Y17_CNT)

exdata1 %>% filter(AREA == '서울')
exdata1 %>% filter(AREA == '서울' & Y17_CNT >= 10)
exdata1 %>% arrange(desc(Y17_AMT))

exdata1 %>% arrange(AGE)
exdata1 %>% arrange(desc(AGE))

exdata1 %>% summarize(TOT_Y17_AMT = sum(Y17_AMT))
# <=> exdata1 %>% summarise(TOT_Y17_AMT = sum(Y17_AMT))

exdata1 %>% group_by(AREA) %>% summarise(SUM_Y17_AMT = sum(Y17_AMT))
