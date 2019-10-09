library(sna)

f <- matrix(0, 29, 29)

edge.list <- as.matrix(read.table('°ü°è.txt', sep=' ', header=F))

f[edge.list] <- 1

gplot(f, displaylabels = T)

degree(f)

degree(f, cmode = 'indegree')

degree(f, cmode = 'outdegree')

