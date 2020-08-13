library(ggplot2)
library(caTools)
library(dplyr)
titanic <- read.csv('D:/data_analytics/Titanic_Data.csv', header = T, na.strings = c(""))

#number of columns
ncol(titanic)
nrow(titanic)
View(titanic)
