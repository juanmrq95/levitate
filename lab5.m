%%lab5a: ball mass = 28.1 g, equilibrium position = -2 mm from center
%% part3b: a
dx = (1e-3)*[0 0.5 1 1.5 2]; %% offset from equilibrium point (m.)
volt = [2.58 3.02 3.63 3.9 4.58]; %% voltage

plot(dx, volt, 'o'),grid, xlabel('meter'), ylabel('Volts')
line_a = polyfit(dx,volt,1)
slope = line_a(1)
a = slope;
a = abs(a)

%%%%%%%%% Plots
figure
plot(dx, volt, 'o'),grid, xlabel('Meter'), ylabel('Volts')
x_test = linspace(0.000, 0.002);
y_test = x_test * line_a(1) + line_a(2);
hold on
plot(x_test, y_test, 'LineWidth', 1.5)
title('Light Sensor Voltage vs Ball height')

%% part4b: ki
W = (9.8/1000)*[0.14 0.8 3.3 6]; %% Weight (N)
I_o = (20/3)*[0.22 0.21 0.19 0.18]; %% voltage required to weight = 0.05 g
% I_o = [1.466666667 1.393333333 1.293333333 1.186666667]

plot(I_o,W)
title('Voltage required to pick up ball vs ball position')
xlabel('Deviation from equilibrium point (m)');
ylabel('Voltage (V)');

plot(I_o, W, 'o'), grid, xlabel('current'), ylabel('newton')
line_ki = polyfit(I_o,W,1)
slope = line_ki(1)
ki = slope
Ki = abs(ki)

%%%%%%%%% Plot 
plot(I_o, W, 'o'), grid, xlabel('current'), ylabel('newton')
x_test = linspace(1.1, 1.5);
y_test = x_test * line_ki(1) + line_ki(2);
hold on
plot(x_test, y_test)
title('Ball Weight vs Varying current')
xlabel('Current(A)')
ylabel('Newton(N)')

%% part 5b: kx
x = (1e-3)*[0 1 2 3 4 5]; %%%  m
W = (9.8/1000)*[1 3.8 8.1 10.9 13.9 16.9]; %%% N.

plot(x, W, 'o'), grid, xlabel('Deviation'), ylabel('newton')
line_kx = polyfit(x,W,1)
slope = line_kx(1)
kx = slope
Kx = abs(kx)

%%%%%%%%% Plot 
plot(x, W, 'o'), grid, xlabel('current'), ylabel('newton')
x_test = linspace(0, 0.005);
y_test = x_test * line_kx(1) + line_kx(2);
hold on
plot(x_test, y_test)
title('Ball Weight vs Varying current')
xlabel('Current(A)')
ylabel('Newton(N)')