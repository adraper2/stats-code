blades <- read.csv("~/Downloads/8-blades.csv")

blades$Angle <- as.factor(blades$Angle)
blades$Speed <- as.factor(blades$Speed)

a <- aov(Lifetime ~ Angle + Speed + Angle * Speed, data = blades)
TukeyHSD(a, conf.level = .95)
