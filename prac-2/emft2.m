clc
clear all
close all

v = -0.5:0.1:0.5;
[x,z] = meshgrid(v);

row=1;
column=1;

plotx = zeros(11,11);
plotz = zeros(11,11);

for i = -0.5:0.1:0.5
    column=1;
    for j = -0.5:0.1:0.5
        
        if ((j==0) & (i<=0.15) & (i>-0.15)) % if my point is on sheet
            f1=0;
            f2=0;
            f3=0;
        else                            % other than the point on sheet
            [f1,f2,f3] = value(i,0,j);
        end
        
        plotx(column,row)=f1;
        plotz(column,row)=f3;
        column=column+1;
    end
    row=row+1;
end

quiver(x,z,plotx,plotz)
xlabel('x------->')
zlabel('z------->')

% Feild at point (0,0,0.25)
[f1,f2,f3]=value(0,0,0.25);
At_P = [f1 f2 f3]