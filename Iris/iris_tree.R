library(datasets)
library(caret)
library(ggplot2)
library(randomForest)

data("iris")
View(iris)

is.na(iris)
colnames(iris)

#plotting iris data
qplot(Petal.Width, Sepal.Width, color=Species, cex = 0.5, data=iris)

set.seed(101)
split_data <- sample.split(iris ,SplitRatio = 0.8)
# Training data 80%,value wiil true 
train_data = subset(iris, split_data==T)
# Testing data 20%,value wiil false 
test_data = subset(iris, split_data==F)

# train in caret
Random_Fit <- train (Species~., data=train_data,
                     method="rf",
                     prox=TRUE)
summary(Random_Fit)
predict(Random_Fit, test_data)
print(predict)

clf_tree <- train(Species ~ ., 
                  data=train_data, 
                  method="rpart", 
                  trControl = trainControl(method = "cv"))
library (rpart)
library(rattle)
rpart_clf <- rpart(Species ~ . , data =train_data, method = 'class')
rpart_clf
fancyRpartPlot(rpart_clf, main = "Iris TREE")
