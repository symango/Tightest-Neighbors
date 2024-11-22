library(ggplot2)
library(gcookbook)

# 数据处理
setwd("workpath")
data1 <- read.csv("filename",row.names = 1) # 读取经DataProcessing处理后的数据
umap <-  umap(data1) 
site <- data.frame(umap$layout)
colnames(site) <- c("UMAP1","UMAP2")
write.csv(site,"filename") # 导出经UMAP降维后数据

# 绘图
data2 <- read.csv("filename") # 经过UMAP降维后的数据并且添加列名为Clusters的聚类标签
colorlist = c("gold", "#FF00FF", "#4876FF", "#00CD00", "#00FFFF","#FF3030", "orange")
ggplot(data2, aes(x = UMAP1, y = UMAP2 ,colour = Clusters))+
  geom_point(size = 1.6,shape = 20)+
  scale_colour_manual(values = colorlist)+
  theme_bw()+
  theme(panel.grid =element_blank(),
        panel.border = element_blank(),
        axis.text.y = element_blank(),
        axis.ticks.y = element_blank(),
        axis.ticks.x = element_blank(),
        axis.text.x = element_blank())+
  labs(x='', y='')
