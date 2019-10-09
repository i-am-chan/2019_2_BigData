library(igraph)

# setwd('SNA')

supervisor <- read.table('supervisor.txt', sep='\t', dec='.', header=T)

g <- graph.data.frame(supervisor, directed = F)

V(g)$size <- degree(g) / 3

g1 <- delete.vertices(g, V(g)[degree(g) < 3])

E(g1)$color <- ifelse(E(g1)$grade >= 8, 'red', 'gray')

plot(g1)

#V(g)
#E(g)
#degree(g)
#sort(degree(g), decreasing = T)

#set.seed(1101)
#plot(g)

