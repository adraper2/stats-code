chemicals <- read.csv("~/Downloads/7-chemicals.csv")
View(chemicals)

chemicals$batch <- as.factor(chemicals$batch)
chemicals$catalyst <- as.factor(chemicals$catalyst)

a <- aov(chemicals$time ~ chemicals$batch + chemicals$catalyst) 
drop1(a, test = 'F')

summary(a) # just look at residuals

# calculate MSE on your own SS block/factor over SS residual

### 2^k design
shrimp.df <- read.csv("~/Downloads/7-shrimp.csv")

shrimp.df$temp <- as.factor(shrimp.df$temp)
shrimp.df$salt <- as.factor(shrimp.df$salt)
shrimp.df$density <- as.factor(shrimp.df$density)
summary(
  aov(weight ~ temp * salt * density, data = shrimp.df)
)

mean(shrimp.df$weight)


