%% sheet04ex01
clear all; clc;
load('dataRidge.mat');

%% a)
% plot training and test points
figure(1); clf; subplot(1, 2, 1); hold all;
plot(x_train, y_train, 'g.', x_test, y_test, 'r.');

%% LLS
x_test1  = [ones(size(x_test,1),1), x_test];
x_train1 = [ones(size(x_train,1),1), x_train];
w1 = least_squares(x_train1, y_train);
z = (linspace(min(x_train), max(x_train), 100))';
z1 = [ones(100,1), z];
plot(z1(:,2),  z1*w1, 'b');

%% mark predicted labels
y_pred = x_test1 *w1;
plot(x_test,y_pred,'bo','markersize',10);

%% b)
poly_order = 15;
x_train15 = x_train1;
x_test15  = x_test1;
z15       = z1;
for i = 2 : poly_order
   x_train15 = horzcat(x_train15, x_train15(:, 2).^i); 
   x_test15 = horzcat(x_test15, x_test15(:, 2).^i);
   z15 = horzcat(z15, z15(:, 2).^i);
end
w15 = least_squares(x_train15, y_train);
plot(z15(:,2),  z15*w15, 'k');
y_pred15 = x_test15 *w15;
plot(x_test,y_pred15, 'ko','markersize',10);

legend('training', 'test','linear','pred. labels (lin.)',...
    'polynomial (order 15)','pred. labels (order 15)');
 
err15 = lossL2(y_test, y_pred15);
fprintf('The average L2 loss (order 15) is: %f\n',err15);
title(sprintf(['The average L2 loss (order 15)','is: %f\n'], err15));

%% c)
fprintf('\n 1c)\n');
subplot(1, 2, 2);
% training and test points
hold all;
plot(x_train, y_train, 'g.', x_test, y_test, 'r.')
% different lambda values
lambda_values = [0, 0.0001, 1, 1000];
color_values  = ['k', 'g', 'b', 'r'];
color_values2  = ['k*', 'g*', 'b*', 'r*'];
for j = 1:length(lambda_values)    
    w_ridge = RidgeLLS(x_train15, y_train, lambda_values(j));
    y_pred_ridge = x_test15*w_ridge;
    % plot(z15(:,2),  z15*w_ridge, color_values(j),x_test, y_pred_ridge, color_values2(j),'markersize',10);
    plot(z15(:,2),  z15*w_ridge, color_values(j));
   
    % L2 errors
    err_ridge(j) = lossL2(y_test, y_pred_ridge);
    fprintf(['\nThe average L2 loss for lambda = %f',...
        ' \n(ridge regr.) is: %f\n'], lambda_values(j), err_ridge(j)); 
end

title(sprintf(['The average L2 loss for lambda = %f',...
        ' (ridge regression) is: %f\nlambda = %f',...
        ': %f\nlambda = %f: %f\nlambda = %f: %f'],...
        lambda_values(1), err_ridge(1), ...
        lambda_values(2), err_ridge(2),...
        lambda_values(3), err_ridge(3),...
        lambda_values(4), err_ridge(4)));
    
legend('training', 'test',...
    '\lambda = 0', '\lambda = 0.0001',...
    '\lambda = 1', '\lambda = 1000');

%% errors for different lambda
lambda_values = zeros(18,1); % reuse variable
error=zeros(18,1);

for k = 1:length(lambda_values);
    lambda_values(k) = 2^(k-16);
    if k==18
        lambda_values(k) = 0;
    end
    w_ridge = RidgeLLS(x_train15, y_train, lambda_values(k));
    %L2 errors
    y_pred_ridge = x_test15*w_ridge;
    err_ridge(k) = lossL2(y_test, y_pred_ridge);
    if k<18
        fprintf('L2 error with lambda = 2^(%d): %f\n',k-16, err_ridge(k));
    else
        fprintf('L2 error with lambda = %d: %f\n',0, err_ridge(k));
    end
    error(k)=err_ridge(k);
end
  
fprintf('mean error = %f\n', mean(error));
[m, ind]=min(error);
fprintf('min error is: %f by lambda= %f', m,lambda_values(ind));

%err_ridge    
%figure(2); clf;
%hold all;
%plot(lambda_values, err_ridge, 'g');
%xlabel('lambda');
%ylabel('L2 error')