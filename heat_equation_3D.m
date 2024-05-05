%-------BOILING EGGS-------------%
% This program computes the temperature at every point of a 3D grid (size n^3) using
% the Euler Method as primary tool for solving the heat equation in three
% dimensions. 
tic
%define variables
clear all
h = 10;             %time step    
a = 0.5;            %space step
t = 2000;            
    
%------ 3D ----------
n = 21;                   %number of elements in 3D grid
p = n*n;
o = n*p;
u_3dv = 20*ones(o, 1);
%u_3dv(1:p,1) =100;

%----Egg parameters----
cp_yolk = 2.7;
cp_white = 3.7;
rho_yolk = 1.032; 
rho_white = 1.038;
k_yolk = 3.4 * 10^-3;
k_white = 5.4 * 10^-3;

D_yolk = k_yolk/(cp_yolk * rho_yolk);
D_white = k_white/(cp_white * rho_white);
D_egg =  1/2*(D_white + D_yolk);



T_egg = 63;                 %Desired temperature
r=5;                        %Egg radius
D_water= 0.143*10^-2;
[A_3D, M_vec] = buildingmatrix3Dfinal(n, p, o, D_water, D_egg, r); 
                                                      %Matrix of Laplacian in heat eqn
                                                                
                                                                  
D_vec = Diffusionvector (n,o,p,r, D_water, D_egg);   %Computes diffusion values for all points 


DiffDDiff = Differential(n,p,o, D_vec, D_water);      %Matrix representation of gradients in heat equation
B_imp = eye(o,o) - (h/a^2 * (A_3D + DiffDDiff));      %Define B  
B_imp=inv(B_imp);                                     %Invert B to implement implicit Euler.
array_time = zeros(t,1);                              %keeps track of the time
Boundary_vec=zeros(1,o);                              %Boundary vector

for i=1:t

Boundary_vec = Boundaryvector(Boundary_vec, u_3dv, M_vec, o, n);
 
u_3dv= B_imp*(u_3dv + h/a^2 *D_water*Boundary_vec.'); 
                                                      %u_3dv(i) = B_imp(i,:) 
                                                      %* ( u_3dv +h*Diffusionmatrix(i,:)*Boundary_vec.')                                                     
u_3dv(u_3dv > 100) = 100;                             
u_3dv(u_3dv < 20 ) = 20;
array_time(i) = u_3dv(floor(n^3/2) + 1);              %saves T at every point in time
if u_3dv(floor(n^3/2) + 1) >= T_egg  
   break                                              %stops when desired T is reached
end
 
end
%reshaping Tempmatrix for plotting

Tempmatrix=reshape(u_3dv,[n,n,n]);

figure(1)
h = pcolor(Tempmatrix(:,:,ceil(n/2)));
set(h, 'EdgeColor', 'none');
xlabel('distance[cm]','Fontsize',15);               
ylabel('distance[cm]','Fontsize',15);
axis equal
colorbar
title('Temperature[Celsius]')

figure(2)
plottime = 1:i;
plottime = plottime*10/60;
plot(plottime, array_time(1:i));
hold on;
xlabel('time[minutes]','Fontsize',15);
ylabel('temperature[Celsius]','Fontsize',15);
hold on;
lgd=legend('Temperature at the center of the egg','Fontsize',15);
hold off;
toc                                                   