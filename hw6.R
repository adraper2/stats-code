library(ggplot2)

paper <- read.csv("~/Downloads/hw6-paper.csv")

paper$day <- as.factor(paper$day)
paper$concentration <- as.factor(paper$concentration)

a <- aov(paper$strength ~ paper$day + paper$concentration) 
drop1(a, test = 'F')

summary(a) # just look at residuals

# calculate MSE on your own SS block/factor over SS residual

ggplot(data=paper,aes(x=strength)) + geom_histogram(bins = 5, fill ="white", color="purple")

ggplot(data = paper, aes(x=day, y=strength, color=concentration)) + geom_point()

qplot(concentration, strength, data=paper, color=concentration) + facet_wrap( ~ day, nrow = 1) + theme(legend.position = "none") +
  ggtitle("Paper strength seperated by Day")

