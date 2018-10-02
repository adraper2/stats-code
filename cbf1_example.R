library(ggplot2)
library(gridExtra)

coffee <- read.csv("~/Downloads/4 - coffee trees (1).txt", sep="")

plot(coffee$yield, by=coffee$location)


p1 <- ggplot(data=coffee, aes(x=as.factor(location), y=yield)) + geom_point()


p2 <- ggplot(data=coffee, aes(x=as.factor(density), y=yield)) + geom_point()

grid.arrange(p1,p2)



# for benchmark decomposition
mean(coffee$yield)

aggregate(coffee$yield~as.factor(coffee$location),FUN=mean)
aggregate(coffee$yield~as.factor(coffee$density),FUN=mean)

block.effect <- c(3,3,3,3,-4,-4,-4,-4,1,1,1,1)

factor.effect <- c(2,1,-1,-2,2,1,-1,-2,2,1,-1,-2)

fit <- 21 + block.effect + factor.effect

coffee$yield - fit
