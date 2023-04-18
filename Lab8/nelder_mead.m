function [V1,V2,V3] = nelder_mead(f,eps,V1,V2,V3)
%UNTITLED6 Summary of this function goes here
%   Detailed explanation goes here
figure;
[X1,X2] = meshgrid(-10:0.01:10);
F = f(X1,X2);
contour(X1,X2,F)
line([V1(1) V2(1)], [V1(2) V2(2)])
line([V2(1) V3(1)], [V2(2) V3(2)])
line([V3(1) V1(1)], [V3(2) V1(2)])
hold on;
while true
    aux = [V1(1) V1(2) f(V1(1),V1(2)); V2(1) V2(2) f(V2(1),V2(2)); V3(1) V3(2) f(V3(1),V3(2))];
    aux = sortrows(aux,3);
    B = [aux(1,1); aux(1,2)];
    G = [aux(2,1); aux(2,2)];
    W = [aux(3,1); aux(3,2)];
    M = (B+G)/2;
    R = 2*M-W;
    if f(R(1),R(2))<f(W(1),W(2))
        E = 2*R-M;
        if f(E(1),E(2))<f(R(1),R(2))
            W = E;
        else
            W = R;
        end
    else
        C1 = (M+W)/2;
        C2 = (M+R)/2;
        if f(C1(1),C1(2))<f(C2(1),C2(2))
            C = C1;
        else
            C = C2;
        end
        if f(C(1),C(2))<f(W(1),W(2))
            W = C;
        else
            S = (B+W)/2;
            W = S;
            G = M;
        end
    end
    V1 = B; V2 = G; V3 = W;
    line([V1(1) V2(1)], [V1(2) V2(2)])
    line([V2(1) V3(1)], [V2(2) V3(2)])
    line([V3(1) V1(1)], [V3(2) V1(2)])
    if (norm(V1-V2)+norm(V2-V3)+norm(V3-V1))<eps
        break;
    end
end
end