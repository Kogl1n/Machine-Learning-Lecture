clear all;
addpath ..\shared\cvx
addpath ..\shared\cvx\structures
addpath ..\shared\cvx\lib
addpath ..\shared\cvx\functions
addpath ..\shared\cvx\commands
addpath ..\shared\cvx\builtins

load('cancer-data.mat');
c = [0.01, 0.1, 0.5, 1.5, 10, 50];

for i=1:length(c)
    err_train(i) = crossValidation(cancerInput_train, cancerTarget_train, c(i), 3);
    
    [w,b] = solveSVM( c(i), cancerInput_train, cancerTarget_train );
    pred = sign(cancerInput_test*w+b);
    err_test(i) = loss01(pred,cancerTarget_test);
end
semilogx(c,err_train,'g*-',c,err_test,'r*-');
legend('training err','test err');