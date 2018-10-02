# Aidan Draper
# September 30, 2018
# R Code for Hand-In HW3

#INPUT PARAMETERS
alpha = 0.05
hw <- c(189,287,199,270,276,306,206,305,110,298)

mean(hw)

#setup
conf.level <- 1-(alpha/2) # for two-sided
error <- qt(conf.level,df=length(hw)-1)*sd(hw)/sqrt(length(hw))
error

#interval
left <- mean(hw)-error
right <- mean(hw)+error

cat("We are 95% confident that the population mean falls between",left,"and", right)

