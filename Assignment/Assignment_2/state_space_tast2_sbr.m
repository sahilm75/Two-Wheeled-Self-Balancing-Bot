clear;clc;
%%
mc = 1.5;
mp = 0.5;
g = 9.82;
L = 1;
d1 = 0.01;
d2 = 0.01;


A = [0, 0, 1, 0;
    0, 0, 0 ,1;
    0, (g*mp)/mc, -d1/mc, -d2/(L*mc);
    0, (g*(mc+mp))/(L*mc), -d1/(L*mc), -(d2*(mc+mp))/((L^2)*mc*mp)];

B = [0; 0; 1/mc; 1/(L*mc)];

C = [0 1 0 0];
D = [0];

%x = [q1;q2;q1';q2']

sys = ss(A, B, C, D);

%% 
poles = pole(sys)
eigen = eig(sys)
zeros = zero(sys)
TF = ss2tf(A, B, C, D)

%%
A, B, C, D = ssdata(sys)
rlocus(sys)

%%
sys_tf = zpk(zeros, poles, 1)
sisotool(sys)

%%
comp_sys = feedback(sys, Comp)
stepplot(comp_sys)
[Ac, Bc, Cc, Dc] = ssdata(comp_sys)
