%% kNN for digit classification
%% a) class 2 and 3 classification
% Training Data prep
clear all; clc;
load('usps_train.mat');
trList = find(train_label==2 | train_label==3);
x_train = double(train_data(trList,:));
y_train = double(train_label(trList));

% Test Data prep
load('usps_test.mat');
teList=find(test_label==2|test_label==3);
x_test=double(test_data(teList,:));
y_test=double(test_label(teList));

% Visualize
dig = reshape(x_train(155,:),16,16);
imagesc(dig);
colormap('gray');

%% b) Performance analysis
% digit 2 and 3
% k=1,3,5,7,10,15, plot training and test errors
k_values=[1, 3, 5, 7, 10, 15];
for i = 1:length(k_values)
predTrain = knnClassify(x_train,y_train,x_train,k_values(i));  
predTest = knnClassify(x_test,y_test,x_test,k_values(i));  

errTrain(i) = sum(loss01(predTrain,y_train'))/(2000);
errTest(i) = sum(loss01(predTest,y_test'))/(200);
end
figure; hold all; title('2,3: Training (red) and Test (blue) errors');
plot(k_values,errTrain,'r*:');
plot(k_values,errTest, 'b.-');

% -----------------------------------------------------------------------

% digit 3 and 8, compare performance to 2,3
% Training Data prep
clear all; clc;
load('usps_train.mat');
trList = find(train_label==3 | train_label==8);
x_train = double(train_data(trList,:));
y_train = double(train_label(trList));

% Test Data prep
load('usps_test.mat');
teList=find(test_label==3|test_label==8);
x_test=double(test_data(teList,:));
y_test=double(test_label(teList));

% plot training and test errors
k_values=[1, 3, 5, 7, 10, 15];
for i = 1:length(k_values)
predTrain = knnClassify(x_train,y_train,x_train,k_values(i));  
predTest = knnClassify(x_test,y_test,x_test,k_values(i));  

errTrain(i) = sum(loss01(predTrain,y_train'))/(2000);
errTest(i) = sum(loss01(predTest,y_test'))/(200);
end
figure; hold all; title('3,8: Training (red) and Test (blue) errors');
plot(k_values,errTrain,'r*:');
plot(k_values,errTest, 'b.-');
% much higher
