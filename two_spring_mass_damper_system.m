%% Constants
clear;clc;
m1 = 10;
m2 = 100;
c1 = 100;
c2 = 1000;
k1 = 1e4;
k2 = 1e5;
Tend = 10;

%% main code
syms t x;
tspan = [0 Tend];

%x1' = x3
%x2' = x4

%Step Function
eqs = @(t, x) [x(3); x(4); (5*heaviside(0) - c1*x(3) - k1*x(1) + c1*x(4) + k1*x(2))/m1; (-(c1+c2)*x(4) - (k1+k2)*x(2) + c1*x(3) + k1*x(1))/m2];

[t, ya] = ode45(eqs, tspan, [0 0 0 0]);

figure(1)
plot(t, ya(:, 1))
title('X1 with step function')
figure(2)
plot(t, ya(:, 2))
title('X2 with step function')

%Sinosoidal Function
eqs = @(t, x) [x(3); x(4); (3*sin(10*t) - c1*x(3) - k1*x(1) + c1*x(4) + k1*x(2))/m1; (-(c1+c2)*x(4) - (k1+k2)*x(2) + c1*x(3) + k1*x(1))/m2];

[t, ya] = ode45(eqs, tspan, [0 0 0 0]);

figure(3)
plot(t, ya(:, 1))
title('X1 with sinosoidal function')
figure(4)
plot(t, ya(:, 2))
title('X2 with sinosoidal function')

