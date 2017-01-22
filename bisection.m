% inputs: the fuction in question (f), endpoints right (a) & left (b)
% outputs: the root (r) where x = 0
function r = bisection(f, a, b, error)
format long; 
fa = f(a); % y = f(a) for x = a
fb = f(b); % y = f(c) for x = b
% we want to create a loop that will end
k = 1; % iteration counter
kmax = 1000000; % could end when we hit a max number of interations
flag = 0; % could end when we are close to zero
error = error; % could end when the error gets very small
while ( flag == 0 && k <= kmax) 
    c = (a + b)/2; % midpint between a and b = current quess. 
    fc = f(c); % y = f(c) when x = c
    k 
    c
    %z = (2.714417617768049 - c)/c %error for 3.7
    z = (4.493409480899572 - c)/c %error for 3.5
    %z = (4.188790203072131 - c)/c %error for 3.57
    if (abs(fc)<10^(-16) || (b-a) < error)
        flag = 1;
    else  
        k = k + 1;
        if (sign(fa)*sign(fc) < 0)
            b = c; 
            fb = fc; 
        else 
            a = c; 
            fa = fc; 
        end
    end 
end 
if (k > kmax)
    disp('Iterations Exceeded')
end
r = c
k
flag
