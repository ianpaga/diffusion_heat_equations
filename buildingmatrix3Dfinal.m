function [A_3D, M_vec] = buildingmatrix3Dfinal(n, p, o, D_water, D_egg, r)
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here
%-----------MATRIX B------------%

%--------Initialization---------%
%n = 4;                      %Number of total points in 3D grid: n*n*n.           
%p= n*n;                     %Number of total points in a plane
%o = n*n*n;

W = ones(p-1, n);   % Matrix needed for sub-diagonal at  -n   and +n.            
v = ones(1,o-p);      % Vector needed for sub-diagonal at -n*n and +n*n.
u = ones(1,o-1);        % Vector needed for sub-diagonal at  -1  and  +1.
M_new = 6*ones(1,o);
M = zeros(n,n,n);           % Matrices needed for main diagonal of B.
A = zeros(n);               %
E = zeros(n);               %
a = 5*ones(1,n);            %
e = 4*ones(1,n);            %

%B = zeros(n*n*n);           % Matrix we are looking for.



%%----------Bulding M (main diagonal of B)---------%%

A(2:end-1, 2:end-1) = 6;
E(2:end-1, 2:end-1) = 5;

for j=1:length(e)
   if j == 1 || j == n
      e(1,j) = 3;
      a(1,j) = 4;
   end
end

E(1,:)   = e;
E(:,1)   = e;
E(end,:) = e;
E(:,end) = e;

A(1,:)   = a;
A(:,1)   = a;
A(end,:) = a;
A(:,end) = a;


for i=1:n
   if i == 1 || i == n 
        M(:,:,i) = E;
   else
       M(:,:,i) = A;
   end
end

M_vec = reshape(M,[1,n*n*n]);
M_vec = 6 - M_vec;

%%----------Bulding vector u (sub-diagonal)---------%%

for i=1:length(u)               
    if mod(i,n) == 0
        u(1,i) = 0;
    end
end

%%----------Bulding vector w (sub-diagonal)---------%%

for i=1:length(W)
    if mod(i,n) == 0
       W(i,:) = 0; 
    end
end

w = reshape(W',[1,o-n]);

%%------------Adding all contributions------------%%

A_3D = - diag(M_new) + diag(u,-1) + diag(u,1) + diag(w,-n) + diag(w,n) + diag(v,-p) + diag(v,p);
   %-diag(M_vec)

for i=1:o
    for m=1:o
        j=mod(i,n);
        if j == 0
            j=n;
        end
       l=floor(mod(i,p)/n);
       if l==0 
          l=n;
       end
       k=floor(i/p)+1;
       dist = sqrt((j-(floor(n/2)))^2 + (l-(floor(n/2)))^2 + (k-(floor(n/2)+1))^2);
      if dist < r
         A_3D(m,i) = A_3D(m,i)*D_egg;
      else
         A_3D(m,i) = A_3D(m,i)*D_water;
      end
   end
end




end
