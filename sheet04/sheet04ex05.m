%% sheet04ex05

clear all; clc;
load('iris_multiclass.mat');

n_train = length(indices_train);
n_test  = length(indices_test);

%% 1 = setosa, 2 = versicolor, 3 = virginica
species_enc = zeros(150, 1);
species_enc(1:50)    = 1;
species_enc(51:100)  = 2;
species_enc(101:150) = 3;

%% create training and test data
x_test = meas(indices_test,:);
y_test = species_enc(indices_test);
x_train = meas(indices_train,:);
y_train = species_enc(indices_train);
x_train = [ones(n_train,1), x_train];

%% calculate w_set, w_ver, w_vir
w_set = least_squares(x_train, y_train == 1);
w_ver = least_squares(x_train, y_train == 2);
w_vir = least_squares(x_train, y_train == 3);

f_set = [ ones(length(x_test),1),x_test] * w_set;
f_ver = [ ones(length(x_test),1),x_test] * w_ver;
f_vir = [ ones(length(x_test),1),x_test] * w_vir;

%% max acts on columns
[~, y_pred] = max([f_set, f_ver, f_vir]');
y_pred = y_pred';

err01 = loss01(y_test, y_pred);
fprintf('The average 01-error is: %f \n', err01);

%% 1c)
% potential problems of LS regression for multi-class classification:
% K >= 3 classes, classes can be masked by others 
% general: polynomials up to degree K-1 for K classes, Hastie 4.2 105/106




