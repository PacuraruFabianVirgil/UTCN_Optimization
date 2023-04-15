function [Xf] = quasi_newton(f,X,eps,DFP)
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
B = [1 0; 0 1];
while true
    d = -B*[grad1(X(1),X(2)); grad2(X(1),X(2))];
    a = 0; b = 1;
    g = matlabFunction(f(X(1)+s*d(1),X(2)+s*d(2)));
    [a2_golden,b2_golden] = golden(g,a,b,eps/500);
    step = (a2_golden+b2_golden)/2
    Xf = X + step*d;
    deltaX = Xf - X;
    deltaG = [grad1(Xf(1),Xf(2))-grad1(X(1),X(2)); grad2(Xf(1),Xf(2))-grad2(X(1),X(2))];
    if DFP
        B = B+deltaX*deltaX'/(deltaX'*deltaG)-B*deltaG*(B*deltaG)'/(deltaG'*B*deltaG);
    else
        B = B+deltaG*deltaG'/(deltaG'*deltaX)-B*deltaX*(B*deltaX)'/(deltaX'*B*deltaX);
    end
    aux = X;
    X = Xf;
    plot(Xf(1),Xf(2),'r*')
    if norm(Xf-aux)<eps
        break;
    end
end
end