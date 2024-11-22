data = X;
label = Clusters;
%% 真实标签的评价结果
eva_DBI= evalclusters(data,label,'DaviesBouldin');
eva_SC= evalclusters(data,label,'silhouette');
DBI = eva_DBI.CriterionValues; % Davies-Bouldin指数(DB值)
SC = eva_SC.CriterionValues; % 轮廓系数
%% 显示评价结果
fprintf("DBI越小越好：DBI(真实标签): %f \n", DBI); % 越小越好
fprintf("SC越大越好：SC(真实标签): %f\n", SC); % 越大越好