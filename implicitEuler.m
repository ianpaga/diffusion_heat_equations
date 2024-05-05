function [ u_3dv, array_time,i ] = implicitEuler(A_3D, u_3dv, o, h, Diffusionmatrix, n, Boundary_vec, Diff,array_time,t,T_egg)
%Implicit Euler Algorithm

for i=1:t

    B_imp = eye(o,o) - h*Diffusionmatrix*A_3D - h*Diff*Diffusionmatrix*Diff;      
    V=(u_3dv + h*Boundary_vec.');                                       % you were right we might need to think about a...but let us just keep it 1cm for now
    u_3dv= B_imp\V;                                                      %better resolution would be hard anyway

    array_time(i) = u_3dv(floor((n*n*n)/2) + 1);        %saves T at every point in time

    if u_3dv(floor((n*n*n)/2) + 1) >= T_egg 
         break                                           %pause      %stops when desired T is reached
    end
    
end


end

