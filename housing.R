library(ggplot2)
library(corrplot)
library(plotly)
library(reshape2)
library(dplyr)
library(caTools)
library(mlbench)
library(readr)
library(datasets)

#Boston Data Analysis
data("BostonHousing")

#storing the values in housing variables
housing <- BostonHousing
View(housing)

str(housing)
class(housing)

#summary
summary(housing)

#head of boston Housing
head(housing)

#sum of 'na' values
sum(is.na(housing))

#Density & Cont Plot

ggplot(housing , aes(medv)) + geom_histogram(aes(y= ..count.. ), color="black",fill="cyan", bins=30)

ggplot(housing , aes(medv)) + geom_histogram(aes(y= ..density.. ), color="black",fill="cyan", bins=30) + geom_density(color="red",lwd=1)

#Medv Outliers
ggplot(housing , aes(y=medv)) + geom_boxplot(aes(y=medv),outlier.color = "red")

#correlation
#feature selection

cor(select(housing, -chas), method = "pearson")

corrplot(cor(select(housing, -chas), method = "spearman"))

corr <- round(cor(select(housing, -chas), 2))
