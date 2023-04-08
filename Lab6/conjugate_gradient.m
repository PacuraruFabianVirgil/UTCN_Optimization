function [Xf] = conjugate_gradient(f,X,eps,fletcher)
%UNTITLED6 Summary of this function goes here
%   Detailed explanation goes here
syms x1 x2 s
figure;
[X1,X2] = meshgrid(-10:0.01:10);
F = f(X1,X2);
contour(X1,X2,F)
hold on;
plot(X(1),X(2),'r*')
aux = X;
grad1 = matlabFunction(symfun(diff(f,x1),[x1 x2]))
grad2 = matlabFunction(symfun(diff(f,x2),[x1 x2]))
d = [-grad1(X(1),X(2)); -grad2(X(1),X(2))];
Xf = [-99999999; -99999999];
while norm(Xf-aux)>eps
    a = 0; b = 2;
    g = matlabFunction(f(X(1)+s*d(1),X(2)+s*d(2)))
    [a2_golden,b2_golden] = golden(g,a,b,eps/10);
    step = (a2_golden+b2_golden)/2;
    Xf = X + step*d;
    if fletcher
        B = norm([grad1(Xf(1),Xf(2)); grad2(Xf(1),Xf(2))])^2/norm([grad1(X(1),X(2)); grad2(X(1),X(2))])^2;
    else
        B = [grad1(Xf(1),Xf(2)) grad2(Xf(1),Xf(2))]*([grad1(Xf(1),Xf(2)); grad2(Xf(1),Xf(2))]-[grad1(X(1),X(2)); grad2(X(1),X(2))])/...
            ([grad1(X(1),X(2)) grad2(X(1),X(2))]*[grad1(X(1),X(2)); grad2(X(1),X(2))]);
    end
    d = [-grad1(Xf(1),Xf(2))+B*d(1); -grad2(Xf(1),Xf(2))+B*d(2)];
    aux = X;
    X = Xf;
    plot(Xf(1),Xf(2),'r*')
end
end