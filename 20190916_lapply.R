mat1 <- matrix(rep(1:4, 4), ncol=4)

mat1.df <- data.frame(mat1)

is.list(mat1.df)
# IF T -> lapply() 적용 가능.

lapply(mat1.df, sum)

y <- lapply(mat1.df, sum)
is.list(y)

names(y)

y[1]

# 아래 2 expression은 동치.
y[[1]]
y$X1

y[1:2]

unlist(lapply(1:5, function(i) print(i)))

