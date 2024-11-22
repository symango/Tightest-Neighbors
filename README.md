![image](https://img.shields.io/badge/R-4.1.0-brightgreen) ![image](https://img.shields.io/badge/MATLAB-R2020b-red) 

# Estimating Number of Clusters and Finding Structure of Datasets by Method Based on Tightest Neighbors

We propose a method based on tightest neighbors to estimate the number of clusters and finding structure of datasets.

## R (≥4.1.0)
## DataProcessing.R

### Usage
This application is implemented using R and adopts Seurat pipeline to preprocess the scRNA-seq dataset. This application is implemented using R and adopts Seurat pipeline to preprocess the scRNA-seq dataset. 

## ClusterEffectDisplay.R

### Usage
This application is implemented using R. You can use this to plot the effect of clustering and observe the clustering of data.

## MATLAB (R2020b)
## kTNC

We propose an algorithm to estimate the true number of clusters of a dataset based on the notion of tightest neighbors as well as $k$-tightest neighborhhod closure. 

### Usage
Run main.m to estimate the true number of clusters in the dataset.

## CTNG

We propose a hierarchical graph clustering algorithm based on common tightest neighbors.

### Usage
Run drecord.m to estimate the true number of clusters in the dataset.
