D=[];
for k=1:200
    try
        % ��ȡ���ݼ�X ����ʵ��ǩlabel
        X=data;
        N=size(X,1);   %���ݵ����          
        %% kTNC�����㷨
        tic
        [TN,k] = searchTN(X,k);
        [cl,cl_number] = cluster(TN);
        toc
        D=[D cl_number];
        %[DBI,SC] = evaluate(X,Clusters);% �������Ч��ָ��
    catch ErrorInfo
        cl_number = 0;
        D=[D cl_number];
    end
end
plot(D);