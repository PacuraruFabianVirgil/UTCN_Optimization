function [af,bf] = fibonacci(f,a,b,eps)
%UNTITLED3 Summary of this function goes here
%   Detailed explanation goes here
F1 = 2;
F2 = 3;
while b-a>=eps
    d = b-a;
    x1 = b-d*F1/F2;
    x2 = a+d*F1/F2;
    if f(x1)<=f(x2)
        b = x2;
    else
        a = x1;
    end
    aux = F2;
    F2 = F1+F2;
    F1 = aux;
end
af = a;
bf = b;
end