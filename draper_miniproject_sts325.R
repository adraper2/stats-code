# Aidan Draper
# Mini project 1
# September 30, 2018

library(ggplot2)

bubbles <- read.csv("~/Documents/Senior_Year/STS 213/bubbles.txt", sep="")

mean(bubbles$time)

mean.recipe <- aggregate(bubbles$time~bubbles$color, FUN=mean)
sd.recipe <- aggregate(bubbles$time~bubbles$color, FUN=sd)


# for decomposition table
mean.recipe$`bubbles$time` - mean(bubbles$time)

sum(mean.recipe$`bubbles$time` - mean(bubbles$time)) # does it sum to 1


levels(mean.recipe$`bubbles$color`) <- c("2","1.5","0.5","0","1")

# calculate residuals
with(bubbles, bubbles[order(color), 3]) - c(rep(mean.recipe$`bubbles$time`[4], 5), rep(mean.recipe$`bubbles$time`[3], 5), rep(mean.recipe$`bubbles$time`[5], 5), rep(mean.recipe$`bubbles$time`[2], 5), rep(mean.recipe$`bubbles$time`[1], 5))

# is this equal to zero?
sum(with(bubbles, bubbles[order(color), 3]) - c(rep(mean.recipe$`bubbles$time`[4], 5), rep(mean.recipe$`bubbles$time`[3], 5), rep(mean.recipe$`bubbles$time`[5], 5), rep(mean.recipe$`bubbles$time`[2], 5), rep(mean.recipe$`bubbles$time`[1], 5)))


# ANOVA test
fit <- aov(time ~ color, data=bubbles)
fit


# VISUALS
levels(bubbles$color) <- c("2","1.5","0.5","0","1")
bubbles$color <- factor(bubbles$color, levels = c("0", "0.5", "1", "1.5", "2"))

# graphs
ggplot(data=bubbles, aes(x=color, y=time, color=color)) + geom_bar(stat="identity")
ggplot(data=bubbles, aes(x=time)) + geom_histogram(binwidth = 30) + 
  geom_vline(aes(xintercept=mean(time)), color="blue", linetype="dashed", size=1) +
  labs(title = "Distribution of Times for the Bubble Recipes", x="Time (in seconds)", y="Frequency per bin (width = 30)")

ggplot(data=bubbles, aes(x=time, color=color, fill=color)) +
  geom_histogram(position="dodge",binwidth = 100)+
  theme(legend.position="top")

ggplot(data=bubbles, aes(x=color, y=time, color = color)) + 
  geom_boxplot() + scale_color_manual(values=c("red", "yellow", "orange", "green","blue")) +
  labs(title = "Boxplots for each Recipe's Bubble Lifespan Distribution", x="Amt. of Glycerin (in tbsp)", y="Time (seconds)",color="Recipe")

