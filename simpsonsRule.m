function s = simpsonsRule(f, a, b, n)
% a function f, endpoint left a, right b, 
% and the even number n of intervals
step = (b-a)/n; %step size
x = a:step:b; %vector of values from a to b, distance h apart
y = f(x); % a vector of corresponding f(x)s for X

sum = 0; 
for i=1:n/2
    sum = sum + y(2*i-1)+4*y(2*i)+y(2*i+1); 
end

A = step/3*sum %Area 