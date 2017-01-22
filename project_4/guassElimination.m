function x = guassElimination(A,b)
% a matrix A and the a solution vector b 
[r, c]=size(A);

%Simplify A into a upper triangular matrix
for i=1:(r-1) %loop through the rows
    p=A(i, i);  %piviot
    
    for k=i+1:r %loop through the rows after the pivot
        m = A(k, i)/p; %the scalar
        A(k,:)=A(k,:)-m*A(i,:);
        b(k)=b(k)-m*b(i); 
    end
end

% back substitution
x = zeros(r,1); 
x(r)=b(r)/A(r,r); 

for j = (r-1):-1:1
    x(j)=(b(j)-A(j,(j+1):r)*x((j+1):r))/A(j,j); 
end


    