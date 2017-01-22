% inputs: the function in question (f), 
%...the dervative of f (df); first x quess (x0); error
function r = newton(f, df, x0, error)
k = 1; 
kmax = 10; 
flag = 0; 
while (flag == 0 && k <= kmax)
    c = df(x0)\f(x0); 
    x = x0 - c;
    k
    x
    %z = (-1 - x)/x %error for 3.33
    %answer = [-19.091286986469562; 17.715780410966186; -0.073075015693475]; 
    %z = (answer - x)*x.' %error for 3.43
    z = (4.493409480899572-x)/x %error for 3.20 
    if (norm( x - x0) < error)
        flag = 1; 
    else 
        k = k + 1;
        x0 = x; 
    end
end 
if (k > kmax)
    disp('iterations exceeded')
end 
r = x 
k
flag
    