#install.packages("ggplot2")
#library(ggplot2)

# Assignment Operator 
a <- 10  # assign 10 to 'a'
print(a)
a = 10  # same as above
11 -> a  # assign 10 to 'a'
print(a)
10 = a  # Wrong!. This will try to assign 'a' to 10.

class(a)

# Miscellaneous 
install.packages("ggplot2")  # install package 
library(ggplot2)  # initialize the pkg 'car'
require(ggplot2)  # another way to initialize
library()  # see list of all installed packages
library(help=ggplot2)  # see info about 'car' pkg

#####################################################################
' Variable Types
  character - Strings
  integer - Integers
  numeric - Integers + Fractions
  factor - Categorical variable where each level is a category
  logical - Boolean
  complex - Complex numbers '

' Data Types
  vector - A collection of elements of same class
  matrix - All columns must uniformly contain only one variable type.
  data.frame - The columns can contain different classes.
  list - Can hold objects of different classes and lengths '

# variables
var_1 <- 10
var_2 = 20

class(var_1)

# Data Types in R
# Numeric
num_1 <- 43.89
var1 = 56.78
var2 = 44.01
sum_1 = var1 + var2
print(sum_1)

# String
str_1 = "This is a string data type"
print(str_1)

# integer
int_1 <- 10
int_2 <- 20
class(int_1)
int_1 <- as.integer(10)
class(int_1)
int_2 <- as.integer(10)
class(int_2)

sum_2 <- int_1 * int_2
class(sum_2)
print(sum_2)
print(sum_2 + sum_2)

# integer data type 
b <- as.integer(565)
print(b)

# integer data type
c <- 20000000L
print(c)
class(c)

# Boolean or "logical" 
logic_1 <- TRUE

#typeof is function to check data types of object
typeof(logic_1)
typeof(int_1)
# double data type
typeof(num_1)

num = -45343433
typeof(num)

# Character Data type
char_1 = 'A'
typeof(char_1)

char_2='101'
typeof(char_2)

str_1 = "This is R Programming"
typeof(str_1)

# complex numbers
# 2 - Real , 3 - imaginary number
com_1 = 2+3i

# Factors:


# Typecasting ################################################ 

as.integer()    # converts to integer
as.array()      # convers to array
as.character()  # converts to character/string
as.logical()    # converts to logical values
as.numeric()    # converts to numeric

# Data Structures in R
# Array # Lists # matrix # vectors

# Vectors - Same Data Types
i <- c(0, 5, 7, 12)

j <- c(TRUE, T, F, FALSE)

k <- c("Hello", 'R', "Programming")

print(k[0])

mean(c(2,3,4))
mean(c(12,3,4,10))
sum(c(2,2,2,10,23,44,32))
max(c(2,2,2,10,23,44,32))
min(c(2,2,2,10,23,44,32))

vec <- c(12,17,22,23,45,55,67,NA,NA,67)

# removing NA
sum(vec, na.rm = TRUE)
mean(vec, na.rm = TRUE)

# To check NA Values
is.na(vec)

vec_1 <- c(10, 20, 15, 40, 29)  # numeric vector
vec_2 <- c("a", "b", "c", NA)  # character vector
vec_3 <- c(TRUE, FALSE, TRUE, TRUE)  # logical vector
vec_4 <- gl(4, 1, 4, label = c("l1", "l2", "l3", "l4"))  # factor with 4 levels
print(vec_4)
class(vec_4)

logic_1 <- vec_1 < 15  # create a logical vector, TRUE if value < 15
class(logic_1)
print(logic_1)

vec_1[logic1]  # elements in TRUE positions will be included in subset
vec_1[1:2]  # returns elements in 1 & 2 positions.
vec_1[c(1,3)]  # returns elements in 1 & 3 positions
vec_1[-1]  # returns all elements except in position 1

# vector splitting
vec_2[1:-2]

# sorting a vector
sort(vec_1)
length(vec_1)

## Sampling  ############################################

sample(vec_1)   # sample returns random shuffling of vect_1 data.
set.seed(100)   # seed - to fix randomization.
s_data <- sample(vec_1) 
print(s_data)

sample(vec_1, 3)  # sample 3 elem without replacement
sample(vec_1, 10, replace=T)  # sample with replacement (replace = TRUE)

# Subsetting A Vector
# index = values
remain <- c("spades"=11,"hearts"=12,"diamonds"=13,"clubs"=14)
print(remain['spades'])

# To remove NA Values from Vector
vec1 <- c(23,47,72,13,40,75,67,NA,NA,88)

vec2 <- vec1[!is.na(vec1)]
print(vec2)
# Display multiple values of vector
vec2[c(1, 2, 4)]

vec3 = vec2[c(3, 4, 6)]
print(vec3)
is.vector(vec3)

# MATRIX Data Types ####################################################
matrix(1:9, nrow = 3)
matrix(1:12, ncol = 4)
matrix(1:6, ncol = 2, byrow=TRUE)

matrix(1:3, nrow = 3, ncol = 3)

# Column-wise 
cbind(1:4, 1:4)
# Row-wise
rbind(1:4, 1:4)

# LISTS Data Types
# Hetrogeneous Data Types
alist <- list("Black","Blue", c(42,36,01),FALSE,73.91,128.6)

alist[1:3]
print(alist[[1]])

alist

# Data Frame
# columns & rows
x <- data.frame("SN" = 1:2, "Age" = c(21,15), "Name" = c("Tom","Jerry"))
x
# data frame with repeat
x_df <- data.frame("SN" = 1:4, "Age" = c(21,15), "Name" = c("Tom","Jerry"))
x_df

# Data Frame
values <- c(10,20,30,40,50,60)
Items <- c('book','pen','textbook','pencil_store','colors','bag')

data1 <- data.frame(values,Items)
print(data1)

ID <- c(001,002,003,004,005,006)
# 
data2 <- data.frame(ID,values,Items)
print(data2)

names(data2) <- c('Id','Items Count','Items')
print(data2)

###############################################################
## Built-In Datasets

library(datasets)
library(help="datasets")        # Display all the in-built datasets

class(airquality)
sapply(airquality, class)       # Get class of all columns
str(airquality)                 # structure
head(airquality)
summary(airquality)
fix(airquality)                 # view spreadsheet like grid
rownames(airquality)            # row names
colnames(airquality)            # columns names
nrow(airquality)                # number of rows
ncol(airquality)                # number of columns

# Box & wiscker 
boxplot(airquality$Ozone, airquality$Temp)

# Homogeneos Data Type - Vector
str_1 = c('A','B','C',"D",'E')
print(str_1)

is.na()

# if condition
val <- 10
if (val > 1) {
  print("Value is greater than 10")
}

# If else condition

X = -10
if(X < 0) {
  print("x is a negative value")
  }else {
    print("x is either +ve or zero value")
}

i = 1
while (i<10){
  print(i)
  i = i+1
}

num = as.integer(readline(prompt="Enter a number: "))
print(num)

#Replace - Data Cleaning
x <- data.frame(a=c(0,1,3,NA), b=c(0,'?',10,11), c = c(NA,0,1,2))
x
x$a = replace(x$a, is.na(x$a), 0)
x
x$b = replace(x$b,c(2), 0)
x

# apply(X, MARGIN, FUN)
m1 <- matrix(c(1:10),nrow=5, ncol=6)
print(m1)

a_m1 <- apply(m1, 2, sum)
print(a_m1)

a_m2 <- apply(m1, 2, mean)
print(a_m2)

a_m3 <- apply(m1, 2, median)
print(a_m3)

# lapply
l_data <- lapply(m1, mean)
l_data [0:1]

movies <- c("SPYDERMAN","BATMAN","VERTIGO","CHINATOWN")
movies_lower <-lapply(movies, tolower)
str(movies_lower)

movies_lower <- unlist(lapply(movies,tolower))
str(movies_lower)

## sapply() function does the same jobs as lapply() function but returns a vector
dt <- cars
print(dt)
lmn_cars <- lapply(dt, max)
smn_cars <- sapply(dt, max)
lmn_cars
smn_cars

avg <- function(x) {  
  ( min(x) + max(x) ) / 2 }
fcars <- sapply(dt, avg)
fcars

data(iris)

tapply(iris$Sepal.Width, iris$Species, median)

tapply(iris$Sepal.Width, iris$Species, mean)


#### DEALING WITH DATE #########################################

dateString <- "15/08/2019"
myDate <- as.Date(dateString, format="%d/%m/%Y")
class(myDate)  # "Date"

dateString <- "15-08-2019"
myDate <- as.Date(dateString, format="%d-%m-%Y")

myPOSIXltDate <- as.POSIXlt(myDate)
class(myPOSIXltDate)  # POSIXlt
myPOSIXctDate <- as.POSIXct(myPOSIXltDate)  # convert to POSIXct
print(myPOSIXctDate)
class(myPOSIXctDate)

attributes(myPOSIXltDate)  # Best
unclass(myPOSIXltDate)  # Works!
names(myPOSIXltDate)  # Doesn't work on a POSIXlt object
unlist(myPOSIXltDate)  # Works!

################################################################

my_dataframe <- data.frame(airquality)

table(my_dataframe)

# subsetting data frame
subset(airquality, Day == 1, select = -Temp)  # select Day=1 and exclude 'Temp'
airquality[which(airquality$Day==1), -c(4)]  # same as above

# splitting dataset 
set.seed(100)
trainIndex <- sample(c(1:nrow(airquality)), size=nrow(airquality)*0.7, replace=F)  # get test sample indices
airquality[trainIndex, ]  # training data
airquality[-trainIndex, ]  # test data

