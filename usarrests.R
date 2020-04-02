library(datasets)     # US Arrests
library(tidyverse)    
library(cluster)      # Clustering of data
library(factoextra)   # Visualization of cluster

data("USArrests")
View(USArrests)

sum(is.na(USArrests))

df <- scale(USArrests)

cluster <- kmeans(df, centers = 2, nstart = 25, 
                  iter.max = 10000L)
cluster$centers

distance <- get_dist(df)
fviz_dist(distance, gradient = 
            list(low = "cyan", mid = "white",
                 high = "magenta"))

cluster$tot.withinss
# within the cluster sum of squares
wcss <- function(k) {
  kmeans(df, k, nstart = 10 )$tot.withinss
}

# Compute and plot wss for k = 1 to k = 15
k.values <- 1:15

wcss_values <- map_dbl(k.values, wcss)
print(wcss_values)

plot(k.values, wcss_values,
     type="b", pch = 19, frame = FALSE, 
     xlab="Number of clusters K",
     ylab="Total within-clusters sum of squares")

cluster_1 <- kmeans(df, centers = 4, nstart = 10)
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