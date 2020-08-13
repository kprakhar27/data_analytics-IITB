library(ggplot2)
#Probability Distribution
z <- seq(-4.6, 4.6, 0.3)
z
q <- seq(0.001, 0.999, 0.001)
q
plot(z)
plot(q)
class(q)
## Probability Distribution / Normalization of data
dStandardNormal <- data.frame(Z=z, 
                              Density=dnorm(z, mean = 0, sd=1),
                              Distribution=pnorm(z,mean=0, sd=1))
ggplot(data = dStandardNormal, aes (x=Z, y=Density)) + #aes = aesthetic
  geom_line(color="blue",size=1.2) +
  geom_point()

qStandardNormal <- data.frame(Q=q, Quantile=qnorm(q, mean = 0, sd=1))
head(qStandardNormal)

ggplot(data = qStandardNormal, aes (x=Q, y=Quantile)) + #aes = aesthetic
  geom_line(color="blue",size=1.2) +
  geom_point()
