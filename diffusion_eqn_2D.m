%parameters%
L  = 1;                         %X-Y grid (LxL)
N  = 60;                        %Number of space-steps in each X and Y direction
dx = L/N;                       %spaces-step size
D  = 0.4;                       %diffusive coeff
dt = 0.4*(dx*dx)/2;             %time-step size (so that method is stable) Q: D dependence? see iteration->no D at the end. 
                           
U0 = 0.867;                     %initial temperature
i  = 0;                         %index for loop over time
tStop = 1;                    %

%%initialize%%

U = zeros(N);

%loop%

while i < tStop
   
    U(1,:) = U0;                               %initial condition. Resets every time.
    
    
    delta_2D = laplacian_2D(U,dx);             %computes de laplacian of a spacial-mesh (matrix U) for given dx.
    Uc    = U(2:end-1,2:end-1);                %removes the edges of the grid.
    
    U(2:end-1,2:end-1) = Uc + dt*D*delta_2D;   %updates the matrix adding dt*D*delta everytime.
    
     U(:,1) = U(:,2);                         %Neumann BC at the edges of the XY-grid
     U(:,end) = U(:,end-1);                   %por qué importa el orden de la igualdad?
     U(1,:) = U(2,:);
     U(end,:) = U(end-1,:) ;
    
    i = i + dt;                              
    
    %incluir plotting en loop para graficar U contra X,Y en diferentes
    %tiempos, por ejemplo al inicio, a la mitad y al final. 
    %   #time-steps =tStop/dt.
    %Neumann BC cuidarán que el calor no se pierda. Recordar derivada con
    %dirección normal a la superficie debe anularse en las paredes.
    
end

figure(1)
set(gca,'Fontsize',15); 

mesh(linspace(0,L,N-2),linspace(0,L,N-2),Uc);
colormap(hot);
                                 
xlabel('distance[cm]','Fontsize',15);
ylabel('distance[cm]','Fontsize',15);
title('Solution of the diffusion equation in 2D', 'Fontsize',15);


