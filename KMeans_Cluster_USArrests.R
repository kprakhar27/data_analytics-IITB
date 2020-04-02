library(datasets)
library(tidyverse)
library(cluster)
library(factoextra)       # Visualization of clustering

data("USArrests")
View(USArrests)

sum(is.na(USArrests))

# df <- scale(USArrests)

cluster <- kmeans(USArrests, centers = 2, nstart = 25, 
                  iter.max = 10000L)
cluster$centers

distance <- get_dist(USArrests)
fviz_dist(distance, gradient = 
            list(low = "cyan", mid = "white",
                 high = "magenta"))

cluster$tot.withinss
# within the cluster sum of squares
wcss <- function(k) {
  kmeans(USArrests, k, nstart = 10 )$tot.withinss
}

# Compute and plot wss for k = 1 to k = 15
k.values <- 1:15

# extract wss for 2-15 clusters
wcss_values <- map_dbl(k.values, wcss)
print(wcss_values)

plot(k.values, wcss_values,
     type="b", pch = 19, frame = FALSE, 
     xlab="Number of clusters K",
     ylab="Total within-clusters sum of squares")

cluster_1 <- kmeans(USArrests, centers = 4, nstart = 10)
str(cluster_1)

print(cluster_1)

# Display each rows value of cluster
cluster_1$cluster

# Centroids of clusters
cluster_1$centers

# total wcss
cluster_1$tot.withinss
## Visulaization of Cluster
fviz_cluster(cluster_1, data = df)