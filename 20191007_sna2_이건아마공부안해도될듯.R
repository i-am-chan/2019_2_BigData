#install.packages('sna')
library(sna)

# 밀도
ndir <- matrix(0, 5, 5)
ndir.data <- matrix(c(1, 2, 
                      2, 3, 
                      3, 4, 
                      4, 5, 
                      5, 4, 
                      4, 3, 
                      3, 2, 
                      2, 1), 
                    byrow = T, nrow = 8, ncol = 2)

ndir[ndir.data] <- 1

degree(ndir)
degree(ndir, cmode = 'indegree')
degree(ndir, cmode = 'outdegree')

# 추이성
dir <- matrix(0, 5, 5)
dir.data <- matrix(c(1, 2, 1, 3, 1, 4, 2, 3, 2, 5, 3, 2, 3, 4, 3, 5, 4, 3, 4, 5), byrow=T, ncol=2)
dir[dir.data] <- 1
dir
gtrans(dir)

# 상호성
library(sna)
dir <- matrix(0, 5, 5)
dir.data <- matrix(c(1, 2, 1, 3, 1, 4, 2, 3, 2, 5, 3, 2, 3, 4, 3, 5, 4, 3, 4, 5), byrow=T, nrow=10, ncol=2)
dir[dir.data] <- 1
grecip(dir)

# 도댤 가능도
dir <- matrix(0, 5, 5)
dir.data <- matrix(c(1, 2, 1, 3, 1, 4, 2, 3, 2, 5, 3, 2, 3, 4, 3, 5, 4, 3, 4, 5), byrow=T, nrow=10, ncol=2)
dir[dir.data] <- 1
components(dir)

component.dist(dir)
comp.table <- component.dist(dir)
table(comp.table$csize)

# 해밍거리
dir <- matrix(0, 5, 5)
dir.data <- matrix(c(1, 2, 1, 3, 1, 4, 2, 3, 2, 5, 3, 2, 3, 4, 3, 5, 4, 3, 4, 5), byrow=T, nrow=10, ncol=2)
dir[dir.data] <- 1
sedist(dir, method="hamming")

Ham <- equiv.clust(dir, method="hamming", cluster.method="average")
plot(Ham)
