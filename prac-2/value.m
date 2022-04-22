function [Fx,Fy,Fz] = value(a,b,c)
% given
K = [0 5 0];
xmin = -0.15;
xmax = 0.15;
p_vect = [a b c];

% defining symbolic variables x,y ;finding r vect; mod of r ;cross of K and r
syms x y
r = p_vect - [x y 0];
r_mod = (r(1,1)^2+r(1,2)^2+r(1,3)^2)^(1/2);
result_vect = (cross(K,r));

% fuctions and now changing symbols to variables

fx = result_vect(1,1)/(4.*pi.*r_mod^3);
fy = result_vect(1,2)/(4.*pi.*r_mod^3);
fz = result_vect(1,3)/(4.*pi.*r_mod^3);
        
fxx = matlabFunction(fx);
fyy = matlabFunction(fy);
fzz = matlabFunction(fz);


% normal integration

if fx~=0
    Fx = integral2(fxx, xmin, xmax, -Inf, Inf);
else
    Fx=0;
end

if fy~=0
    Fy = integral2(fyy, xmin, xmax, -Inf, Inf);
else
    Fy=0;
end

if fz~=0
    Fz = integral2(fzz, xmin, xmax, -Inf, Inf);
else
    Fz=0;
end

%F_answer = [Fx Fy Fz]
end