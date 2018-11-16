
dopamine <- read.csv("~/Downloads/hw5-dopamine.csv")

summary(
  aov(Concentration ~ DietControl*DietPhenyl + Error(Patient:DietControl), 
      data = dopamine)
)

f.blocks <- 1296/1006
1-pf(1.288,8,8)

total.ss <- 1740+14580+10368+15680+6480+8044

mean(dopamine$Concentration)*20

boxplot(Concentration ~ DietControl, 
        data = dopamine,
        col= c("blue", "yellow"), 
        xlab="Dietary Control Levels", 
        ylab="Concentration of Dopamine in Urine (micrograms/milligram)",
        main="Dietary Control and Dopmaine Conc.")

boxplot(Concentration ~ DietPhenyl, 
        data = dopamine,
        col= c("green", "orange"),  
        xlab="Dietary Phenylalanine Levels", 
        ylab="Concentration of Dopamine in Urine (micrograms/milligram)",
        main="Dietary Pheny. and Dopmaine Conc.")

interaction.plot(dopamine$DietPhenyl,dopamine$DietControl,dopamine$Concentration)
