%Project 4
%Problem 4
%Coded by Victoria Hagan

load ('nfl.mat', 'Scores', 'Teams'); stats = Scores; 
[n,m] = size(stats); 

%-------------------------------------------------------------------
% Part a) Colley Method

% use game data to construct the colley matrix C decribed in class, and 
% then find the colley ranking of each team. List the teams in order from
% highest eanking to lowest. 
%-------------------------------------------------------------------

%colley matrix 1: obtain and sort stats 
Cdata = zeros(32,3);
for i=1:n
    %win, loss, total
    w = 1; l = 2; t = 3; 
    
    %the values in stats for each row
    team1 = stats(i,1);
    t1score = stats(i,2); 
    team2  = stats(i,3);
    t2score = stats(i,4);
    
    %up the total games played for each team
    Cdata(team1, t) = Cdata(team1, t) + 1; 
    Cdata(team2, t) = Cdata(team2, t) + 1; 
    
    %up the wins and losses for the teams accordingly
    if (t1score > t2score)
        Cdata(team1, w) = Cdata(team1, w) + 1;
        Cdata(team2, l) = Cdata(team2, l) + 1;
    elseif (t1score < t2score)
       Cdata(team2, w) = Cdata(team2, w) + 1;
       Cdata(team1, l) = Cdata(team1, l) + 1;
    elseif (t1score == t2score)
        disp('Tied game'); 
    end
end


%The actual colley matrix

C = zeros(32,32);
%create the diagonal
%C(i,j)= 2 + ti when i == j
for i = 1:32
   C(i,i) = 2 + Cdata(i,3);
end

%find games played against every team and place in all other entries.
% C(i, j) = -n when i ~= j
% where n is the total number of games played between team i and team j
for i =1:n
    team1 = stats(i,1); 
    team2  = stats(i,3);
    C(team1, team2) = C(team1, team2) - 1; 
    C(team2, team1) = C(team2, team1) - 1; 
end
C
%create the vector b
b = zeros(32, 1); 
%b   = 1 + .5*(wi     + li)
%    = 1 + .5*(ti)
for i=1:32
    b(i) = 1 + .5*(Cdata(i,1)-Cdata(i,2)); 
end

%solve the linear system Cx=b
x = guassElimination(C,b); 
[rank, t] = sort(x, 'descend'); 

colleyResults = cell(32,1); 
for i = 1:32
    colleyResults(i,1) = Teams(t(i)); 
end


%-------------------------------------------------------------------
% Part b) Power Method

% construct a matrix A where A(i,j) is the probability of team i beating
% team j, and explain how you decided on the individual probabilites. 
% Normalize A so that all of the columns add up to one. (consider a column 
% of all zeros. 
% use the power method to find the eigenvector of A associated with the 
% dominant eigenvalue. Provide an ordered ranking of the teams based on the 
% eigenvector. 
%-------------------------------------------------------------------

%create a matrix A that links each team to teams played
A = zeros(32,32);
for i=1:n 
    
    %the values in stats for each row
    team1 = stats(i,1);
    t1score = stats(i,2);
    team2  = stats(i,3);
    t2score = stats(i,4);
    
    %evaluate the information in Stats
    if (t1score > t2score) %if team 1 wins 
        winner = team1; % in team 1's row
        loser = team2; % in team 2's column
        %add 1 to indicate the win for team 1
        A(winner,loser)= A(winner,loser)+1;
    elseif (t1score < t2score) %if team 2 wins
        %disp('Team 2 won')
        winner = team2; % in team 2's row
        loser = team1; % in team 1's column 
        %add 1 to indicate the win for team 1
        A(winner,loser)= A(winner,loser)+1;
    elseif (t1score == t2score)
        disp('Tied game'); 
    end 
end 

% Make the matrix A column stochastic (all columns total to 1)
for j = 1:32 %for each column j
    %sum up the total of each row in column j
    count = 0; 
    for i = 1:32
        if A(i,j) >= 1
            count = count + A(i,j); 
        end
    end 
    
    if count == 0 % if the column sum is equal to 0 ie no losses
        %set each of those variables to 1/32
        A(:,j)= 1/32; 
    else
        % otherwise set each of the rows to A(i,j)/count
        A(:,j)=A(:,j)./count; 
    end
end 


% The power method I have below yeilds the same ranking results as the 
% eig() function that follows it. The v from eig is more accurate so 
% I am choosing to use that form to find my final rank. 

% max = 400; flag = 0; k = 1; 
% x0 =zeros(32,1);
% x0(1)=1; 
% while (flag == 0 && k <= max); 
%     x1 = A*x0; 
%     x0 = x1; 
%     k = k+1; 
% end
% if (k > max)
%     disp('Iterations Exceeded')
% end
% vp = x1  
% lam = (vp'*A*vp)/(vp'*vp); 
% [powerRankp, tnp] = sort(vp, 'descend')

[V, d] = eig(A);  
v =  abs(V(:,1)); 

[powerRank, tn] = sort(v, 'descend');  

powerResults = cell(32,1);            
for i = 1:32
    powerResults(i,1) = Teams(tn(i));  
end

colleyResults 
powerResults

