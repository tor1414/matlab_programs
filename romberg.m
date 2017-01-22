function A = romberg(f, a, b, m)
%a function f, endpoints a and b and row/columns m
%Romberg matrix is mxm

R = zeros(m,m); 

for i=1:m
    R(i,1)=trapezodialRule(f, a, b, 2^(i-1)); 
end

for j=2:m
    for i=j:m
        R(i,j)=4^j/(4^j-1)*R(i,j-1)-1/(4^j-1)*R(i-1, j-1); 
    end
end
R
A = R(m,m)
