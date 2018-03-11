%% PCA
% last column of train should be the label ?!
%% here many features
reduced_data = train(:, [4, 5, 7, 8, 9, 11, 12, 13, 14]);
%% less features
%reduced_data = train(:, [ 5, 7,   10, 13, 14]);
%reduced_data = train;
rd_centerpoint=sum(reduced_data)/n_train;
rd_c = reduced_data - (ones(length(train),1)* rd_centerpoint);
[V, D]=PCA(rd_c);

%% rd_wrt_V contains components of centered reduced_data 
%% with respect to our new basis V
rd_wrt_V = rd_c*V;
%% now visualizing our data using 
%% projections onto greates 3 eigenvectors
%% in 3d
V3 = rd_wrt_V(:, end-3:end);
figure(3)
scatter(V3(:,1), V3(:,2), p_size);
