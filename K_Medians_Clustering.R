################################################################################
# Title: K-Medians Clustering Function
# Date: 08-11-2022
# Version: 1.0
################################################################################
####
# 1. Load Libraries
####
library(tidyverse)

####
# 2. Euclidean Distance
####
# Create a Euclidean Distance Function which will be used in the K-Medians 
# clustering algorithm
l2_dist <- function(x, y){
  return((sqrt(sum(x - y)^2)))
}

#####
# 3. K-Medians
#####
# Create a K-Medians Function
kmedians <- function(X, K, n_iter) {
  
  # Initialize centers randomly by obtaining a sample from the data frame
  centers <- X[sample(nrow(X), K), ]
  
  # Perform a N number of iterations
  for (iter in 1:n_iter) {
    # Calculate distances
    distances <- data.frame(matrix(NA, nrow = nrow(X), ncol = K))
    for (object_id in 1:nrow(X)) {
      for (center_id in 1:nrow(centers)) {
        # Use Euclidean distance to calculate distance between point and center
        distances[object_id, center_id] <- l2_dist(X[object_id, ], 
                                                   centers[center_id, ])
      }
    }
    
    # Assign row wise each point to the closest center
    cluster_id <- apply(distances, 1, which.min)
    
    # Calculate new center values 
    for (i in seq_len(K)) {
      this_cluster <- X[cluster_id == i,]
      # Calculate median instead of mean for each column 
      centers[i, ] <- apply(this_cluster, 2, median)
    }
  }
  # Create list with information about centers and clusters
  output <- list('centers' = centers, 'clusters' = cluster_id)
}