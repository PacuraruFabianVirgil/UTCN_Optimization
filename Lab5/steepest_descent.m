function [Xf] = steepest_descent(f,x1,x2,X,eps,step)
%UNTITLED6 Summary of this function goes here
%   Detailed explanation goes here
figure;
[X1,X2] = meshgrid(-10:0.01:10);
F = f(X1,X2);
contour(X1,X2,F)
hold on;
plot(X(1),X(2),'r*')
aux = X;
Xf = [-99999999; -99999999];
while (abs(Xf(1)-aux(1))>eps)||(abs(Xf(2)-aux(2))>eps)
    grad1 = symfun(diff(f,x1),[x1 x2]);
    grad2 = symfun(diff(f,x2),[x1 x2]);
    gradient = [grad1(X(1),X(2)); grad2(X(1),X(2))];
    Xf(1) = X(1) - step(1)*gradient(1)/norm(gradient);
    Xf(2) = X(2) - step(2)*gradient(2)/norm(gradient);
    aux = X;
    X = Xf;
    plot(Xf(1),Xf(2),'r*')
end
end