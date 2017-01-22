%Project 4
%Problem 3
%Coded by Victoria Hagan

% Use the Jacobi and Guass-Seidel algorithms to solve the linear system: 
A = [4 1 1 0 1; -1 -3 1 1 0; 2 1 5 -1 -1; -1 -1 -1 4 0; 0 2 -1 1 4]; 
b = [6 6 6 6 6]'; 

% In both cases start with: 
x0 = [0 0 0 0 0]'; 

% then show a table with the first and last three iterations and estimated
% errors. Compare the two methods. 

%extra information for algorithms
tol = 10^(-8);
maxsteps=100;
[n,m]=size(A);

% Jacobi Method
fprintf('%10s\n', 'Jacobi Method')
fprintf('%10s %10s %10s %10s %10s %10s %20s\n', 'iteration', 'X(1)','X(2)','X(3)','X(4)','X(5)', 'Error')

Qa=diag(diag(A)); 
Pa=inv(Qa);
Ma=eye(n)-Pa*A;
ca=Pa*b;

flagA=0;
xa=x0;
k=0;
fprintf('%10s %10g %10g %10g %10g %10g\n', 'guess' , xa(1),xa(2),xa(3),xa(4),xa(5))
while flagA==0
    y=Ma*xa+ca;
    k=k+1;
    if norm(y-xa)<tol
        flagA=1;
    end
    if k > maxsteps
        flagA=1;
        fprintf('Maximum iterations exceeded.\n')
    end
    errorA = norm(y-xa); 
    xa=y;
    
    iterations = [1, 2, 3, 27, 28, 29]; 
    for i = 1:6
            if k == iterations(i)
                fprintf('%10i %10g %10g %10g %10g %10g %20g\n', k , xa(1),xa(2),xa(3),xa(4),xa(5), errorA)
            end
    end
    if k == 7
        fprintf('%10s %10s %10s %10s %10s %10s %20s\n', '...' , '...','...','...','...','...','...')
    end
end

% Guass-Seidel Method
disp(' ')
fprintf('%10s\n', 'Guass-Seidel Method')
fprintf('%10s %10s %10s %10s %10s %10s %20s\n', 'iteration', 'X(1)','X(2)','X(3)','X(4)','X(5)', 'Error')

Qb=tril(A);
Pb=inv(Qb);
Mb=eye(n)-Pb*A;
cb=Pb*b;

flagB=0;
xb=x0;
j=0;
fprintf('%10s %10g %10g %10g %10g %10g\n', 'guess' , xb(1),xb(2),xb(3),xb(4),xb(5))
while flagB==0
    y=Mb*xb+cb;
    j=j+1;
    if norm(y-xb)<tol
        flagB=1;
    end
    if j > maxsteps
        flagB=1;
        fprintf('Maximum iterations exceeded.\n')
    end
    errorB = norm(y-xb);
    xb=y;
    
     iterations = [1, 2, 3, 13, 14, 15]; 
    for i = 1:6
            if j == iterations(i)
                fprintf('%10i %10g %10g %10g %10g %10g %20g\n', j , xb(1),xb(2),xb(3),xb(4),xb(5), errorB)
            end
    end 
    if j == 7
        fprintf('%10s %10s %10s %10s %10s %10s %20s\n', '...' , '...','...','...','...','...','...')
    end
    
    
end
