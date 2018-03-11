%% binornd: estimating probs
% ---------------------------------------------------------------
% ---------------------------------------------------------------
% a)
d=1;
n = 10;
p1 = 0.4;
p2 = 0.5;
[ p1est, p2est, d1abs, d2abs, d1rel, d2rel, order ]=ex2_estimate( d, n, p1, p2 );
disp('p1est and p2est are:'); disp(p1est); disp(p2est);
disp('absolute difference: p1-p1est, p2-p2est'); disp(d1abs); disp(d2abs);
disp('relative difference: p1, p2'); disp(d1rel); disp(d2rel);
if order==1
   disp('Yes, order is preserved.');
else
   disp('No, order is NOT preserved.');
end
% ---------------------------------------------------------------
% b) % c)
d=100;
n=[10; 100; 1000; 10000];
for i=1:4
[ p1est, p2est, d1abs, d2abs, d1rel, d2rel, order ]=ex2_estimate( d, n(i), p1, p2 );
meanabs1(i) = mean(d1abs);
meanabs2(i) = mean(d2abs);
maxabs1(i) = max(d1abs);
maxabs2(i) = max(d2abs);
minabs1(i) = min(d1abs);
minabs2(i) = min(d2abs);

meanrel1(i) = mean(d1rel);
meanrel2(i) = mean(d2rel);
maxrel1(i) = max(d1rel);
maxrel2(i) = max(d2rel);
minrel1(i) = min(d1rel);
minrel2(i) = min(d2rel);
perc_order(i)=sum(order); % in percent
end
figure;
subplot(1,3,1);
semilogx(n(2:4),meanabs1(2:4),n(2:4),meanabs2(2:4),n(2:4),maxabs1(2:4),n(2:4),maxabs2(2:4),n(2:4),minabs1(2:4),n(2:4),minabs2(2:4));
legend('meanabs1','meanabs2','maxabs1','maxabs2','minabs1','minabs2');
subplot(1,3,2);
semilogx(n(2:4),meanrel1(2:4),n(2:4),meanrel2(2:4),n(2:4),maxrel1(2:4),n(2:4),maxrel2(2:4),n(2:4),minrel1(2:4),n(2:4),minrel2(2:4));
legend('meanrel1','meanrel2','maxabs1','maxrel2','minrel1','minrel2');
subplot(1,3,3);
semilogx(n(2:4),perc_order(2:4));
% ---------------------------------------------------------------
% d)
clear all
p1 = 0.1; p2 = 0.5;
d=1;
n = 10;
[ p1est, p2est, d1abs, d2abs, d1rel, d2rel, order ]=ex2_estimate( d, n, p1, p2 );
disp('p1est and p2est are:'); disp(p1est); disp(p2est);
disp('absolute difference: p1-p1est, p2-p2est'); disp(d1abs); disp(d2abs);
disp('relative difference: p1, p2'); disp(d1rel); disp(d2rel);
if order==1
   disp('Yes, order is preserved.');
else
   disp('No, order is NOT preserved.');
end

d=100;
n=[10; 100; 1000; 10000];
for i=1:4
[ p1est, p2est, d1abs, d2abs, d1rel, d2rel, order ]=ex2_estimate( d, n(i), p1, p2 );
meanabs1(i) = mean(d1abs);
meanabs2(i) = mean(d2abs);
maxabs1(i) = max(d1abs);
maxabs2(i) = max(d2abs);
minabs1(i) = min(d1abs);
minabs2(i) = min(d2abs);

meanrel1(i) = mean(d1rel);
meanrel2(i) = mean(d2rel);
maxrel1(i) = max(d1rel);
maxrel2(i) = max(d2rel);
minrel1(i) = min(d1rel);
minrel2(i) = min(d2rel);
perc_order(i)=sum(order); % in percent
end
figure;
subplot(1,3,1);
semilogx(n(2:4),meanabs1(2:4),n(2:4),meanabs2(2:4),n(2:4),maxabs1(2:4),n(2:4),maxabs2(2:4),n(2:4),minabs1(2:4),n(2:4),minabs2(2:4));
legend('meanabs1','meanabs2','maxabs1','maxabs2','minabs1','minabs2');
subplot(1,3,2);
semilogx(n(2:4),meanrel1(2:4),n(2:4),meanrel2(2:4),n(2:4),maxrel1(2:4),n(2:4),maxrel2(2:4),n(2:4),minrel1(2:4),n(2:4),minrel2(2:4));
legend('meanrel1','meanrel2','maxabs1','maxrel2','minrel1','minrel2');
subplot(1,3,3);
semilogx(n(2:4),perc_order(2:4));

% ++++++++++++++++++++++++++++++++++++++++++
clear all
p1 = 0.01; p2 = 0.02;
d=1;
n = 10;
[ p1est, p2est, d1abs, d2abs, d1rel, d2rel, order ]=ex2_estimate( d, n, p1, p2 );
disp('p1est and p2est are:'); disp(p1est); disp(p2est);
disp('absolute difference: p1-p1est, p2-p2est'); disp(d1abs); disp(d2abs);
disp('relative difference: p1, p2'); disp(d1rel); disp(d2rel);
if order==1
   disp('Yes, order is preserved.');
else
   disp('No, order is NOT preserved.');
end

d=100;
n=[10; 100; 1000; 10000];
for i=1:4
[ p1est, p2est, d1abs, d2abs, d1rel, d2rel, order ]=ex2_estimate( d, n(i), p1, p2 );
meanabs1(i) = mean(d1abs);
meanabs2(i) = mean(d2abs);
maxabs1(i) = max(d1abs);
maxabs2(i) = max(d2abs);
minabs1(i) = min(d1abs);
minabs2(i) = min(d2abs);

meanrel1(i) = mean(d1rel);
meanrel2(i) = mean(d2rel);
maxrel1(i) = max(d1rel);
maxrel2(i) = max(d2rel);
minrel1(i) = min(d1rel);
minrel2(i) = min(d2rel);
perc_order(i)=sum(order); % in percent
end
figure;
subplot(1,3,1);
semilogx(n(2:4),meanabs1(2:4),n(2:4),meanabs2(2:4),n(2:4),maxabs1(2:4),n(2:4),maxabs2(2:4),n(2:4),minabs1(2:4),n(2:4),minabs2(2:4));
legend('meanabs1','meanabs2','maxabs1','maxabs2','minabs1','minabs2');
subplot(1,3,2);
semilogx(n(2:4),meanrel1(2:4),n(2:4),meanrel2(2:4),n(2:4),maxrel1(2:4),n(2:4),maxrel2(2:4),n(2:4),minrel1(2:4),n(2:4),minrel2(2:4));
legend('meanrel1','meanrel2','maxabs1','maxrel2','minrel1','minrel2');
subplot(1,3,3);
semilogx(n(2:4),perc_order(2:4));
% ---------------------------------------------------------------
% e) Conclusion about accuracies of estimates
% Law of big numbers (lbn)
% => more tries (n) -> higher accuracy