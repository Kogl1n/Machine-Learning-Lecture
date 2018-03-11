%% Sheet 1, Exercise 2
%
%% Preparation of Training Data with one class of random 2D points in [0,1]x[0,1]
%  and the other class in [1,2]x[0,1]
clear all
n1 = 20; n2 = 20; % Training Data Size 
% 100, 100-> decreased error rates
% 200, 40 -> less training error; higher test error
train_data_class1 = rand(n1,2); 
train_data_class2 = rand(n2,2) + ones(n2,2)*[1 0; 0 0];
train_data = [train_data_class1 ; train_data_class2];
train_label(1:n1) = 1;
train_label(n1+1:n1+n2) = 2;

%% Plot Training Data
figure (1); clf; hold all; axis equal; title('Training Data');
plot(train_data(1:n1,1), train_data(1:n1,2), 'r*');
plot(train_data(n1+1:n1+n2,1), train_data(n1+1:n1+n2,2), 'bo');

%% Preparation of 100 Test Points
n3 = 100; % Number of Test Points
n4 = 100;  
test_data_class1 = rand(n3,2);
test_data_class2 = rand(n4,2) + ones(n4,2)*[1 0; 0 0];
test_data = [test_data_class1 ; test_data_class2];
test_label(1:n3) = 1;
test_label(n3+1:n3+n4) = 2;

%% Classify
k_values=[1, 3, 5, 7, 10, 15, 20];
for i = 1:length(k_values)
predTrain = knnClassify(train_data,train_label,train_data,k_values(i));  
predTest = knnClassify(train_data,train_label,test_data,k_values(i));  

errTrain(i) = sum(loss01(predTrain,train_label))/(n1+n2);
errTest(i) = sum(loss01(predTest,test_label))/(n3+n4);
end

%% Plot Training and Test Errors
figure(2); hold all; title('Training (red) and Test (blue) errors');
plot(k_values,errTrain,'r*:');
plot(k_values,errTest, 'b.-');
% Do results change between different runs? Why?

%% Plot Prediction for best k (smallest test error); which points misclass?
figure(3); clf; hold all; axis equal; 
[~,I] = min(errTest); i=I(1);
predTest = knnClassify(train_data,train_label,test_data,k_values(i));
str=sprintf('Prediction with k=%d', k_values(i)); title(str);
pred_class1 = find(predTest==1);
pred_class2 = find(predTest==2);
plot(test_data(pred_class1,1),test_data(pred_class1,2),'r*');
plot(test_data(pred_class2,1),test_data(pred_class2,2),'bo');
plot([1 1],[0 1],'k'); % k for black line
