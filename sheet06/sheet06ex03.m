% Exercise 3
sigma = [2,-1;-1,2];
mu = [1,1];

X = mvnrnd(mu,sigma,500);
[V,D] = PCA(X);
[V1,D1] = eig(sigma);

figure; daspect([1,1,1]); plot(X(:,1)-mu(1),X(:,2)-mu(2),'+'); hold on; 
plot([V(1) 0 V(3)],[V(2) 0 V(4)],'ro-');
plot([V1(1) 0 V1(3)],[V1(2) 0 V1(4)],'g+');
axis equal