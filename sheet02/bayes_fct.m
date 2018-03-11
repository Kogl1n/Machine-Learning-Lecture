function [] = bayes_fct( X,Y )
% a) marginals, priors, class cond. distr.

% mixGaussians1d: mixGaussian1d(n,p1,p2,mu1,mu2,sigma1,sigma2)
% Generate 2 1D Gaussians N(mu1, sigma1) and N(mu2,sigma2) and save them in x.
% Total number of points is n, which is splited into random numbers.
% Save according labels 1 and 2 in y.

% Plot the points in 2D
figure; 
plot(X(Y==1), 0, 'rx'); hold on; %plot(-3, X(Y==2), 'bo');
plot(X(Y==2), -1, 'bo');
title('2D plot');

% Plot Marginal; Estimate density by its histogram:
figure; clf; hold all; title('Marginal');
[countC,binsX] = hist(X,30); % binsX is pos. on x-axis
P = countC/size(X,1);
plot(binsX,P,'.-');

% class cond. distr. P(X|Y=1) and P(X|Y=2)
figure; 
numY1 = hist(X(Y==1),binsX);
PYX1 = numY1/size(X(Y==1),1);
plot(binsX, PYX1, 'r.-');
hold on;
numY2 = hist(X(Y==2),binsX);
PYX2 = numY2/size(X(Y==2),1);
plot(binsX, PYX2, 'b.-');
title('class cond. distributions');

% Priors
disp('Priors');
P1 = size(X(Y==1),1)/size(X,1)
P2 = size(X(Y==2),1)/size(X,1)

% b) maximum likelihood and Bayesian a-posteriori
% maximum likelihood: see class cond. distr.

% Bayesian a-posteriori
figure;
PXY1 = PYX1*P1./P;
plot(binsX,PXY1,'r.-');
hold on;
PXY2 = PYX2*P2./P;
plot(binsX,PXY2,'b.-');
title('Bayesian a-posteriori');
% ----------------------------------------
% 5c) Bayesian a-posteriori
figure;
plot(binsX,PXY1,'rx');  % with 0-1-loss: basically the same: page 142 explicit form of the Bayes classifier
hold on;
plot(binsX,PXY2,'bx');
% ++++++

lossPYX1 = 1*PXY1;
lossPYX2 = 100*PXY2;       % with asymm. loss: just multiply max. likelihood
nlossPYX1 = lossPYX1./(lossPYX1+lossPYX2);
nlossPYX2 = lossPYX2./(lossPYX1+lossPYX2);
plot(binsX,nlossPYX1,'r.-');
plot(binsX,nlossPYX2,'b.-');

title('5c) Bayesian a-posteriori');
end

