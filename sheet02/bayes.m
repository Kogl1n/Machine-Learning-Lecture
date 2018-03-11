%% Bayes classifier
%  maximum likelihood and Bayes classication 

% dataset
[X,Y] = mixGaussian1d(1000,0.5,0.5,0,6,1,2);
bayes_fct( X,Y );
% max. likelihood: 0,1,2 in 1, otherwise in 2
% a posteriori: 0,1,2 in 1, otherwise in 2

[X,Y] = mixGaussian1d(1000,0.1,0.6,0,6,1,2);
bayes_fct( X,Y );
% max. likelihood: 0,1,2 in 1, otherwise in 2
% a posteriori: 0,1 in 1, otherwise in 2









