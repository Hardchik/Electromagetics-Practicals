%This script computes the voltage and current waveforms as functions of
%length along a transmission line terminated with a complex load

clear
syms w Z0 ZL ZG VG gamma z Zin %symbolic variables for frequency, 
%characteristic impedence, load impedence, source impedence, source
%voltage, propagation constant, distance

%Enter the frequency (in rad/s)
wn = input('Enter the angular frequency: ');
%Enter the propagation constant (in a+j*b format)
gamma = input('Enter the propagation constant: ');
%Enter the length (m)
L = input('Enter the length: ');
%Enter the characterisitc impedence
Z0n = input('Enter the characteristic impedence: ');
%Enter the load impedence (in a+j*b format)
disp('Enter the load impedence');
ZLn = input('(in a+j*b format): ');
%Enter the source impedence (in a+j*b format)
disp('Enter the source impedence');
ZGn = input('(in a+j*b format): ');
%Enter the source voltage (in a*exp(j*b) format)
disp('Enter the source voltage');
VGn = input('(in a*exp(j*b) format): ');

%the expression for the input impedence as tyhe function of
%length along the line
%This expression at this point is purely sybolic and
%contains no numerical data, it will be used in line 37
Zin = Z0*(ZL-Z0*tanh(gamma*z)/Z0-ZL*tanh(gamma*z));
%Output the key parameters
%Reflection coefficient at load
GammaL = (ZLn-Z0n)/(ZLn+Z0n);
disp('The reflection coefficient at the load is');
disp(sprintf('%0.2f+j%0.2f',real(GammaL), imag(GammaL)));
%SWR
SWR = (1+abs(GammaL))/(1-abs(GammaL));
disp(sprintf('The SWR at load is %0.2f',SWR));
%Input impedence seen at the source
ZinG=subs(Zin,{Z0,ZL,gamma,z},{Z0n,ZLn,gamma,L});
disp('The input impedence seen by the generator');
disp(sprintf(' is %0.2f+j%0.2f',real(ZinG), imag(ZinG)));
%Now determine the forward travelling voltage
%V0plus at the load (z=0) from the equation
%V(z) = (V0+)e^(-j B z) (1+GammaL exp(2 j B z))
%by setting z = -L
%First detemine the voltage at the source
V0G = VGn*ZinG/(ZGn+ZinG);
V0plus = V0G*exp(gamma*z).*(1 + GammaL*exp(-2*gamman*L));

%Generate vector of voltage over length
z=-L:L/1000:0; %vector of length
Vz=V0plus/Z0n*exp(gamman*z).*(1 + GammaL*exp(2*gamman*z));
%voltage vector
Iz = V0plus/Z0n*exp(gamman*z).*(1 - GammaL*exp(2*gamman*z));
%voltage vector
%(notice the .* for multiplying two vectors
%together element-by-element)

%Plot
figure
subplot(2,1,1) %Generate a subplot within one figure window
%the two plots will be one on top of each other
%(2,1,1) means there are two rows, one column and this plot goes into the
%top subplot
plot(z, abs(Vz)) %plot only voltage magnitude
axis([-L 0 0 abs(2*V0plus)])
title('Voltage on transmission line as a function of length');
xlabel('Distance from load (m)')
ylabel('Mangnitude of voltage (V)')
subplot(2,1,2)
plot(z, abs(Iz)) %plot only current magnitude
axis([-L 0 0 abs(2*V0plus/Z0n)])
title('Current on transmission line as a function of length');
xlabel('Distance from load (m)')
ylabel('Mangnitude of current (A)')