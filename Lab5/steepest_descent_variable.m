function [Xf] = steepest_descent_variable(f,X,eps)
%UNTITLED6 Summary of this function goes here
%   Detailed explanation goes here
syms x1 x2 s
figure;
[X1,X2] = meshgrid(-10:0.01:10);
F = f(X1,X2);
contour(X1,X2,F)
hold on;
plot(X(1),X(2),'r*')
grad1 = matlabFunction(symfun(diff(f,x1),[x1 x2]));
grad2 = matlabFunction(symfun(diff(f,x2),[x1 x2]));
while true
    gradient = [grad1(X(1),X(2)); grad2(X(1),X(2))];
    a = 0; b = 2;
    g = matlabFunction(f(X(1)-s*gradient(1)/norm(gradient),X(2)-s*gradient(2)/norm(gradient)));
    [a2_golden,b2_golden] = golden(g,a,b,eps/10);
    step = (a2_golden+b2_golden)/2;
    Xf = X - step*gradient/norm(gradient);
    aux = X;
    X = Xf;
    plot(Xf(1),Xf(2),'r*')
    if norm(Xf-aux)<eps
        break;
    end
end
end