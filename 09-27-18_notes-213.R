nsamp <- 50
long <- -runif(nsamp, min=65, max=130)
lat <- runif(nsamp, min=25, max=50)
data <- cbind(sample=1:nsamp,
              latitude=round(lat,4),
              longitude=round(long,4),
              in.cont=c(rep(NA, nsamp)),
              in.mile=c(rep(NA, nsamp)),
              location=character(nsamp),
              notes=character(nsamp))
write.csv(data, file="~/Desktop/roadless.csv")


ds = read.csv("~/Documents/Senior_Year/STS\ 213/roadless.csv") 

table(ds$location[ds$incontinent==1])

smallids <- subset(ds, incontinent==1)

rm(ds)

table(smallids$within1mile)

k <- 26
n <- 8 + 26
binom.test(k,n)
