f = @(x1,x2) x1.^2.*exp(x1)+51.*x2+x2.^4+3;
g = @(x1,x2) x1+3*x2-2
fin = @(x1,x2) f(x1,x2)+(-12.77)*g(x1,x2)
g_x1 = @(x2) -3*x2+2  
x1 = linspace(-4,3,1000)
x2 = linspace(-4,3,1000)'
lambda = -12.77
contour(x1,x2,f(x1,x2))
hold on
plot(1.2,0.26,'r*')
hold on
x2  =-1:0.01:2
plot(g_x1(x2),x2)
%%
syms x1 x2 lam
eq1 = exp(x1)*x1*(x1+2)+lam == 0
eq2 = 4*x2^3+51+4*lam == 0
eq3 = x1+3*x2-2 == 0
sol = solve([eq1,eq2,eq3],[x1,x2,lam])

vpa(sol.x1)
vpa(sol.x2)
vpa(sol.lam)