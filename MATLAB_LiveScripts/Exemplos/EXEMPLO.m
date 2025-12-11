 close all
clear all
clc
%%
syms m M l u g alpha1 alpha2
syms th th_d th_dd
syms x x_d x_dd 

eq1=(M+m)*x_dd-m*l*th_dd*cos(th)+m*l*th_d^2*sin(th)+alpha1*x_d-u;
eq2=l^2*m*th_dd-x_dd*m*l*cos(th)-g*m*l*sin(th)+alpha2*th_d;
S=solve(eq1==0, eq2==0, x_dd, th_dd)
%%
x_vet=[x;x_d;th;th_d];
x_vet_dot=[x_d; S.x_dd; th_d; S.th_dd];

A=simplify(jacobian(x_vet_dot,x_vet))
B=simplify(jacobian(x_vet_dot,u))

%% ponto de operacao
x0=[0 0 0 0]';
x=x0(1);
x_d=0;
th=0;
th_d=0;
u=0;
%%
A0=simplify(subs(A)) %matriz dinamica
B0=simplify(subs(B)) %matriz de entrada
%%
M=1.5;
m=0.5;
l=1;
g=9.81;
alpha1=0.01;
alpha2=0.01;
A0=double(simplify(subs(A))) %matriz dinamica
B0=double(simplify(subs(B))) %matriz de entrada
%%
Ts=0.1; %tempo de amostragem
[Ad,Bd]=c2d(A0,B0,Ts)

% controlador
% definiçao das matrizes Q e R
Q = [8 0 0 0;...
    0 4 0 0;...
    0 0 1.5 0;...
    0 0 0 1.5];
R = 1;

[K, Pinf, CLP] = dlqr(Ad, Bd, Q, R)%%
T=5; %tempo de simulacao
dt=0.0001;
t=0:dt:T;
Nc=numel(t);
td=0:Ts:T;
Nd=numel(td);
%%
x=zeros(4,Nc);
u=zeros(Nd,1);
%%
Nr=Ts/dt;
kd=1;
H=[1 0 0 0;...
   0 0 1 0];
%% condicao inicial
x(:,1)=[2 0 deg2rad(30) 0]';
%%
fig = figure;
fig.Position = [0 0 1200 500];
selfBalancedRobot=plotSelfBalancedRobot(x(:,1),fig);
for k=1:Nc-1
    %% simula modelo nao-linear self-balanced-robot em tempo continuo
    x(:,k+1)=selfBalancedRobot_model(x(:,k),u(kd),dt,M,m,l,alpha1,alpha2);
    if (mod(k,Nr)==0 || k==1) && kd<=numel(td)
        %% simula controlador em tempo discreto
        if k~=1
            kd=kd+1;
        end
        % if kd<5/Ts
        %     x0=[2 0 0 0]';
        % elseif kd>10/Ts
        %     x0=[-2 0 0 0]';
        % end
        %% LQR  
        u(kd)=-K*(x(:,k)-x0);
        %% atualiza frame da animacao 
        updateSelfBalancedRobot(x(:,k),selfBalancedRobot);
        pause(0.05)
        if abs(x(3,k+1))>=pi/2
           break
        end
    end
end
%%
figure
plot(t,rad2deg(x(3,:)))
hold on
stairs(td,u)
legend('theta','u')
xlabel('time (s)')
% figure
% plot(t,x')
% legend('x1','x2','x3','x4')
% xlabel('time (s)')
%%