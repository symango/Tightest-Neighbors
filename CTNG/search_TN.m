function [alpha,TN,Xu]=search_TN(X,k)
% 输入：
%    X：数据集
%    k：k-紧邻
% 输出：
%    TN：紧邻
%    Xu：距离排序阵
N=size(X,1);   % N:数据集点的个数
XIndex=cell(N,1);   % XIndex{i}:点i与所有点的距离升序下标
KNN=cell(N,1);   %  每个点的KNN邻居
RKNN=cell(N,1);  %  每个点的RKNN邻居
TN=cell(N,k);     %  每个点的紧邻点
A=pdist2(X,X);   %  A:距离矩阵

%% 距离按升序排序并记录下标
for i=1:N
    [~,xu]=sort(A(:,i));
    XIndex{i}=xu;
    Xu(i,:)=xu;
end

%% 计算紧邻
for r=1:k % r:搜索轮数
    for j=1:N
        y=XIndex{j}(r+1);  %r=1最近点为本身，所以从r=2开始
        KNN{j}=[KNN{j},y];  %记录点j的KNN近邻点的下标
        RKNN{y}=[RKNN{y},j];
    end
    for i=1:N
        TN{i,r}=intersect(KNN{i},RKNN{i});  %TN{i，r}:点i的r紧邻点的下标[, ,]
    end
end
for i=1:N
    TN_num(i)=length(TN{i,k});
end


TN_mean=mean(TN_num);
TN_std=std(TN_num);
alpha=TN_mean-TN_std;
