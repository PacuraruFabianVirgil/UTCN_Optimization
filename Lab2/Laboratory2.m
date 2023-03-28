load trace1_5.mat

k = time;
y = val;

f = @(k,x) x(1).*k.^x(3).*exp(-x(4).*k)+x(2);

X = fminsearch(@(x) objf(x,k,y,f),[0,0,0,0])

plot(time,val)
hold on
plot(time,f(time,X),'r*')