close all
clear all
clc
%%
syms m M l F g
syms th th_d th_dd
syms x x_d x_dd 

eq1=(M+m)*x_dd-m*l*th_dd*cos(th)+m*l*th_d^2*sin(th)-F;
eq2=l*th_dd-x_dd*cos(th)-g*sin(th);
u=F;
S=solve(eq1==0, eq2==0, x_dd, th_dd)
%%
x_vet=[x;x_d;th;th_d];
x_vet_dot=[x_d; S.x_dd; th_d; S.th_dd];

A=simplify(jacobian(x_vet_dot,x_vet))
B=simplify(jacobian(x_vet_dot,u))

%% ponto de operacao
x=0;
x_d=0;
th=0;
th_d=0;
u=0;
A0=simplify(subs(A))
B0=simplify(subs(B))
%%
M=1;
m=0.1;
l=0.4;
g=9.81;
A0=double(simplify(subs(A)))
B0=double(simplify(subs(B)))