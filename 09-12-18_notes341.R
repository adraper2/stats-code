#pmf <- vector(mode="list", length=4)
#names(pmf) <- c("2","3","5","7")
#pmf[[1]]

k <- 1:100
pmf <- choose(100,k) * .75**k * (1-.75)**(100-k)
hist(pmf)
plot(pmf)

