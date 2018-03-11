%% mixed Gaussians 2D
% a)
[X,Y] = mixGaussian2d(100,0.4,0.6);
disp('sample mean and covariance:');
disp('class 1:');
mean1=mean(X(Y==1,:));
disp(mean1)
cov1=cov(X(Y==1,:));
disp(cov1)

disp('class 2:');
mean2=mean(X(Y==2,:));
disp(mean2)
cov2=cov(X(Y==2,:));
disp(cov2)

% b)
% Decision boundary 
% see Duda 2.6.3

% c)Plot Classes and Means
plot(X(Y==1,1),X(Y==1,2),'ro');
hold on;
plot(mean(X(Y==1,1)),mean(X(Y==1,2)),'r*','MarkerSize', 12)
plot(X(Y==2,1),X(Y==2,2),'bo');
plot(mean(X(Y==2,1)),mean(X(Y==2,2)),'b*','MarkerSize', 12)

% Plot Boundary
xrange=min(X(:,1)):0.1:max(X(:,1));
yrange=min(X(:,2)):0.1:max(X(:,2));
plotxy=[0,0];
for pointx=xrange
    for pointy=yrange
        v=[pointx;pointy];
        test=-0.5*v'*(inv(cov2)-inv(cov1))*v+(cov1\mean1'-cov2\mean2')'*v;
        test=test-0.5*mean2/cov2*mean2'+0.5*mean1/cov1*mean1'-0.5*log(det(cov2))+0.5*log(det(cov1))+log(0.6)-log(0.4);
        if abs(test)<0.06
            plotxy=[plotxy;pointx,pointy];           
        end
    end
end
lengt=size(plotxy,1);
plot(plotxy(2:lengt,1),plotxy(2:lengt,2),'g-')
