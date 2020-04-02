library(datasets)
library(help=datasets)
class(airquality)

sapply(airquality, class) #get class of all columns
X = airquality[2:length(airquality)]
Y = airquality[1]

str(airquality)   # structure
summary(airquality)  # summary of data frame

View(airquality)  #to display data frame in spreadsheet

head(airquality)  #to display first 6 rows
tail(airquality)  #to display last 6 rows

rownames(airquality)   # row names
colnames(airquality)   # column names

nrow(airquality)  # number of rows
ncol(airquality)  # number of columns

airquality[c('Ozone','Temp')]

#Boxplot & Whisker
boxplot(airquality$Ozone, airquality$Temp)
boxplot(airquality)

is.na(airquality)
