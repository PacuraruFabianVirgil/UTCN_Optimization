f = @(x1,x2) 5*x1.^4+x1.^2.*x2+x2.^2-3*x2+1;
x0 = [4; -2];
n = 2;
d = eye(2);
s = [0.5 0.5];
alpha = 2;
beta = -0.8;
eps = 0.01;
x = rosenbrock(f,x0,n,d,s,alpha,beta,eps);
title("Rosenbrock")