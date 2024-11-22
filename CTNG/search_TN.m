function [alpha,TN,Xu]=search_TN(X,k)
% ���룺
%    X�����ݼ�
%    k��k-����
% �����
%    TN������
%    Xu������������
N=size(X,1);   % N:���ݼ���ĸ���
XIndex=cell(N,1);   % XIndex{i}:��i�����е�ľ��������±�
KNN=cell(N,1);   %  ÿ�����KNN�ھ�
RKNN=cell(N,1);  %  ÿ�����RKNN�ھ�
TN=cell(N,k);     %  ÿ����Ľ��ڵ�
A=pdist2(X,X);   %  A:�������

%% ���밴�������򲢼�¼�±�
for i=1:N
    [~,xu]=sort(A(:,i));
    XIndex{i}=xu;
    Xu(i,:)=xu;
end

%% �������
for r=1:k % r:��������
    for j=1:N
        y=XIndex{j}(r+1);  %r=1�����Ϊ�������Դ�r=2��ʼ
        KNN{j}=[KNN{j},y];  %��¼��j��KNN���ڵ���±�
        RKNN{y}=[RKNN{y},j];
    end
    for i=1:N
        TN{i,r}=intersect(KNN{i},RKNN{i});  %TN{i��r}:��i��r���ڵ���±�[, ,]
    end
end
for i=1:N
    TN_num(i)=length(TN{i,k});
end


TN_mean=mean(TN_num);
TN_std=std(TN_num);
alpha=TN_mean-TN_std;
