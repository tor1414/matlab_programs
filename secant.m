function r = secant(f, x0, x1, error)
k = 1; 
kmax = 1000; 
flag = 0;
while (flag == 0 && k <= kmax)
    f0 = f(x0);
    f1 = f(x1);
    r = ((x1 - x0)/(f1 - f0))*f1;
    x = x1 - r;
    k
    x
    z = (4.493409480899572-x)/x %error for 3.56
    if (abs(r) < error)
        flag = 1; 
    else
        k = k + 1; 
        x0 = x1; 
        x1 = x; 
    end
end
if (k > kmax)
    disp('Iterations exceeded')
end
r = x
k 
flag