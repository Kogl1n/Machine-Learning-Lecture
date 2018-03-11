clear all
close all
clc

fid = fopen('test.csv', 'r');

% we skip the first column by using %*s
 [T1] = textscan(fid, '%*s%f%f%f%f%f%f%f%f', 'headerlines', 1,...
     'delimiter', ',');
%[T1] = textscan(fid, '%f%f%f%f%f%f%f%f%f%f%f%f', 'headerlines', 1,...
%     'delimiter', ',');

fclose(fid);
test = cell2mat(T1);%Turn the cell to numberfields

fid = fopen('train.csv', 'r');
%[T2] = textscan(fid, '%f%f%f%f%f%f%f%f%f%f%f%f%f%f%f', 'headerlines', 1,...
%     'delimiter', ',');
% we skip the first column by using %*s
 [T2] = textscan(fid, '%*s%f%f%f%f%f%f%f%f%f%f%f', 'headerlines', 1,...
     'delimiter', ',');
 fclose(fid);
train = cell2mat(T2);%Turn the cell to numberfields

train_data=train(:,1:end-3);
train_label=train(:,end);

%% normalize data (train and test)
[n,m]=size(train_data);
for i=1:m
train_data(:,i)=train_data(:,i)/norm(train_data(:,i));
test(:,i)=test(:,i)/norm(test(:,i));
end



%% kNN
k=3;

%p_labels_test = ml_knnClassify(train_data, train_label, test, k);
%p_labels_train = ml_knnClassify(train_data, train_label, train_data, k);

%n=
% err(x,y)=@(x,y) sqrt(1/n*sum((log(x+1)-log(y-1))^2));

C_values = [0.01, 0.1, 0.5, 1, 5, 10, 50];
%err_train = zeros(1, length(C_values));
%err_test = zeros(1, length(C_values));

%% Ridge Regression
% least squares

w = least_squares(train_data, train_label);
f = @(x) x*w;
pred_test = f(test);


%plot(p_labels_test,'*','r');
hold on
plot(pred_test,'b*');