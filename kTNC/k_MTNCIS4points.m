function [k_MTNCIS,num] = k_MTNCIS4points(point_id,TN)
%�㷨��k-MTNCIS�����㷨(searchMTNCIS)
%���룺��ID��point_id�����ڣ�TN
%�������Сk���ڱհ����伯��k_MTNCIS����Сk���ڱհ����伯������num
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

