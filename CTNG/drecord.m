D=[];
for k=1:200
    try
        % 读取数据集X 和真实标签label
        X=data;
        %label=    ;
        N=size(X,1);   %数据点个数
        
        % 设置参数
        %k=k;   %紧邻个数 k
        beta;   %共有紧邻重合率
        
        %% CTNG聚类算法
        tic
        [alpha,TN,Xu]=search_TN(X,k);
        [cl_point,noise]=divide(X,TN,Xu,k,alpha);
        [Clusters,cl_number]=clustering(noise,cl_point,X,Xu,k,TN,beta);
        D=[D cl_number];
        % [DBI,SC] = evaluate(X,Clusters);% 计算聚类效果指标  
        toc
        

    catch ErrorInfo
        cl_number = 0;
        D=[D cl_number];
    end
end
plot(D);