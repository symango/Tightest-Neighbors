function [TN,k]=searchTN(X,k)
% 输入：
%    X：数据集
%    k：近邻个数
% 输出：
%    TN：每个cell元素表示点的紧邻集
%    k：紧邻数

[m,n]=size(X);
TN=cell(m,1);        % 每个点的紧邻情况


for i=1:m
    TN{i}=union(TN{i},i);
end


%% 寻找紧邻
get_knn = knnsearch(X,X,'k',k+1);
for j=2:k
    for i=1:m
        r=get_knn(i,j);
        if ismember(i,get_knn(r,1:j))==1
            TN{i}=union(TN{i},r);
            TN{r}=union(TN{r},i);
        end
    end
end

