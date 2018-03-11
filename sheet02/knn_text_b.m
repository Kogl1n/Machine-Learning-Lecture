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
