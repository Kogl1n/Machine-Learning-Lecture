% Exercise 4
load('usps_train.mat');
x_train = double(train_data);
y_train = train_label;

[V,D] = PCA(x_train(y_train==5,:));
eigvalues = D*ones(size(D,1),1);
[~,indices] = sort(eigvalues,'descend');
princcomp = V(:,indices(1));
figure; dig = reshape(princcomp,16,16); imagesc(dig); colormap('gray');

seccomp = V(:,indices(2));
figure; dig = reshape(seccomp,16,16); imagesc(dig); colormap('gray');
