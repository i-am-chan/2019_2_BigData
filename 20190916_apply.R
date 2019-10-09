ma1 <- matrix(rep(seq(4), 4), ncol=4)
# seq(4) = 1,2,3,4
ma1

apply(ma1, 1, sum)
apply(ma1, 2, sum)

sum.plus.2 <- function(x) {
  sum(x) + 2
}

apply(ma1, 1, sum.plus.2)

apply(ma1, 1, function(x) sum(x) + 5)

apply(ma1, 1, function(x, y) sum(x) + y, y = 3)

sum.plus.n <- function(x, n) {
  sum(x) + n
}

apply(ma1, 1, sum.plus.n, n = 10)
