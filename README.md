# K-Medians Clustering
K-Median clustering is a type of unsupervised machine learning technique used for clustering data points into k groups. It is similar to K-Means clustering, but instead of calculating the mean of the points in each cluster, it calculates the median.

# How it Works? 
K-Median clustering algorithm works as follows:

(1) Randomly select k points from the data set to act as the initial centroids.

(2) Assign each data point to the centroid that is closest to it. 

(3) Recalculate the centroid of each cluster as the median of all the points assigned to it.  

(4) Repeat steps 2 and 3 until the centroids no longer move or a maximum number of iterations is reached. 

