function [ Boundary_vec ] = Boundaryvector( Boundary_vec, u_3dv, M_vec, o, n)
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here
for j=1:o
Boundary_vec(j) = u_3dv(j) * M_vec(j);
    if j<=n*n
        Boundary_vec(j) = Boundary_vec(j) - u_3dv(j)+ 500;
    elseif j>n^3-n^2
         Boundary_vec(j) = Boundary_vec(j) - u_3dv(j)+ 20; 
    end
    
end 

end

