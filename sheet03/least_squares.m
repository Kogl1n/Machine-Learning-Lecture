function [ w ] = least_squares( X, Y )
w = (X'*X)\(X'*Y); % page 199/Theorem 9
end

