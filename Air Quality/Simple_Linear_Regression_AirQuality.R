data("airquality")
View(airquality)
names(airquality)
library(ggplot2)

plot(Ozone~Solar.R,data=airquality)

airquality$Ozone

mean.Ozone = mean(airquality$Ozone)
print(mean.Ozone)
mean.Ozone = mean(airquality$Ozone,na.rm = T)
print(mean.Ozone)

abline(h=mean.Ozone)

# lm(): Linear Model
model1 = lm(Ozone~Solar.R,data=airquality)

print(model1)

#abline ()
abline(model1,col="red")
abline(a=18.5987,b=0.1272,col="blue")
par(mfrow=c(1, 2))

termplot(model1)

summary(model1)