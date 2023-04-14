f = @(x1,x2) 81*x1.^2+27*x1.*x2+18*x2.^2+x2.^4-9;
X = [5; 2];
eps = 0.01;
Fletcher = true;
Polak = false;
XFletcher = conjugate_gradient(f,X,eps,Fletcher)
title("Conjugate gradient method (Fletcher)")
XPolak = conjugate_gradient(f,X,eps,Polak)
title("Conjugate gradient method (Polak)")