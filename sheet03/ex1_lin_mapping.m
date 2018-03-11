%% Exercise 1: Linear Mapping
% load data
load('Adot.mat');
% a),b)
theta = pi/3;
V = [cos(theta) -sin(theta);sin(theta) cos(theta)];

% V rotates the image by 60 degree (pi/3)
% V is orthogonal so VV^t= id
Y=V*X;
Z=V'*Y;

plot(X(1,:),X(2,:),'r*');
hold on
plot(Y(1,:),Y(2,:),'b*');
plot(Z(1,:),Z(2,:),'g*');
legend('X','Y','Z=X')

% c)
D1=[2 0;0 2];
D2=[2 0;0 1];
figure;
D_1=D1*X;
D_2=D2*X; 
% D1 and D2 strech the image 
plot(X(1,:),X(2,:),'r*');
hold on
plot(D_1(1,:),D_1(2,:),'b*');
plot(D_2(1,:),D_2(2,:),'g*');
legend('X','D1=2002','D2=2001')
  
figure;
A = V'*D2*V*X;
plot(X(1,:),X(2,:),'r*');
hold on
plot(A(1,:),A(2,:),'b*');
legend('X','A=V^T*D2*V*X')
