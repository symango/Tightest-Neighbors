function [cl,cl_num] = cluster(TN)
%�㷨�����ڽ��ڵľ����㷨��kTNC��
%���룺���ڣ�TN��
%��������ǩ��cl,������cl_num
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

