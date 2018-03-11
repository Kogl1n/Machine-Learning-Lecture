%%%%%% function loss01
function err = loss01(y_pred, y)
len = length(y);
err = 0;
for i = 1 : len
    if y_pred(i) ~= y(i)
        err = err + 1;
    end
end
err = err/len;
end


