library(SeuratObject)
library(Seurat)
library(dplyr)
library(patchwork)
setwd("filepath")
pbmc.data <- Read10X(data.dir = "datapath")
pbmc <- CreateSeuratObject(
  counts = pbmc.data,
  project = "pbmc3k",
  min.cells = 3,
  min.features = 200
)

# 使用PercentageFeatureSet函数计算线粒体QC指标
pbmc[['percent.mt']] <- PercentageFeatureSet(pbmc, pattern = "^MT-")
# 数据规范化
pbmc <- NormalizeData(pbmc,
                      normalization.method = "LogNormalize",
                      scale.factor = 10000)
# 识别高度可变的特征（特征选择）
pbmc <- FindVariableFeatures(pbmc, selection.method = "vst", nfeatures = 2000)
# 确定高表达的前2000基因
top <- head(VariableFeatures(pbmc), 2000)
# 缩放数据，只对选定的高表达基因进行缩放
pbmc <- ScaleData(pbmc, features = top)
# 线性降维，保留30个主成分
pbmc <- RunPCA(pbmc, features = top, npcs = 30)
# 导出PCA结果
pca_results <- Embeddings(pbmc, reduction = "pca")
pca_df <- as.data.frame(pca_results)
write.csv(pca_df, file = "filepath", row.names = TRUE)
