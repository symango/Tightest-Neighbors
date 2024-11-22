%t-sne降维
rng(0)

options_tsne = struct('NumDimensions', 2);
data_tsne = tsne(X, 'Options', options_tsne);
x = data_tsne(:,1);
y = data_tsne(:,2);
labels = cl;

%可视化
scatter(x, y, 10, labels, 'filled');
title(sprintf('kTNG data1: k = %d K = %d', k, cl_number));