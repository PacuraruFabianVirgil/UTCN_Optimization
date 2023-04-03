syms x1 x2
f = @(x1,x2) 81*x1.^2+27*x1.*x2+18*x2.^2+x2.^4-9;
X = [7; 2];
step = [0.15; 0.12];
eps = 0.1;
Xfnewt = eval(newton(f,x1,x2,X,eps))
title("Newton method")
Xfmodnewt = eval(modified_newton(f,x1,x2,X,eps))
title("Modified Newton method")
Xfsteep = steepest_descent(f,x1,x2,X,eps,step)
title("Steepest Descent method")
Xfsteepvar = eval(steepest_descent_variable(f,x1,x2,X,eps,step(1)))
title("Variable Steepest Descent method")