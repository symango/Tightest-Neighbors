D=[];
for k=1:200
    try
        % 读取数据集X 和真实标签label
        X=data;
        N=size(X,1);   %数据点个数          
        %% kTNC聚类算法
        tic
        [TN,k] = searchTN(X,k);
        [cl,cl_number] = cluster(TN);
        toc
        D=[D cl_number];
        %[DBI,SC] = evaluate(X,Clusters);% 计算聚类效果指标
    catch ErrorInfo
        cl_number = 0;
        D=[D cl_number];
    end
end
plot(D);