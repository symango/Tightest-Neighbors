%�������ã�k-�����ھ���k,������������ֵbeta

% ��ȡ���ݼ�X ����ʵ��ǩlabel
X = data
%X = T';

%label=    ;
N=size(X,1);   %���ݵ����

% ���ò���
k;      %���ڸ��� k
beta;   %���н����غ���

%% CTNG�����㷨
[alpha,TN,Xu]=search_TN(X,k);
[cl_point,noise]=divide(X,TN,Xu,k,alpha);
[Clusters,cl_number]=clustering(noise,cl_point,X,Xu,k,TN,beta);
%[DBI,SC] = evaluate(X,Clusters);% �������Ч��ָ��    
%% ��֤������result��3�����з�ʽ����������Accuracy��׼ȷ�ȣ���Fmeasure��F��ȣ��� NMI����׼������Ϣ��
%% �������㷨
% [NewLabel]=BestMapping(label,Clusters);
% ACC=Acc(label,NewLabel);
% NMI = nmi(label,Clusters);
% [FMeasure,AA] = Fmeasure(label,Clusters);
% result=[ACC FMeasure NMI];


