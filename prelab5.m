%%% prelab4
%% 4.1.2 P controlller

m = 0.94;
r = 6.36e-3;
R = 2.6;
kt = 7.67e-3;
km = kt;
kg = 3.71;
J = 3.9e-7;
F = (m*r*r*R+R*kg*kg*J);
E = kt*km*kg*kg;
Gnum = r*kt*kg;
Gden = [F kt*km*kg*kg 0];
G = tf([Gnum], Gden);
K10 = 10; K20 = 20; K30 = 30; K40 = 40; K50 = 50;
T10 = tf([K10*r*kt*kg], [F kt*km*kg*kg K10*r*kt*kg]);
T20 = tf([K20*r*kt*kg], [F kt*km*kg*kg K20*r*kt*kg]);
T30 = tf([K30*r*kt*kg], [F kt*km*kg*kg K30*r*kt*kg]);
T40 = tf([K40*r*kt*kg], [F kt*km*kg*kg K40*r*kt*kg]);
T50 = tf([K50*r*kt*kg], [F kt*km*kg*kg K50*r*kt*kg]);
step(T10, T20, T30, T40, T50);

Kparr = linspace(0,100);
TfP = tf([r*kt*kg], [F kt*km*kg*kg r*kt*kg]);
figure
rlocus(TfP, Kparr)
Kmin = 38;
Tmin = tf([Kmin*r*kt*kg], [F kt*km*kg*kg Kmin*r*kt*kg])
figure
step(Tmin)

%% 4.1.3 P controlller
Kdarr = linspace(0, 100);
PD = tf([1 12], [1/250 1]);
TfPD = tf([Gnum*Kdarr Gnum*Kdarr*12], [F/250 (F+E/250) (E+Gnum*Kdarr) 12*Gnum*Kdarr]);
TfPDreal = tf([Gnum Gnum*12], [F/250 (F+E/250) (E+Gnum) 12*Gnum]);
rlocus(TfPD, Kdarr)

K10 = 10; K20 = 20; K30 = 30; K40 = 40; K50 = 50;
T10 = tf([Gnum*K10 Gnum*K10*12], [F/250 (F+E/250) (E+Gnum*K10) 12*Gnum*K10]);
T20 = tf([Gnum*K20 Gnum*K20*12], [F/250 (F+E/250) (E+Gnum*K20) 12*Gnum*K20]);
T30 = tf([Gnum*K30 Gnum*K30*12], [F/250 (F+E/250) (E+Gnum*K30) 12*Gnum*K30]);
T40 = tf([Gnum*K40 Gnum*K40*12], [F/250 (F+E/250) (E+Gnum*K40) 12*Gnum*K40]);
T50 = tf([Gnum*K50 Gnum*K50*12], [F/250 (F+E/250) (E+Gnum*K50) 12*Gnum*K50]);

step(T20);