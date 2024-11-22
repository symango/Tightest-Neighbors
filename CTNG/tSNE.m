%t-sne降维
rng(0)

options_tsne = struct('NumDimensions', 2);
data_tsne = tsne(X, 'Options', options_tsne);
x = data_tsne(:,1);
y = data_tsne(:,2);
labels = Clusters;

%可视化
scatter(x, y, 10, labels, 'filled');
title(sprintf('data6: k = %d Number of clusters = %d', k, cl_number));