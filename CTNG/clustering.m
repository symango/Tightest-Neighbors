function [Clusters,cl_number]=clustering(noise,cl_point,X,Xu,k,TN,beta)
% 输入：
%    X：数据集
% 输出：
%    Clusters:聚类结果（数据点类别标签）
%    cl_number:类簇个数

%参数设置：聚类个数k,紧邻相似比率阈值beta

N=size(X,1);   % N:数据集点的个数

%% 点分离
num_cl_point=length(cl_point);
num_noise=length(noise);

%% 前2-紧邻优先级最高直接连边
s=[N];  %始节点
t=[N];  %终节点
% for i=1:num_noise
%     s=[s noise(i)];
%     t=[t noise(i)];
% end
for i=1:num_cl_point
    tn=TN{cl_point(i),2};
    tn=setdiff(tn,noise);
    idx=find(tn>cl_point(i));
    tn=tn(idx);
    p=length(tn);
    if p>=1
        t=[t tn];
        for j=1:p
            s=[s cl_point(i)];
        end
     end
end
G0=graph(s,t);   % G0:初始紧邻图

%% 次优先级紧邻连边
for i=3:k
    [bins,binsizes]=conncomp(G0);    %此时的连通子图
    number_cl=length(binsizes);
    for j=1:number_cl
        cl=find(bins(1,:)==j);    %每一类cl中的点集合，行向量
        temp=cl;
        %if length(cl)==1 && ismember(cl,noise)==1
        if ismember(cl,noise)==1
        else
            for p=1:length(cl)
                temp=[temp noise];
                TN_new=setdiff(TN{cl(p),i},temp);
                %if length(TN_new)~=0
                    for o=1:length(TN_new)
                        xj_TN=TN{cl(p),i};
                        xi_TN=TN{TN_new(o),i};
                        same=intersect(xj_TN,xi_TN);    %xi和xj的相同紧邻点集合
                        w=length(same)/min(length(xi_TN),length(xj_TN));
                        if w>beta
                            G0=addedge(G0,cl(p),TN_new(o));     %权重大的边直接连接
                            temp1=find(bins(1,:)==bins(1,TN_new(o)));
                            temp=union(temp,temp1);      
                        end
                    end
                %end
            end
        end
    end
end
[bins,binsizes]=conncomp(G0);

dd=find(binsizes<=3);  %小类归为异常点重新聚类
for i=1:length(dd)
    ee=find(bins==dd(i));
    noise=[noise ee];
end


%% 离群点分类
for i=1:length(noise)
    xsort=Xu(noise(i),:);   %孤立点i与其他点的距离升序
    j=2;
    while ismember(xsort(j),noise)==1
        j=j+1;
    end
        G0=addedge(G0,noise(i),xsort(j)); 
end

    
%% 找出图的子图，每个子图为一个类簇
[bins,binsizes]=conncomp(G0);   %以bin形式返回图G的连通分量。bin编号指示图中的每个节点所属的分量;binsizes(i)会给出分量i中的节点数量。对分好的类进行编号

cl_number=length(binsizes);
Clusters=bins';  %聚类结果

                        
        