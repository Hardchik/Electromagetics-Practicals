clear; 
clc 
k=2*pi;% spatial propagation constant 
w=10;% angular frequency 
Exm=20*sqrt(2); % electric field amplitude 
Hym=15*sqrt(2); % magnetic field amplitude 
x=0:0.01:3; % space representative point 
Zo1=zeros(size(x)); 
for i=1:1000 
    t=i*0.01; 
     Ey=Exm*cos(w*t*k*x);% oil 
     Hz=Hym*cos(w*t*k*x);% oil 
    %Ey=Exm*cos(w*t*k*x).*exp(-0.5*x);% underwater 
    %Hz=Hym*cos(w*t*k*x-pi/4).*exp(-0.5*x);% underwater 
figure(1) 
plot3(x,Ey,Zo1,'b'); 
hold on; 
plot3(x,Zo1,Hz,'b'); 
grid on; 
axis([0,2,-20,20,-20,20]) 
xlabel('x axis'); 
ylabel('electric field'); 
zlabel('magnetic field'); 
set(gcf,'color','w') 
pause(0.01) 
hold off; 
end