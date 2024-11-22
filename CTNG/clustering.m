function [Clusters,cl_number]=clustering(noise,cl_point,X,Xu,k,TN,beta)
% ���룺
%    X�����ݼ�
% �����
%    Clusters:�����������ݵ�����ǩ��
%    cl_number:��ظ���

%�������ã��������k,�������Ʊ�����ֵbeta

N=size(X,1);   % N:���ݼ���ĸ���

%% �����
num_cl_point=length(cl_point);
num_noise=length(noise);

%% ǰ2-�������ȼ����ֱ������
s=[N];  %ʼ�ڵ�
t=[N];  %�սڵ�
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
G0=graph(s,t);   % G0:��ʼ����ͼ

%% �����ȼ���������
for i=3:k
    [bins,binsizes]=conncomp(G0);    %��ʱ����ͨ��ͼ
    number_cl=length(binsizes);
    for j=1:number_cl
        cl=find(bins(1,:)==j);    %ÿһ��cl�еĵ㼯�ϣ�������
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
                        same=intersect(xj_TN,xi_TN);    %xi��xj����ͬ���ڵ㼯��
                        w=length(same)/min(length(xi_TN),length(xj_TN));
                        if w>beta
                            G0=addedge(G0,cl(p),TN_new(o));     %Ȩ�ش�ı�ֱ������
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

dd=find(binsizes<=3);  %С���Ϊ�쳣�����¾���
for i=1:length(dd)
    ee=find(bins==dd(i));
    noise=[noise ee];
end


%% ��Ⱥ�����
for i=1:length(noise)
    xsort=Xu(noise(i),:);   %������i��������ľ�������
    j=2;
    while ismember(xsort(j),noise)==1
        j=j+1;
    end
        G0=addedge(G0,noise(i),xsort(j)); 
end

    
%% �ҳ�ͼ����ͼ��ÿ����ͼΪһ�����
[bins,binsizes]=conncomp(G0);   %��bin��ʽ����ͼG����ͨ������bin���ָʾͼ�е�ÿ���ڵ������ķ���;binsizes(i)���������i�еĽڵ��������Էֺõ�����б��

cl_number=length(binsizes);
Clusters=bins';  %������

                        
        