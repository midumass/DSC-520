library(ggplot2)
library(tidyverse)
library(readr)
library(class)
library(gmodels)
library(grid)
library(gridExtra)
library(factoextra)

input_file <- './clustering-data.csv'

data <- read_csv(input_file)

set.seed(1978)


## A: Plotted data from original datasets


data_plot <- ggplot(data, aes(x = x, y = y)) +
  geom_point(alpha = '.25') +
  ggtitle("Clustering Data Plot")

data_plot


  
  ## B: Fitting the dataset using kmeans
  

k_function <- function(x){kmeans(data, centers = x)}

k2 <- k_function(2)
k3 <- k_function(3)
k4 <- k_function(4)
k5 <- k_function(5)
k6 <- k_function(6)
k7 <- k_function(7)
k8 <- k_function(8)
k9 <- k_function(9)
k10 <- k_function(10)
k11 <- k_function(11)
k12 <- k_function(12)

p2 = fviz_cluster(k2, geom = "point", data = data) + ggtitle('k=2')
p3 = fviz_cluster(k3, geom = "point", data = data) + ggtitle('k=3')
p4 = fviz_cluster(k4, geom = "point", data = data) + ggtitle('k=4')
p5 = fviz_cluster(k5, geom = "point", data = data) + ggtitle('k=5')
p6 = fviz_cluster(k6, geom = "point", data = data) + ggtitle('k=6')
p7 = fviz_cluster(k7, geom = "point", data = data) + ggtitle('k=7')
p8 = fviz_cluster(k8, geom = "point", data = data) + ggtitle('k=8')
p9 = fviz_cluster(k9, geom = "point", data = data) + ggtitle('k=9')
p10 = fviz_cluster(k10, geom = "point", data = data) + ggtitle('k=10')
p11 = fviz_cluster(k11, geom = "point", data = data) + ggtitle('k=11')
p12 = fviz_cluster(k12, geom = "point", data = data) + ggtitle('k=12')

grid.arrange(p2,p3,p4,p5, ncol=2)
grid.arrange(p6,p7, nrow=2)



grid.arrange(p8,p9, nrow=2)
p10
p11
p12


## C: Plotting the mean distance from the centroid of each cluster given a value k

fviz_nbclust(data, kmeans, method = "silhouette")
fviz_nbclust(data, kmeans, method = "wss")

## D: Analyzing the elbow

