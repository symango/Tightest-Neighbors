D=[];
for k=1:200
    try
        % ��ȡ���ݼ�X ����ʵ��ǩlabel
        X=data;
        %label=    ;
        N=size(X,1);   %���ݵ����
        
        % ���ò���
        %k=k;   %���ڸ��� k
        beta;   %���н����غ���
        
        %% CTNG�����㷨
        tic
        [alpha,TN,Xu]=search_TN(X,k);
        [cl_point,noise]=divide(X,TN,Xu,k,alpha);
        [Clusters,cl_number]=clustering(noise,cl_point,X,Xu,k,TN,beta);
        D=[D cl_number];
        % [DBI,SC] = evaluate(X,Clusters);% �������Ч��ָ��  
        toc
        

    catch ErrorInfo
        cl_number = 0;
        D=[D cl_number];
    end
end
plot(D);