function [k_MTNCIS,num] = k_MTNCIS4points(point_id,TN)
%算法：k-MTNCIS搜索算法(searchMTNCIS)
%输入：点ID：point_id，紧邻：TN
%输出：最小k紧邻闭包不变集：k_MTNCIS，最小k紧邻闭包不变集基数：num
tn=TN{point_id};
tn_temp = 0;

while ~(isequal(tn ,tn_temp))
    tn_temp=tn;
    for j=1:length(tn)
        tn=union(tn,TN{tn(j)});
    end
end
k_MTNCIS=tn;
num=length(tn);
end

