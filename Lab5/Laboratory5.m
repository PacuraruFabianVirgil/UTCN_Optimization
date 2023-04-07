f = @(x1,x2) 81*x1.^2+27*x1.*x2+18*x2.^2+x2.^4-9;
X = [9; 5];
eps = 0.1;
if abs(X(1))<abs(X(2))
    step = [(1+X(1)/X(2)*0.1)*eps; (1-X(1)/X(2)*0.1)*eps];
else
    step = [(1+X(2)/X(1)*0.1)*eps; (1-X(2)/X(1)*0.1)*eps];
end
Xfnewt = newton(f,X,eps)
title("Newton method")
Xfmodnewt = modified_newton(f,X,eps)
title("Modified Newton method")
Xfsteep = steepest_descent(f,X,eps,step)
title("Steepest Descent method")
Xfsteepvar = steepest_descent_variable(f,X,eps)
title("Variable Steepest Descent method")