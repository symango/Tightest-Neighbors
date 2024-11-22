function [cl,cl_num] = cluster(TN)
%算法：基于紧邻的聚类算法（kTNC）
%输入：紧邻（TN）
%输出：类标签：cl,类数：cl_num
clusters = cell(1,1);
n = length(TN);
X = 1:n;
cl = zeros(n,1);
i = 1;
while ~(isempty(X))
    k_MTNCIS = k_MTNCIS4points(X(1),TN);
    X = setdiff(X,k_MTNCIS);
    clusters{i,1} = k_MTNCIS;
    i = i+1;
end
for j = 1:length(clusters)
    for l = 1:length(clusters{j,1})
        cl(clusters{j,1}(l)) = j;
    end
end
cl_num=max(cl);
end

