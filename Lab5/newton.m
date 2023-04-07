function [Xf] = newton(f,X,eps)
%UNTITLED3 Summary of this function goes here
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
hessian11 = matlabFunction(symfun(diff(f,x1,2),[x1 x2]));
hessian12 = matlabFunction(symfun(diff(f,x1,x2),[x1 x2]));
hessian21 = matlabFunction(symfun(diff(f,x2,x1),[x1 x2]));
hessian22 = matlabFunction(symfun(diff(f,x2,2),[x1 x2]));
Xf = [-99999999; -99999999];
while norm(Xf-aux)>eps
    gradient = [grad1(X(1),X(2)); grad2(X(1),X(2))];
    hessian = [hessian11(X(1),X(2)), hessian12(X(1),X(2)); hessian21(X(1),X(2)), hessian22(X(1),X(2))];
    Xf = X - hessian\gradient;
    aux = X;
    X = Xf;
    plot(Xf(1),Xf(2),'r*')
end
end