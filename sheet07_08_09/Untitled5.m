%% clustering by k-means
%% first try with: 4(hour), 9(temp), 15(count)
%% and k = 3 
k = 3;
%% normalize features 
af = train(:,[4, 9, 15]);
af_n = zeros(size(af));
c04= sum(af(:,1));%/n_train;
c09= sum(af(:,2));%/n_train;
c15= sum(af(:,3));%/n_train;
af_n(:,1) = af(:,1)./c04;
af_n(:,2) = af(:,2)./c09;
af_n(:,3) = af(:,3)./c15;
 

%% first plot unnormalized features
%scatter3(af(:,1), af(:,2), af(:,3), p_size);

%% apply k-means
[idx, C] = kmeans(af_n, k);
figure(2)
%colors = ['g'; 'b'; 'm' ; 'r'];
%colorlist = colors(idx);
%% size of points (for plot)
p_size = 2.5;
%% plot data after clustering
scatter3(af(:,1), af(:,2), af(:,3), p_size, idx);
%plot3(af_c(:,1), af_c(:,2), af_c(:,3), '.');
 % Create xlabel
xlabel({'hour of the day'});

% Create ylabel
ylabel({'temperature'});

% Create zlabel
zlabel({'rental count'});

%% other plot
figure;
%subplot(1,2,1);
scatter(af_n(:,1), af_n(:,3),15,idx);
xlabel({'hour of the day'});
ylabel({'amount of rented bikes'});
figure
%subplot(1,2,2);
scatter(af(:,1), af(:,3),15,af(:,2));
xlabel({'hour of the day'});
ylabel({'amount of rented bikes'});

%% legend('dsf', 'ddd', 'ddd', 'dds');
