function [ pred ] = knnClassify( train_data, train_label, test_data, k )
%knnClassify: k-nearest neighbor classifier
%   pred: predicted labels
%   ...

% old part:
% dist = pdist2(test_data,train_data,'euclidean');% pdist2: pairwise distance
% n = size(test_data,1);
% dist(1:n+1:end) = inf; % dist. to the same component(diag) is not desired
% [~, indices] = sort(dist,2); % sorts the elements in each row
% indices = indices(:,1:k);
% pred = mode(train_label(indices),2); % take the maj. value in each row.
% -------------------------------------------------------------------------

% d^2 = a'*a + b'*b - 2*a'*b
a2 = sum(train_data.^2,2)*ones(size(test_data,1),1)';
b2 = ones(size(train_data,1),1)*sum(test_data.^2,2)';
d = sqrt(a2+b2-2*train_data*test_data');

[~,indices] = sort(d,1);
pred = train_label(indices)';
pred = mode(pred(:,1:k),2);
end


