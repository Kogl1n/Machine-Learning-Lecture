% correlations

for i=1:len_train
     for j=1:len_train
         correlations(i,j)=corr(train(:,i),train(:,j));
     end
 end