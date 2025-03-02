function [ I_gz ] = I_gz( l,h,a,s )
I_gz=( (l*h^3) - ( (l-a)*(h-2*s)^3 ) )/12;
end

