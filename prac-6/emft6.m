R_prime=2.16; 
L_prime=344e-9; 
G_prime=0.79e-3; 
C_prime=138e-12;

f_lower=100e6; 
f_upper=10e9; 
f_step=1000000; 
f_range=f_lower:f_step:f_upper; 
num= (f_upper-f_lower)/f_step;

gamma=zeros(num, 1); 
velocity = zeros(num, 1); 
wavelength=zeros(num, 1); 
char_imped=zeros(num, 1);

x=1;
B=0; 

for f=f_range
    w=2*pi*f; 
    gamma(x)=1i*w*sqrt((L_prime-1i*R_prime/w)*(C_prime-1i*G_prime/w)); 
    B=imag(gamma(x)); 
    velocity(x)=w/B; 
    wavelength(x)=2*pi/B; 
    char_imped(x)=sqrt((R_prime+1i*w*L_prime)/(G_prime+1i*w*C_prime));
    x=x+1;
end

figure ('units', 'normalized','outerposition', [0 0 1 1], 'Name', 'Low-LOSS TL')

subplot (3,2,1); plot (f_range, real (gamma)); 
title("attenuation cons vs frequency"); 
xlabel("frequency (Hz)"); 
ylabel("alpha (m-1)");

subplot (3,2,2); 
plot(f_range, imag (gamma)); 
title("phase const vs frequency"); 
xlabel("frequency (Hz)"); 
ylabel("beta (rad/m)");

subplot (3,2,3); 
plot(f_range, velocity); 
title("phase velocity vs frequency"); 
xlabel("frequency (Hz)"); 
ylabel("speed (m/s)");

subplot (3,2, 4); 
plot (f_range, wavelength); 
title("wavelength vs frequency"); 
xlabel("frequency (Hz)"); 
ylabel("length (m)");

subplot (3,2,5); 
plot (f_range, real (char_imped)); 
title("Rezo vs frequency"); 
xlabel("frequency (H2) "); 
ylabel ("Rezo (ohm)");

subplot (3,2,6); 
plot (f_range, imag(char_imped) );
title("Imzo vs frequency"); 
xlabel("frequency (Hz) "); 
ylabel("Imzo (ohm)");