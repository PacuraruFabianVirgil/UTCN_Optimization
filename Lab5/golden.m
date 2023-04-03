function [af,bf] = golden(f,a,b,eps)
%UNTITLED3 Summary of this function goes here
%   Detailed explanation goes here

d = b-a;
while b-a>=eps
    d = 0.618*d;
    x1 = b-d;
    x2 = a+d;
    if f(x1)<=f(x2)
        b = x2;
    else
        a = x1;
    end
end
af = a;
bf = b;
end