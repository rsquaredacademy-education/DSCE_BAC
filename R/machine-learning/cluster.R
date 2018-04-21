# cluster analysis
library(dplyr)

# set random seed
set.seed(1)

# iris data set
iris

# remove the Species column
iris2 <- iris[-5]

# count of species
species <- iris$Species
table(species)

# Perform k-means clustering on my_iris: kmeans_iris
km_iris <- kmeans(iris2, 3)

# Compare the actual Species to the clustering using table()
table(km_iris$cluster, species)

# Plot Petal.Width against Petal.Length, coloring by cluster
plot(Petal.Length ~ Petal.Width, data = iris2, col = km_iris$cluster)

# try with mtcars data
mt <- select(mtcars, hp, wt)
km_mtcars <- kmeans(mt, 2)
km_mtcars$cluster

# plot
plot(mt, col = km_mtcars$cluster)
points(km_mtcars$centers, pch = 22, bg = c(1, 2), cex = 2)
