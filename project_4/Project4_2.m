%Project 4
%Problem 2 
%Coded by Victoria Hagan

format
fprintf('%30s\n', 'Gaussian Elimination Comparison')
% Hilbert 10 Matrix
H = zeros(10, 10); 
for i = 1:10
    for j = 1:10
        H(i,j)=1/(i+j-1); 
    end 
end 

%-------------------------------------------------------------------
% Part(a) Find the condition number of H10
%-------------------------------------------------------------------
k = norm(H)*norm(inv(H)); 
fprintf('%25s %10g\n', 'The condition number of H10 is', k)

%-------------------------------------------------------------------
% Part(b) Try to solve H10x=b where b = [1 1 1 1 1 1 1 1 1 1]' using
%         Naive Guassian Elmination
%-------------------------------------------------------------------

% vector b of 10 ones
b = ones(10, 1); 
b = b'; 

% naive Guassian Elimination
Hb = H; 
bb = b; 
[nb,cb]=size(Hb);
for i=1:(nb-1)
    p=Hb(i,i);
    for j=(i+1):nb
        m=Hb(j,i)/p;
        Hb(j,:)=Hb(j,:)-m*Hb(i,:);
        bb(j)=bb(j)-m*bb(i);
    end
end

xb=zeros(nb,1);
xb(nb)=bb(nb)/Hb(nb,nb);

for k=(nb-1):-1:1
    xb(k)=(bb(k)-Hb(k,(k+1):nb)*xb((k+1):nb))/Hb(k,k);
end
disp(' ')
fprintf('%30s\n', 'Naive Guassian Elimination with B = [1 1 1 1 1 1 1 1 1 1]')
xb
%-------------------------------------------------------------------
% Part(c) Try to solve H10x=b where b = [1 1 1 1 1 1 1 1 1 1]' using
%         Guassian Elmination with Scaled Partial Pivoting
%-------------------------------------------------------------------

% Scaled Partial Pivoting Guassian Elimination
C = H; 
bc = b; 
[nc,cc]=size(C);
sc = max(abs(C')); %scale vector
pc = (1:nc)'; %Pivot Vector

for i=1:(nc-1)
    r = abs(C(pc(i),i))/sc(pc(i));
    ip = i; 
    for k =(i+1):nc
        t = abs(C(pc(k),i)/sc(pc(k)));  
        if  t > r
        r = t; 
        ip = i; 
        end
    end
    
    l = pc(ip); 
    pc(ip)=pc(i); 
    pc(i) = l; 
    
    for k = (i+1):nc
     C(pc(k),i) = C(pc(k),i)/C(pc(i),i); 
        for j=(i+1):nc
        C(pc(k),j)=C(pc(k),j)-C(pc(k),i)*C(pc(i),j); 
        end
    end
end

%L*z = b (Forward Substitution)
zc = zeros(nc, 1); 
zc(1) = bc(pc(1)); 
for i = 2:nc
    zc(i)=bc(pc(i)); 
    for j = 1:(i-1); 
        zc(i)= zc(i)-C(pc(i),j)*zc(j); 
    end
end

%U*x = z (Back Substitution)
xc = zeros(nc, 1); 
xc(nc) = zc(nc)/C(pc(nc),nc); 
for i = (nc-1):-1:1
    xc(i)=zc(i); 
    for j =(i+1):nc; 
        xc(i)= xc(i)-C(pc(i),j)*xc(j);
    end
    xc(i)=xc(i)/C(pc(i),i); 
end

fprintf('%30s\n', 'Scaled Partial Pivoting with B = [1 1 1 1 1 1 1 1 1 1]')
xc

%-------------------------------------------------------------------
% Part(d) repeat part (c) with b = [1.01 1 1 1 1 1 1 1 1 1]' 
%         How different are the two solutions?
%         (Find the norm of the difference between the two vecotrs.)
%-------------------------------------------------------------------

% Scaled Partial Pivoting Guassian Elimination
D = H; 
bd = b; 
bd(1) = 1.01; 
[nd,cd]=size(D);
sd = max(abs(D')); %scale vector
pd = (1:nd)'; %Pivot Vector

for i=1:(nd-1)
    r = abs(D(pd(i),i))/sd(pd(i));
    ip = i; 
    for k =(i+1):nd
        t = abs(D(pd(k),i)/sd(pd(k)));  
        if  t > r
        r = t; 
        ip = i; 
        end
    end
    
    l = pd(ip); 
    pd(ip)=pd(i); 
    pd(i) = l; 
    
    for k = (i+1):nd
     D(pd(k),i) = D(pd(k),i)/D(pd(i),i); 
        for j=(i+1):nd
        D(pd(k),j)=D(pd(k),j)-D(pd(k),i)*D(pd(i),j); 
        end
    end
end

%L*z = b (Forward Substitution) 
zd = zeros(nd, 1); 
zd(1) = bd(pd(1)); 
for i = 2:nd
    zd(i)=bd(pd(i)); 
    for j = 1:(i-1); 
        zd(i)= zd(i)-D(pd(i),j)*zd(j); 
    end
end

%U*x = z (Back Substitution)
xd = zeros(nd, 1); 
xd(nd) = zd(nd)/D(pd(nd),nd); 
for i = (nd-1):-1:1
    xd(i)=zd(i); 
    for j =(i+1):nd; 
        xd(i)= xd(i)-D(pd(i),j)*xd(j);
    end
    xd(i)=xd(i)/D(pd(i),i); 
end

fprintf('%30s\n', 'Scaled Partial Pivoting with B = [1.01 1 1 1 1 1 1 1 1 1]')
xd 

disp(' ')
diff = norm(xd - xc); 
fprintf('%30s %10g\n', 'The difference between xc and xd is ', diff)
    