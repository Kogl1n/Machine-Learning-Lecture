%% kNN-classification of of newsgroup posts
% training data: 11269x53975, (i,j)=(document,word) number of occur.
% classify classes 6 and 8
%% a)
% Load dataset and prep training set for classes 6 and 8 with 40 random
% saples from each class
clear all;
%rng(110);
load('20Newsgroup.mat');
n = 40;
trIdx6 = find(y_train==6); % indices
rand_train_6 = randperm(length(trIdx6)); % numbers from 1 to 592 in random order
% Do the same for class 8 to get trIdx8 and  rand_train_8
trIdx8 = find(y_train==8); % indices
rand_train_8 = randperm(length(trIdx8));

trList = [trIdx6(rand_train_6(1:n)) ; trIdx8(rand_train_8(1:n))]; % 40 ind.
x_train_6_8 = x_train(trList,:); % 40 values
y_train_6_8 = y_train(trList);

% Do the same for test data (40 random samples)
teIdx6 = find(y_test==6);
rand_test_6 = randperm(length(teIdx6));
teIdx8 = find(y_test==8);
rand_test_8 = randperm(length(teIdx8));
teList = [teIdx6(rand_test_6(1:n)) ; teIdx8(rand_test_8(1:n))];
x_test = x_test(teList,:);
y_test = y_test(teList);

% train and test data have diff. feature sizes; crop
x_test_cropped = x_test(:,1:size(x_train,2));

% k=1,3,5,7,9 plot training and test errors; does it change? -> Of course!
k_values=[1, 3, 5, 7, 9];
for i = 1:length(k_values) 
predTrain = knnClassify(x_train_6_8,y_train_6_8,x_train_6_8,k_values(i));  
predTest = knnClassify(x_test_cropped,y_test,x_test_cropped,k_values(i));  

errTrain(i) = sum(loss01(predTrain,y_train_6_8'))/(80);
errTest(i) = sum(loss01(predTest,y_test'))/(80);
end
figure; hold all; title('Training (red) and Test (blue) errors');
plot(k_values,errTrain,'r*:');
plot(k_values,errTest, 'b.-');

%% b) perf analysis of own classifier
% can train class. using all training points?
clear all;
load('20Newsgroup.mat');

trIdx68 = find(y_train==6 | y_train==8);
x_train_6_8 = x_train(trIdx68,:);
y_train_6_8 = y_train(trIdx68);

teIdx68 = find(y_test==6 | y_test==8);
x_test_6_8 = x_test(teIdx68,:);
y_test_6_8 = y_test(teIdx68);

x_test_cropped = x_test_6_8(:,1:size(x_train_6_8,2));

k_values=[1, 3, 5, 7, 9];
for i = 1:length(k_values)
predTrain = knnClassify(x_train_6_8,y_train_6_8,x_train_6_8,k_values(i));  
predTest = knnClassify(x_test_cropped,y_test_6_8,x_test_cropped,k_values(i));  

errTrain(i) = sum(loss01(predTrain,y_train_6_8'))/(11269);
errTest(i) = sum(loss01(predTest,y_test_6_8'))/(7505);
end
figure; hold all; title('Training (red) and Test (blue) errors');
plot(k_values,errTrain,'r*:');
plot(k_values,errTest, 'b.-');
