function delta_2D = laplacian_2D(Z,dx)
%      Z(3:end,2:end-1)   = Zdown;
%      Z(1:end-2,2:end-1) = Zup;
%      Z(2:end-1,2:end-1) = Zcenter;
%      Z(2:end-1,1:end-2) = Zleft;
%      Z(2:end-1,3:end)   = Zright;
   
    delta_2D = (Z(1:end-2,2:end-1) + Z(3:end,2:end-1) + Z(2:end-1,3:end) + Z(2:end-1,1:end-2) ...
            - 4*Z(2:end-1,2:end-1))/(dx*dx);
    
end