function [TN,k]=searchTN(X,k)
% ���룺
%    X�����ݼ�
%    k�����ڸ���
% �����
%    TN��ÿ��cellԪ�ر�ʾ��Ľ��ڼ�
%    k��������

[m,n]=size(X);
TN=cell(m,1);        % ÿ����Ľ������


for i=1:m
    TN{i}=union(TN{i},i);
end


%% Ѱ�ҽ���
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

