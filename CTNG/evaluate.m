function [DBI,SC] = evaluate(X,Clusters)
%计算DB和轮廓系数
%   输出DB and 轮廓系数

DBI=[];
SC=[];
eva_DBI = evalclusters(X,Clusters,'DaviesBouldin');
eva_SC = evalclusters(X,Clusters,'silhouette');
DBI = eva_DBI.CriterionValues; % Davies-Bouldin指数(DB值)(越小越好)
SC = eva_SC.CriterionValues; % 轮廓系数(越大越好)
end

