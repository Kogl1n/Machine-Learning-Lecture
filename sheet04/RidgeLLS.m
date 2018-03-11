function [w] = RidgeLLS(X, Y, lambda)
n = size(X, 1);
d = size(X, 2);
w = (X'*X+(n*lambda*eye(d)))\X'*Y;
end

