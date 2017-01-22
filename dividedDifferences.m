function D = dividedDifferences(x , y); 
%two row vectors x and y taken in
%output: matrix d
n = length(x); 
D = zeros(n, n); 
D(:, 1)= y'; 
c(1)= y(1);  
for j = 2:n 
    for i=j:n
        D(i,j)= (D(i,j-1)-D(i-1, j-1))/(x(i)-x(i-j+1));
    end; 
    c(j) = D(j,j); 
end; 


a = min(x); 
b = max(x); 
xx = a:.01:b; 
o = ones(1,n); 
yy = (xx-x(n-1)*o)*c(n)*o; 
for k=(n-2):-1:1
    yy=yy.*(xx-x(k)*o)+c(k)*o; 
end; 

plot(x, y, 'ro') 
hold on; 
plot(xx, yy)



        
    