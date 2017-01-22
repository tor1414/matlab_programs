%Project 4
%Problem 1 (6.16)
%Coded by Victoria Hagan

%Find the exact solution x of the system Ax = b:
A = [3 1; 9999 900]; 
b1 = [294, 70002]'; 

% 3x + y = 294
% y = 294 - 3x

% 9999x + 900y = 70002
% 9999x + 900(294-3x)= 70002
% 9999x + 264600 - 2700x = 70002
% 7299x = -194598
% x = -26.6609

% y = 294 - 3x
% y = 294 - 3(-26.6609)
% y = 294 + 79.9827
% y = 373.9827

x1 = A\b1;  %the exact solution to Ax = b
fprintf('%10s\n', 'Perturb Comparison')
fprintf('%20s %3s %10s %10s %3s %3s %10s %10s %3s\n','Type', '<','b(1)', 'b(2)', '>', '<', 'x(1)', 'x(2)', '>')
fprintf('%20s %3s %10g %10g %3s %3s %10g %10g %3s\n', 'Original', '<',b1(1), b1(2), '>', '<', x1(1), x1(2), '>')
%Then perturb b to: 
b2 = [294.001 70002.01]';
%and find the new solution of the new system. 
x2 = A\b2;  %the perturbed solution 
fprintf('%20s %3s %10g %10g %3s %3s %10g %10g %3s\n', 'Perturbation', '<',b2(1), b2(2), '>', '<', x2(1), x2(2), '>')

%Compare the relative and absolute errors in b 
%with the corresponding errors in x. 
disp(' ')
fprintf('%20s %20s %20s\n', 'Error type', 'Error of b','Error of x')

%relative error of b
relB = norm(b2-b1)/norm(b1); 
%relative error of x
relX = norm(x2-x1)/norm(x1); 
fprintf('%20s %20g %20g\n', 'Relative', relB,relX)

%absolute error of b
absB = norm(b2-b1); 
%absolute error of x
absX = norm(x2-x1); 
fprintf('%20s %20g %20g\n', 'Absolute', absB,absX)




