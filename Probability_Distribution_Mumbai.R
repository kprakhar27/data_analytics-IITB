library(ggplot2)
z <- seq(-4.6, 4.6, 0.3)
q <- seq(0.001,0.999,0.001)

plot(z)
class(z)
## Probability Distribution / Normalization of Data 
dStandardNormal <- data.frame(Z=z, 
                            Density=dnorm(z, mean=0, sd=1),
                            Distribution=pnorm(z, mean=0, sd=1))

ggplot(dStandardNormal,aes(x=Z, y=Density)) + 
  geom_line(color="blue", size=1.2) +
  geom_point()


qStandardNormal <- data.frame(Q=q, 
                            Quantile=qnorm(q, mean=0, sd=1))  
head(qStandardNormal)

ggplot(qStandardNormal,aes(x=Q, y=Quantile) + 
  geom_line(color="blue", size=1.2) +
  geom_point()

ggplot(dStandardNormal,aes(x=Z, y=Distribution)) + 
  geom_line(color="blue", size=1.2) +
  geom_point()


  