A = [2 1 0; 2 1 3; 1 2 1];
B = [0; 1; 2];
u = 1;
x = [1; 2; 3];
for i = 1:5
xi = x;
k = A*xi(:,end) + B*u;
x = [x,k]
end
