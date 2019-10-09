# igraph
# sna

# 1 Graph
install.packages('igraph')
library(igraph)

mat <- matrix(c(1, 1, 1,
                1, 1, 1,
                1, 1, 1), byrow = T, nrow = 3)

g <- graph.adjacency(mat, mode = 'undirected')

plot(g)

adjmatrix <- matrix(c(0, 1, 1, 0,
                      0, 0, 0, 1,
                      0, 0, 0, 1,
                      0, 0, 0, 0), byrow = T, nrow = 4)

g <- graph.adjacency(adjmatrix)

V(g)$name <- c('v1', 'v2', 'v3', 'v4')
V(g)$label.cex = 2
V(g)$label.color = 'black'
V(g)$size = 30
V(g)$color = 'red'
E(g)$width = 3
E(g)$color = 'blue'
plot(g)
E(g)

# 2 Undirected Graph
adjmatrix2 <- matrix(c(0, 1, 0, 0, 0, 0, 0, 0,
                       1, 0, 1, 1, 0, 0, 1, 0,
                       0, 1, 0, 1, 1, 0, 0, 0,
                       0, 1, 1, 0, 1, 1, 0, 0,
                       0, 0, 1, 1, 0, 0, 0, 1,
                       0, 0, 0, 1, 0, 0, 0, 0,
                       0, 1, 0, 0, 0, 0, 0, 0,
                       0, 0, 0, 0, 1, 0, 0, 0), byrow = T, nrow = 8)

g2 <- graph.adjacency(adjmatrix2, mode = 'directed')

V(g2)$name <- c('철수', '갑돌', '영희', '나래',
                '시원', '지윤', '현수', '영숙')
plot(g2, vertext.label.cex = 2, vertex.label.color = 'black',
     vertex.size = 30, vertex.color = 'orange', 
     edge.width = 4)


#3 Weighted Graph
adjmatrix3 <- matrix(c(0, 1, 0, 0, 0, 0,
                       0, 0, 2, 0, 0, 0,
                       0, 0, 0, 0, 3, 0,
                       0, 2, 0, 0, 0, 0,
                       0, 0, 0, 3, 0, 1,
                       0, 0, 0, 0, 0, 0), byrow = T, nrow = 6)

g3 <- graph.adjacency(adjmatrix3, mode = 'directed', weight = T)

V(g3)$name <- c('a', 'b', 'c', 'd', 'e', 'f')

E(g3)$label = E(g3)$weight

E(g3)$width = E(g3)$weight # 가중치에 따라 엣지의 두께를 조절하려면...

plot(g3, vertext.label.cex = 5)

