f = @(x1,x2) 81*x1.^2+27*x1.*x2+18*x2.^2+x2.^4-9;
X = [3; 5];
eps = 0.01;
DFP = true;
BFGS = false;
XDFP = quasi_newton(f,X,eps,DFP)
title("Quasi-Newton method (DFP)")
XBFGS = quasi_newton(f,X,eps,BFGS)
title("Quasi-Newton method (BFGS)")