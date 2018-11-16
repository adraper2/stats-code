
shrimp.df <- read.csv("~/Downloads/7-shrimp.csv")

shrimp.df$temp <- as.factor(shrimp.df$temp)
shrimp.df$salt <- as.factor(shrimp.df$salt)
shrimp.df$density <- as.factor(shrimp.df$density)

summary(
  aov(weight ~ temp * salt * density, data = shrimp.df)
)


par(mfrow = c(1, 2))

by(shrimp.df, shrimp.df[,"temp"],
   function(x) {
     interaction.plot(x$salt, x$density, x$weight)
   }
)
