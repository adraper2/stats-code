
#latin squares decomposition ordered as:

# C B A D
# D C B A
# A D C B
# B A D C

factor.a <- c(7,8,5,10)
factor.b <- c(8,7,10,12)
factor.c <- c(10,18,11,14)
factor.d <- c(14,11, 9, 10)

latin.vector <- c(c(factor.c[1],factor.b[2],factor.a[3],factor.d[4]),
                c(factor.d[1],factor.c[2],factor.b[3],factor.a[4]),
                c(factor.a[1],factor.d[2],factor.c[3],factor.b[4]),
                c(factor.b[1],factor.a[2],factor.d[3],factor.c[4]))

grand.avg <- mean(c(factor.a,factor.b,factor.c,factor.d))
grand.avg

#by level
mean(factor.a) - grand.avg
mean(factor.b) - grand.avg
mean(factor.c) - grand.avg
mean(factor.d) - grand.avg

#by row
mean(c(factor.c[1],factor.b[2],factor.a[3],factor.d[4])) - grand.avg
mean(c(factor.c[2],factor.b[3],factor.a[4],factor.d[1])) - grand.avg
mean(c(factor.c[3],factor.b[4],factor.a[1],factor.d[2])) - grand.avg
mean(c(factor.c[4],factor.b[1],factor.a[2],factor.d[3])) - grand.avg

#by col
mean(c(factor.c[1],factor.b[1],factor.a[1],factor.d[1])) - grand.avg
mean(c(factor.c[2],factor.b[2],factor.a[2],factor.d[2])) - grand.avg
mean(c(factor.c[3],factor.b[3],factor.a[3],factor.d[3])) - grand.avg
mean(c(factor.c[4],factor.b[4],factor.a[4],factor.d[4])) - grand.avg

#residuals
row.effects <- c(rep(mean(c(factor.c[1],factor.b[2],factor.a[3],factor.d[4])) - grand.avg,4),
                 rep(mean(c(factor.c[2],factor.b[3],factor.a[4],factor.d[1])) - grand.avg,4), 
                 rep(mean(c(factor.c[3],factor.b[4],factor.a[1],factor.d[2])) - grand.avg,4), 
                 rep(mean(c(factor.c[4],factor.b[1],factor.a[2],factor.d[3])) - grand.avg,4))

col.effects <- rep(c(mean(c(factor.c[1],factor.b[1],factor.a[1],factor.d[1])) - grand.avg, 
                     mean(c(factor.c[2],factor.b[2],factor.a[2],factor.d[2])) - grand.avg, 
                     mean(c(factor.c[3],factor.b[3],factor.a[3],factor.d[3])) - grand.avg,
                     mean(c(factor.c[4],factor.b[4],factor.a[4],factor.d[4])) - grand.avg),4)

treatments <- c(mean(factor.a) - grand.avg,
                mean(factor.b) - grand.avg,
                mean(factor.c) - grand.avg,
                mean(factor.d) - grand.avg)

treatment.effects <- c(treatments[3],treatments[2], treatments[1],treatments[4], 
                       treatments[4],treatments[3], treatments[2],treatments[1],
                       treatments[1],treatments[4], treatments[3],treatments[2],
                       treatments[2],treatments[1], treatments[4],treatments[3])

fit <- grand.avg + row.effects + col.effects + treatment.effects
fit

residuals <- latin.vector - fit
residuals


