function [Xf] = steepest_descent_variable(f,x1,x2,X,eps,step)
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
    a = -10; b = 10;
    g = @(step) f(X(1)-step*gradient(1)/norm(gradient),X(2)-step*gradient(2)/norm(gradient));
    [a2_golden,b2_golden] = golden(g,a,b,eps);
    step = (a2_golden+b2_golden)/2;
    Xf = X - step.*gradient./norm(gradient);
    aux = X;
    X = Xf;
    plot(Xf(1),Xf(2),'r*')
end
end