function [ V, D ] = PCA( data )

cData = data-repmat(mean(data),[size(data,1) 1]);
C = cov(cData);
[V,D] = eig(C);

end