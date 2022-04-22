NumberOfXPlottingPoints=40; %number of plotting points along the x axis
NumberOfYPlottingPoints=40; %number of plotting points along the y axis
Positive_infinite=160;%use a finite number to replace positive infinite
V=zeros(NumberOfYPlottingPoints,NumberOfXPlottingPoints);% the matrix used to store the voltages at plotting points
PlotXmin=0; %lowest x value on the plot plane
PlotXmax=1; %maximum x value on the plot plane
PlotYmin=0; %lowest y value on the plot plane
PlotYmax=1; %maximum y value on the plot plane
PlotStepX= (PlotXmax-PlotXmin)/(NumberOfXPlottingPoints-1);%plotting step in the x direction
PlotStepY=(PlotYmax-PlotYmin)/(NumberOfYPlottingPoints-1); %plotting step in the y direction
[xmesh,ymesh] = meshgrid(PlotXmin:PlotStepX:PlotXmax,PlotYmin:PlotStepY:PlotYmax);
for j=1:NumberOfYPlottingPoints %repeat for all plot points in the y direction
 for i=1:NumberOfXPlottingPoints %repeat for all plot points in the x direction
 xplot=PlotXmin+(i-1)*PlotStepX;%x coordinate of current plotting point
 yplot=PlotYmin+(j-1)*PlotStepY;%y coordinate of current plotting point
 for n=1:Positive_infinite
 V(j,i)=V(j,i)+(2-2*(-1)^n)*sinh(n*pi*yplot)*sin(n*pi*xplot)/(n*pi*sinh(n*pi));%get the voltage contribution
 end
 end
end
surf(xmesh,ymesh,V);%obtain the surface figure
xlabel('x(m)');% label x
ylabel('y(m)');% label y
zlabel('V(V)');% label z
figure;
[C,h] = contour(xmesh,ymesh,V);%obtain the contour figure
set(h,'ShowText','on','TextStep',get(h,'LevelStep'));%label the contour
xlabel('x(m)');% label x
ylabel('y(m)');% label y
figure;
contour(xmesh,ymesh,V); [px,py] = gradient(V);
hold on,quiver(xmesh,ymesh,-px,-py,3),hold off,%obtain the electric field map by using E=-Gradient(V)
xlabel('x(m)');% label x
ylabel('y(m)');% label 