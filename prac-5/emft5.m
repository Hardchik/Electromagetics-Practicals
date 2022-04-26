clear all
close all;
clc;
pi=3.14;
c=3*10^8;
w=10^8;
mu=4*pi*10^(-7);
epsilon=8.85*10^(-12);
sigma=0;
alpha=0;
beta=w/c;
eta=sqrt((mu)/epsilon);
t=0:0.01:1;
x=0:0.01:1;
m=zeros(size(t));
Ez=(30)*(cos(w*t-beta*x)).*(exp(-alpha*x));
Hy=(30/eta)*cos(w*t-beta*x).*exp(-alpha*x);
figure(1);
plot3(x,m,Ez,'r');
hold on;
plot3(x,Hy,m,'blue');
grid on;
hold off;
zlabel('Electric Field');
ylabel('Magnatic Field');
xlabel('Direction of wave');
title('EM WAVE IN FREE SPACE');
view(10,10);