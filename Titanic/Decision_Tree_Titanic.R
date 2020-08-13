library(ggplot2)
library(caTools)
library(dplyr)

titanic <- read.csv('D:/data_analytics/Titanic_Data.csv', 
                    header=T, na.strings=c(""))
# Number of columns
ncol(titanic)
nrow(titanic)
View(titanic)

head(titanic)
str(titanic)

# Data Ceaning
# sapply(data, function), is.na(x) returns TRUE for NA
sapply(titanic, function(x) sum(is.na(x)))
# unique value of data
sapply(titanic, function(x) length(unique(x)))

## Missing Value
library(Amelia) 
# missmap function takes data and shows missing values present with a color map
missmap(titanic, main = "Missing Values vs. Observed")

## code to show what happens if we omit na

# df <- na.omit(titanic)
# nrow(df)
# sum(is.na(titanic$Cabin))

#selecting the columns which are required
titanic_df <- subset(titanic, select = c(2,3,5,6,7,8,10,12))
ncol(titanic_df)

missmap(titanic_df, main = "Missing Values vs. Observed")
# number of missing values in new table
sum(is.na(titanic_df$Age))

#calculate mean
avg.age <- mean(titanic_df$Age, na.rm = T)
#value of avg.age
print(avg.age)
#replacing na with avg.age
titanic_df$Age[is.na(titanic$Age)] = avg.age

titanic_df$Age
missmap(titanic_df,main="Missing Values Vs Observed")

# dropping the missing embarked values
titanic_df <- na.omit(titanic_df)
missmap(titanic_df,main="Missing Values Vs Observed")

# new number of rows
nrow(titanic_df)
# number of 'na'
sum(is.na(titanic_df))

# plot of survival based on sex
gg <- ggplot(titanic_df,aes(x=Survived, fill=Sex))

gg + geom_bar(position="dodge") + 
  labs(title = "Titanic - Male vs Female in Each Class")
## survival based on class
ggplot(titanic,aes(x=Pclass,fill=Sex))+
  geom_bar(position="dodge")+
  facet_grid(". ~ Survived") +
  labs(title = "Titanic - Survived vs Not Survived in Each PClass")

# Splitting The Data Sets

split_data <- sample.split(titanic_df ,SplitRatio = 0.8)
# Training data 80%,value wiil true 
train_data = subset(titanic_df, split_data==T)
# Testing data 20%,value wiil false 
test_data = subset(titanic_df, split_data==F)

colnames(train_data)

# caret - collection of alorithms
library(caret)

# data_df <- titanic_df[c()]
# cor(titanic_df)

# Decision Tree Classification
# Model
# fit the model
clf_tree <- train(Survived ~ ., 
                  data=train_data, 
                  method="rpart", 
                  trControl = trainControl(method = "cv"))

summary(clf_tree)

res <- predict(clf_tree ,test_data)
summary(res)
print(res)

#Confusion Matrix
table(res>0.3,test_data$Survived)

library(ROCR)
predicted_val = predict(clf_tree, newdata = test_data)
ROCRPred <- prediction(predicted_val,test_data$Survived)
ROCRPref <- performance(ROCRPred,"tpr","fpr")

# Receiver Operating Characteristic Curve(ROC)
# plot() # abline() # barplot() # hist() # scatterplot()

plot(ROCRPref, colorize=TRUE, print.cutoffs.at=seq(0.1))

plot(clf_tree$finalModel, uniform=TRUE,
     main="Classification Tree")
text(clf_tree$finalModel, use.n.=TRUE, all=TRUE, cex=.8)

library (rpart)
library(rattle)
rpart_clf <- rpart(Survived ~ . , data =train_data, method = 'class')
rpart_clf
fancyRpartPlot(rpart_clf, main = "Titanic TREE")

#*******************************#
## CLUSTERING FOR TITANIC DATA ##
#*******************************#


library(datasets)     # US Arrests
library(tidyverse)    
library(cluster)      # Clustering of data
library(factoextra)   # Visualization of cluster

titanic <- read.csv('D:/data_analytics/Titanic_Data.csv', 
                    header=T, na.strings=c(""))

titanic_cluster <- subset(titanic, select = c(2,3,6,7,8,10))
#df <- scale(iris)

View(titanic_cluster)

#calculate mean
avg.age <- mean(titanic_cluster$Age, na.rm = T)
#value of avg.age
print(avg.age)
#replacing na with avg.age
titanic_cluster$Age[is.na(titanic$Age)] = avg.age

View(titanic_cluster)

cluster <- kmeans(titanic_cluster, centers = 2, nstart = 10, 
                  iter.max = 10000L)
cluster$centers

distance <- get_dist(titanic_cluster)
fviz_dist(distance, gradient = 
            list(low = "cyan", mid = "white",
                 high = "magenta"))

cluster$tot.withinss
# within the cluster sum of squares
wcss <- function(k) {
  kmeans(titanic_cluster, k, nstart = 10 )$tot.withinss
}

# Compute and plot wss for k = 1 to k = 15
k.values <- 1:15

wcss_values <- map_dbl(k.values, wcss)
print(wcss_values)

plot(k.values, wcss_values,
     type="b", pch = 19, frame = FALSE, 
     xlab="Number of clusters K",
     ylab="Total within-clusters sum of squares")

cluster_1 <- kmeans(titanic_cluster, centers = 2, nstart = 10)
str(cluster_1)

print(cluster_1)

# Display each rows value of cluster
cluster_1$cluster

# Centroids of clusters
cluster_1$centers

# total wcss
cluster_1$tot.withinss
## Visulaization of Cluster
fviz_cluster(cluster_1, data = titanic_cluster)

             