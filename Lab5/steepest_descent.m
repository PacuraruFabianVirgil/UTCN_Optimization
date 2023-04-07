function [Xf] = steepest_descent(f,X,eps,step)
%UNTITLED6 Summary of this function goes here
%   Detailed explanation goes here
syms x1 x2
figure;
[X1,X2] = meshgrid(-10:0.01:10);
F = f(X1,X2);
contour(X1,X2,F)
hold on;
plot(X(1),X(2),'r*')
aux = X;
grad1 = matlabFunction(symfun(diff(f,x1),[x1 x2]));
grad2 = matlabFunction(symfun(diff(f,x2),[x1 x2]));
Xf = [-99999999; -99999999];
while norm(Xf-aux)>eps
    norm(Xf-aux);
    gradient = [grad1(X(1),X(2)); grad2(X(1),X(2))];
    Xf(1) = X(1) - step(1)*gradient(1)/norm(gradient);
    Xf(2) = X(2) - step(2)*gradient(2)/norm(gradient);
    aux = X;
    X = Xf;
    plot(Xf(1),Xf(2),'r*')
end
end