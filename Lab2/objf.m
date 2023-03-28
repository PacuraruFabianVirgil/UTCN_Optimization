function [out] = objf(x,k,y,f)
out = 0;
for i=1:length(k)
    out = out + (y(i)-f(k(i),x))^2;
end
end