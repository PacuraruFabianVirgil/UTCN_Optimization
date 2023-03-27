[x,y] = meshgrid(-pi:0.01:pi)
R = sin(x)+cos(y)-sin(y)
mesh(x,y,R)