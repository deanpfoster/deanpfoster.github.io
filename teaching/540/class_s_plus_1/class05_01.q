x1 <- c(1,1,1,1)
x2 <- c(1,3,4,5)


x <- cbind(x1,x2)

y <- c(1,3,6,2)

my.Q <- qr.Q(qr(x),complete=T)
my.R <- qr.R(qr(x),complete=T)

