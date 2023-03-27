function [out] = my_stat(x,y)
%UNTITLED2 Summary of this function goes here
%   Detailed explanation goes here
if length(x) == 1
    a = 0;
    for i=1:10
        a = a+(x^i)*y + y/x;
    end
    out = a;
else
    x(end+1) = y;
    out = sort(x);
end
end