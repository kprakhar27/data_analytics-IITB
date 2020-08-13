# Primitive Data Type:
a <- 10
print(a)

str_1 <- "This ia string data type"
print(str_1)

str_1 <- 'this is also a string data type'
print(str_1)

num_1 = 12.78
print(num_1)

#Complex Number
comp_1 <- 23+67i
print(comp_1)

#Boolean data can be TRUE or T, False or F
bool_1 <- TRUE
print(bool_1)

class(a)

int_1 = 12L
class(int_1)

##From Numerical to Interger
int_2 = as.integer(a)
class(int_2)

## sum / multiplication
sum_1 = int_1 + int_2
print(sum_1)
typeof(sum_1)

# character
char_1 = 'C'
class(char_1)

# Typecasting
as.character()

## Data Structures
#Vectors:
#collection of homogenous data
vector_1 <- c(12, 34, 45, 67, 66, 89)

print(vector_1[1])

##Mean Median Mode
mean(c(2,4,5,6,7,7,7,8))
median(c(2,4,5,6,7,7,7,8))

## Removing NA values
vec <- c(12,17,22,23,45,55,67,NA,NA,67)

#returns logical value
is.na(vec)
sum(vec, na.rm = T)

mean(vec)
mean(vec, na.rm =T)

#slicing a vector
vec[c(1:4)]
vec[c(1,4)]

##Matrix Data Structure

matrix(1:9, nrow=3,ncol=3)
matrix(1:9, nrow=9,ncol=1)
matrix(1:9, nrow=1,ncol=9)

matrix(c(5,20,10,25,15,30), nrow=2,ncol=3)

## list Data Types / Heterogenous Samples
list_1 <- list("Black","Blue", c(42,36,01),FALSE,73,91,128.6)
print(list_1)

#slicing of the list
list_1[1:3]
list_1[]
x = list_1[1:length(list_1)-1]
print(x)

#Data Frame data structure
#formatted version of list
X <- data.frame("SN" = 1:3, "Age" = c(21,15,34), "Name" = c("Tom","Jerry","Donald"))
print(X)

## include library
library(datasets)
library(ggplot2)

x <- data.frame(a=c(0,1,3,NA), b=c(0,'?',10,11), c = c(NA,0,1,2))
print(x)
mean(x$a,na.rm=T)
x$a = replace(x$a, is.na(x$a), mean(x$a.na.rm <- T))
x
x$b = replace(x$b, is.na(x$b), mean(x$b.na.rm <- T))

#Multiple forms of date
dateString <- "5/082019"
myDate <- as.Date(dateString, format="%d/%m/%y")
class(myDate) # Date
