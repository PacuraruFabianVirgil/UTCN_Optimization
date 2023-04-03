function [Xf] = newton(f,x1,x2,X,eps)
%UNTITLED3 Summary of this function goes here
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
    hessian11 = symfun(diff(f,x1,2),[x1 x2]);
    hessian12 = symfun(diff(f,x1,x2),[x1 x2]);
    hessian21 = symfun(diff(f,x2,x1),[x1 x2]);
    hessian22 = symfun(diff(f,x2,2),[x1 x2]);
    hessian = [hessian11(X(1),X(2)), hessian12(X(1),X(2)); hessian21(X(1),X(2)), hessian22(X(1),X(2))];
    Xf = X - hessian\gradient;
    aux = X;
    X = Xf;
    plot(Xf(1),Xf(2),'r*')
end
end