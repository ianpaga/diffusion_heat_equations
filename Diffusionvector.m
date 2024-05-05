function [D_vec] = Diffusionvector(n,o,p,r, D_water, D_egg)
%UNTITLED5 Summary of this function goes here
%   Detailed explanation goes here

D_vec = D_water*ones(o, 1);
for i=1:o
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
 if dist <= r
     D_vec(i) = D_egg;
 end
 
end



end

