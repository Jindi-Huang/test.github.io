var  Yt ${Y_t}$
 Pi ${\pi_t}$ 
Y Yn N  W P I R Rn M u v a z rho_u L dM;

varexo e_a e_v ${\varepsilon_z^{news}}$  e_z e_m;

parameters rho alpha beta sigma theta phi e phi_pi phi_y rho_v rho_a rho_z eta k phi_ya rho_m ;
rho= 1;
alpha = 0.25;
beta = 0.99;
sigma = 1;
theta = 3/4;
phi = 5;
e = 9;
phi_pi = 1.5;
phi_y = 0.5/4;
rho_v = 0.5;
rho_a = 0.9;
rho_z = 0.5;
rho_m = 0.5;
eta= 4;
k = (sigma+(phi+alpha)/(1-alpha))*(1-theta)/theta*(1-beta*theta)*(1-alpha)/(1-alpha+alpha*e);
phi_ya = (1+phi)/((1-alpha)*sigma+alpha+phi);


model;
rho_u = (-(phi_y+sigma*(1-rho_a))*phi_ya*rho_a*a +(1-rho_z)*rho_z*z-rho_v*v+0.0001*rho_v)/(-(phi_y+sigma*(1-rho_a))*phi_ya*a +(1-rho_z)*z-v+0.0001);
L = 1/((phi_y+sigma*(1-rho_u))*(1-beta*rho_u)+k*(phi_pi-rho_u));
//1. Euler equation
Yt =Yt(1)-1/sigma*(I-Pi(1)-Rn);
//2.real balance growth
//lt(-1) = lt+Pi-dM;
//3.NKPC
Pi = beta*Pi(1)+k*Yt;
//4.natural output
Yn = phi_ya*a;
//5.output
Y = Yt+Yn;
//6.money growth 
M = M(-1)+dM;
//7.labor demand
N = (Y-a)/(1-alpha);
//8.price change
P = P(-1)+Pi;
// 9.real wage
W = phi*N+sigma*Y;
// 10.natural interest rate
Rn = rho-phi_ya*sigma*(1-rho_a)*a+(1-rho_z)*z;
// 11.aggregate shock
u = -(phi_y+sigma*(1-rho_a))*phi_ya*a +(1-rho_z)*z-v;
// 12.real interest rate
R = I - P(1);
// AR(1) shocks
v = rho_v*v(-1)+ e_v;
a = rho_a*a(-1) +e_a;
z = rho_z*z(-1) -e_z;
dM = rho_m*dM(-1) +e_m;
I = (P + Y - M)/eta;
end;

initval;
dM = 0;
rho_u = rho_v;
L = 1/((phi_y+sigma*(1-rho_v))*(1-beta*rho_v)+k*(phi_pi-rho_v)); 
Pi =0.0;
Y =0.0;
Yt =0.0;
Yn=0.0;
N =0.0;
I = rho;
W =0.0;
P =0.0;
R =rho;
Rn =rho;
M =-eta*rho;
u = 0.0;
v = 0.0;
a = 0.0;
z = 0.0;

end;
steady;

check;

write_latex_static_model;
write_latex_dynamic_model;

shocks;
var e_m;
stderr 0;
var e_v;
stderr 0;
var e_z;
stderr 0;
var e_a;
stderr 1;
end;

stoch_simul(order=1, irf=40, conditional_variance_decomposition =[1:20]);

//forecast;
