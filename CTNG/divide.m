function [cl_point,noise]=divide(X,TN,Xu,k,alpha);
% ���룺
%    X�����ݼ�
%    TN:���ڼ�
%    Xu:�����������
%    k��k-����
% �����
%    cl_point�����ĵ�
%    noise��������

N=size(X,1);   %���ݵ����

%% ��Ⱥ�����
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
