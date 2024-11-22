%参数设置：k-紧邻邻居数k,紧邻相似率阈值beta

% 读取数据集X 和真实标签label
X = data
%X = T';

%label=    ;
N=size(X,1);   %数据点个数

% 设置参数
k;      %紧邻个数 k
beta;   %共有紧邻重合率

%% CTNG聚类算法
[alpha,TN,Xu]=search_TN(X,k);
[cl_point,noise]=divide(X,TN,Xu,k,alpha);
[Clusters,cl_number]=clustering(noise,cl_point,X,Xu,k,TN,beta);
%[DBI,SC] = evaluate(X,Clusters);% 计算聚类效果指标    
%% 验证聚类结果result：3种评判方式来检验结果：Accuracy（准确度）、Fmeasure（F测度）和 NMI（标准化互信息）
%% 匈牙利算法
% [NewLabel]=BestMapping(label,Clusters);
% ACC=Acc(label,NewLabel);
% NMI = nmi(label,Clusters);
% [FMeasure,AA] = Fmeasure(label,Clusters);
% result=[ACC FMeasure NMI];


