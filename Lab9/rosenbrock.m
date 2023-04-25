function [xf] = rosenbrock(f,x0,n,d,s,alpha,beta,eps)
%UNTITLED6 Summary of this function goes here
%   Detailed explanation goes here
figure;
[X1,X2] = meshgrid(-10:0.01:10);
F = f(X1,X2);
contour(X1,X2,F)
hold on;
a = zeros(2,n);
b = zeros(2,n);
xp = x0;
xf = x0;
while true
    c = zeros(1,n);
    oscillation = false;
    success = zeros(1,n);
    fail = zeros(1,n);
    while oscillation==false
        for i=1:n
            if f(xf(1)+s(i)*d(1,i), xf(2)+s(i)*d(2,i))<=f(xf(1), xf(2))
                xp = xf;
                xf = xp+s(i)*[d(1,i); d(2,i)];
                success(i) = 1;
                c(i) = c(i)+s(i);
                s(i) = s(i)*alpha;
                line([xp(1) xf(1)],[xp(2) xf(2)]);
            else
                fail(i) = 1;
                s(i) = s(i)*beta;
            end
        end
        if sum(success)+sum(fail)==2*n
            oscillation = true;
        end
    end
    for i=1:n
        a(1,i) = 0;
        a(2,i) = 0;
        for j = i:n
            a(1,i) = a(1,i)+c(j)*d(1,j);
            a(2,i) = a(2,i)+c(j)*d(2,j);
        end
    end
    for i=1:n
        b(1,i) = a(1,i);
        b(2,i) = a(2,i);
        if i>=2
            for j=1:(i-1)
                b(1,i) = b(1,i)-[a(1,i) a(2,i)]*[b(1,j); b(2,j)]/norm([b(1,j); b(2,j)])^2*b(1,j);
                b(2,i) = b(2,i)-[a(1,i) a(2,i)]*[b(1,j); b(2,j)]/norm([b(1,j); b(2,j)])^2*b(2,j);
            end
        end
        d(1,i) = b(1,i)/norm([b(1,i); b(2,i)]);
        d(2,i) = b(2,i)/norm([b(1,i); b(2,i)]);
    end
    if norm(xf-xp)<eps
        break;
    end
end