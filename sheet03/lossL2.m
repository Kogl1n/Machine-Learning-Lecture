function [ err ] = lossL2( Y, Y_pred )
err = sqrt(sum((Y-Y_pred).^2))/length(Y);
end