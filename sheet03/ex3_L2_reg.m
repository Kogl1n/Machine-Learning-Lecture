%% Aufgabe 3:
% a)
load('reg1d.mat');

% Plot Training and Test Data:
figure; hold on;
plot(X_train,Y_train,'bx');
plot(X_test,Y_test,'r.');

% Preprocess Training Data by concat 1 (bias) to each point:
X_train_cat = [X_train, ones(length(X_train),1)];
X_test_cat = [X_test, ones(length(X_test),1)];

% b) learn
w = least_squares(X_train_cat,Y_train);
f = @(x) x*w;

Y_test_pred = f(X_test_cat);
plot(X_test,Y_test_pred,'g-o');

% c) eval
err = lossL2(Y_test,Y_test_pred);
fprintf('Average L2 loss (linear): %f\n',err);

% d) non-lin. features
X_train_3 = [X_train.^3 X_train.^2 X_train_cat];
X_test_3 = [X_test.^3 X_test.^2 X_test_cat];

w_3 = least_squares(X_train_3, Y_train);
f_3 = @(x) x*w_3;
Y_test_pred_3 = f_3(X_test_3);

X_plot = min(X_test):0.01:max(X_test);
X_plot2 = [X_plot.^3; X_plot.^2; X_plot; X_plot.^0]';
Y_plot = f_3(X_plot2);
plot(X_plot,Y_plot,'k-');
legend('Training Points','Test Points','Linear L2','Cubic L2');
plot(X_test,Y_test_pred_3,'ko');

err_3 = lossL2(Y_test, Y_test_pred_3);
fprintf('Average L2 loss (cubic): %f\n',err_3);

% e) add extreme outlier
pause
X_train_out = [X_train_cat;1.05,1];
Y_train_out = [Y_train;-10];
% does outlier fit in the plot???

w = least_squares(X_train_out,Y_train_out);
f = @(x) x*w;
Y_test_pred_out = f(X_test_cat);
err_out = lossL2(Y_test,Y_test_pred_out);
fprintf('Average L2 loss (outlier,lin): %f\n',err_out);
plot(X_test,Y_test_pred_out,'r-x');

X_train_out2 = [X_train;1.05];
X_train_3out = [X_train_out2.^3 X_train_out2.^2 X_train_out];

w_3out = least_squares(X_train_3out, Y_train_out);
f_3out = @(x) x*w_3out;
Y_test_pred_3out = f_3out(X_test_3);

plot(X_test,Y_test_pred_3out,'kx');
Y_plot_out = f_3out(X_plot2);
plot(X_plot,Y_plot_out,'k-');

err_3out = lossL2(Y_test, Y_test_pred_3out);
fprintf('Average L2 loss (outlier,cubic): %f\n',err_3out);

