function A=trapezodialRule(f,a,b,n)
% a function f, endpoints a and b and subintervals n
step=(b-a)/n; %step size
x=a:step:b; % a vector of x values
y = f(x); % a vector of f(x) values
Area = 0; 
 for i=1:(n-1)
     Area = Area+(y(i)+y(i+1))/2*(x(i+1)-x(i));
 end
 A = Area; 