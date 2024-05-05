function [ Diff ] = Differential( n,p,o, D_vec, D_water)
%%% Diff Matrix %%%

a=zeros(1,o);
b=zeros(1,o-1);
C = ones(p-1, n); 
e = zeros(1,o-p); 

%n=11;
%p = n^2;
%o=n^3;

%D_vec = Diffusionvector (n,o,p,r, D_water, D_egg);

for i=1:o
    if i < n^3-n^2
     a(i)=3*D_vec(i)-(D_vec(i+1)+D_vec(i+n)+D_vec(i+n^2));  
    end
     if  i > n^3-n^2
         a(i) = a(i) - D_water;
     end
     if i > n^3 - n
         a(i) = a(i) - D_water;
     end
end

for i=1:length(C)
    if mod(i,n) == 0 || i> n^3-n
       C(i,:) = 0; 
    
      % C(i,:) = D_vec(i+n) - D_vec(i); %THIS IS A PROBLEM i Means different things
    end
end

 c = reshape(C',[1,o-n]);
 for i=1:length(c)
      c(i) = c(i) *(D_vec(i+n) - D_vec(i));
 end

for i=1:length(b)               
    if mod(i,n) == 0
        b(1,i) = 0;
    else
        b(1,i) = D_vec(i+1)-D_vec(i);
    end
end

for i=1:length(e)
    e(i) = D_vec(i+n^2) - D_vec(i);
end
Diff =  diag(a) + diag(b,1)  + diag(c,n)  + diag(e,p); %- diag(a)
Diff(n^3,n^3) = 0;
end

