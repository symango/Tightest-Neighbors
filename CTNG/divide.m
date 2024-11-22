function [cl_point,noise]=divide(X,TN,Xu,k,alpha);
% 输入：
%    X：数据集
%    TN:紧邻集
%    Xu:距离排序矩阵
%    k：k-紧邻
% 输出：
%    cl_point：核心点
%    noise：噪声点

N=size(X,1);   %数据点个数

%% 离群点分离
noise=[];
cl_point=[];
for i=1:N
    number=length(TN{i,k});
    if number<alpha
        noise=[noise i];
    else
        cl_point=[cl_point i];
    end
end
