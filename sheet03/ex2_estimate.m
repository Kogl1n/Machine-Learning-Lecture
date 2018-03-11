function [ p1est, p2est, d1abs, d2abs, d1rel, d2rel, order ] = ex2_estimate( d, n, p1, p2 )

for i=1:d
   s1(i) = binornd(n, p1);
   s2(i) = binornd(n, p2);
end
% estimate p1est, p2est, abs and rel difference, order p2est>p1est?
p1est = s1/n; p2est = s2/n;
d1abs = p1*ones(1,d)-p1est; d2abs = p2*ones(1,d)-p2est;
d1rel = (p1*ones(1,d)-p1est)/p1; d2rel = (p2*ones(1,d)-p2est)/p2;
order = zeros(1,d);
for j=d
    if p2est(j) < p1est(j) % 1 when in wrong order
        order(j) = 1;
    end
end

end

