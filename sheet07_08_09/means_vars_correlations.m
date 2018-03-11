% you have to remove the header by hand!
train = cell2mat(out)
% means
len_train = size(train, 2);
means=zeros(1, len_train);
for i=1:len_train
    means(i)=mean(train(:,i));
end

% variances
variances=zeros(1,len_train);
for i=1:len_train
     variances(i)=var(train(:,i));
end

% correlations
correlations = zeros(len_train,len_train);

for i=1:len_train
    for j=1:len_train
        correlations(i,j)=corr(train(:,i),train(:,j));
    end
end
 
 






