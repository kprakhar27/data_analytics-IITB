library(datasets)
data("airquality")
View(airquality)
names(airquality)

plot(Ozone ~ Solar.R, data=airquality)

airquality$Ozone

mean.Ozone = mean(airquality$Ozone,na.rm = T)
print(mean.Ozone)

#Line Plot
abline(h=mean.Ozone)

# lm(: Linear Model
#Training of the Algorithm
model = lm(Ozone ~ Solar.R, data=airquality)

#intercept of line and coefficients of x
print(model)
summary(model)

#abline()
abline(model,col="red")
abline(a=18.5987,b=0.1272,col="blue")
par(mfrow=c(1,2))

