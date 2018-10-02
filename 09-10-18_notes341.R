heads <- 1:10
formula <- choose(10,heads)/(2**10)
formula

sum(formula)

plot(formula)

formula[3]

heads2 <- 6:10
sum(choose(10,heads2)/(2**10))
