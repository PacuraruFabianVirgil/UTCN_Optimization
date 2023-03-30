f = @(x) x.^4-3*x.^2;
a = -4; b = 0; eps = 0.05;
k = a:eps:b;
plot(k,f(k))
[a_golden,b_golden] = golden(f,a,b,eps);
[a_fibonacci,b_fibonacci] = fibonacci(f,a,b,eps);

X = [0,0];
D = [1,1];
X1 = @(s) X(1)+s*D(1);
X2 = @(s) X(2)+s*D(2);
f2 = @(s) 5*X1^2+3*X1*X2-X2^2+X2^4;
a = 0; b = 20; eps = 0.05;
k = a:eps:b;
plot(k,f(k))
[a2_golden,b2_golden] = golden(f,a,b,eps);
[a2_fibonacci,b2_fibonacci] = fibonacci(f,a,b,eps);
s = (a2_fibonacci+b2_fibonacci)/2;