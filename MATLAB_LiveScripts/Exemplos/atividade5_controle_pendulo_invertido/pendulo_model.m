function x=pendulo_model(x,u,dt,M,m,l)
%simula modelo não-linear do pendulo invertido (atividade 4 e 5)
g=9.81;
%%
x_d=x(2);
th=x(3);
th_d=x(4);

F=u;
x_dd =(-l*m*sin(th)*th_d^2 + F + g*m*cos(th)*sin(th))/(- m*cos(th)^2 + M + m);
th_dd=(-l*m*cos(th)*sin(th)*th_d^2 + F*cos(th) + g*m*sin(th) + M*g*sin(th))/(l*(- m*cos(th)^2 + M + m));
f=[x_d; x_dd; th_d; th_dd];
x=x+f*dt;
x(3)=wrapToPi(x(3));
end