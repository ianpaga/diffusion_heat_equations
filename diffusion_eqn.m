N = 10.0;
L = 20.0;
T = 20;
dt = T/N; 
dx = L/N;
D = 20.0; 
T0 = 10;
alpha=1;
%alpha = (dt*D)/(dx*dx);

%%initialize%%

F = zeros(N,N);
U = zeros(N,1);
b = zeros(N,1);


%%matrix%%

for i=1:N
   for j=1:N 
       if i == j && (j == 1 || j == N) 
           F(i,j) = 0;
       elseif i == j && j ~= 1
           F(i,j) = -2*alpha;
           F(i,j+1) = 1*alpha;
           F(i,j-1) = 1*alpha;
       end
   end
end

B = eye(N,N) - F;

for i=1:N
   x =  (i-1)*dx;
   t =  (i-1)*dt;
   
   b = U;
   
   b(1) = T0;                    %IC (and BC)
   %b(N) = TN;
   
   
   U = linsolve(B,b);            %update the vector
   
end

figure(1)
set(gca,'Fontsize',15); 
plot(linspace(0, T, N), U, 'b');
legend('solution','Fontsize',15);
xlabel('time[s]','Fontsize',15);                                  
ylabel('distance[cm]','Fontsize',15);
title('Solution of the diffusion equation with IC and BC', 'Fontsize',15);
