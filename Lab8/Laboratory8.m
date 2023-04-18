f = @(x1,x2) x1.^2+x2.^2-4*x1-4*x2;
eps = 0.01;
V1 = [-1;-3]; V2 = [2;4]; V3 = [-5;4];
[V1,V2,V3] = nelder_mead(f,eps,V1,V2,V3);
title("Nelder Mead")