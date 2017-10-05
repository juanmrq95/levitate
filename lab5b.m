%%% prelab 5b
s = tf('s');
Ki = 0.21; Kx = 31.3; a = 976; m = 28.2/1000;
Ka = 2; %%% Current amplifier gain = 2 A/V
%% Plant 
Gp = a*Ki/(m*(s^2 - Kx/m))
figure
bode(Gp)
figure
rlocus(Gp)

%% Controller
Kc = (2*Kx)/(a*Ka*Ki)
z_c = 10; p_c = 20*z_c;
Gc = Kc*(1+(s/z_c))/(1+(s/p_c));
%%%% Gc = -[10^4/R1]*[((R1+R2)*C*s+1)/(RC*s+1)]
rlocus(Gc)

%% Open loop system
T_OL = Gc*Gp
T_CL = feedback(T_OL,1)
figure
bode(T_OL)
figure
rlocus(T_OL)
figure
step(T_OL)