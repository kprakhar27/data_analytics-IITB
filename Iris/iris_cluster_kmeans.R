library(datasets)     # US Arrests
library(tidyverse)    
library(cluster)      # Clustering of data
library(factoextra)   # Visualization of cluster

data("iris")
View(iris)

sum(is.na(iris))

class(iris)
ncol(iris)
colnames(iris)
iris_df <- subset(iris, select = c(1,2,3,4))
iris_df <- scale(iris)

cluster <- kmeans(iris_df, centers = 3, nstart = 10, 
                  iter.max = 10000L)
cluster$centers

distance <- get_dist(iris_df)
fviz_dist(distance, gradient = 
            list(low = "cyan", mid = "white",
                 high = "magenta"))

cluster$tot.withinss
# within the cluster sum of squares
wcss <- function(k) {
  kmeans(iris_df, k, nstart = 10 )$tot.withinss
}

# Compute and plot wss for k = 1 to k = 15
k.values <- 1:15

wcss_values <- map_dbl(k.values, wcss)
print(wcss_values)

plot(k.values, wcss_values,
     type="b", pch = 19, frame = FALSE, 
     xlab="Number of clusters K",
     ylab="Total within-clusters sum of squares")

cluster_1 <- kmeans(iris_df, centers = 3, nstart = 10)
str(cluster_1)

print(cluster_1)

# Display each rows value of cluster
cluster_1$cluster

# Centroids of clusters
cluster_1$centers

# total wcss
cluster_1$tot.withinss
## Visulaization of Cluster
fviz_cluster(cluster_1, data = iris_df)