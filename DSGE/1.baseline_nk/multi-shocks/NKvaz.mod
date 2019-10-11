var  Yt Pi EPi Y Yn N  W P I R Rn M u v a z rho_u L;

varexo e_a e_v e_z;

parameters rho alpha beta sigma theta phi e phi_pi phi_y rho_v rho_a rho_z eta k phi_ya  ;
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
eta= 4;
k = (sigma+(phi+alpha)/(1-alpha))*(1-theta)/theta*(1-beta*theta)*(1-alpha)/(1-alpha+alpha*e);
phi_ya = (1+phi)/((1-alpha)*sigma+alpha+phi);


model;
rho_u = (-(phi_y+sigma*(1-rho_a))*phi_ya*rho_a*a +(1-rho_z)*rho_z*z-rho_v*v+0.0001*rho_v)/(-(phi_y+sigma*(1-rho_a))*phi_ya*a +(1-rho_z)*z-v+0.0001);
L = 1/((phi_y+sigma*(1-rho_u))*(1-beta*rho_u)+k*(phi_pi-rho_u));
Yt = (1-beta*theta)*L*u;
Pi = k*L*u;
EPi = (Pi-k*Y)/beta/rho_u;
Yn = phi_ya*a;
Y = Yt+Yn;
I = rho+phi_pi*Pi+phi_y*Y+v;
N = (Y-a)/(1-alpha);
P = P(-1)+Pi;
W = P+phi*N+sigma*Y;
Rn = rho-phi_ya*sigma*(1-rho_a)*a+(1-rho_z)*z;
u = -(phi_y+sigma*(1-rho_a))*phi_ya*a +(1-rho_z)*z-v;
R = I - EPi;
v = rho_v*v(-1) +e_v;
a = rho_a*a(-1) +e_a;
z = rho_z*z(-1) -e_z;
M = P +Y-eta*I;
end;
initval;
rho_u = rho_v;
L = 1/((phi_y+sigma*(1-rho_v))*(1-beta*rho_v)+k*(phi_pi-rho_v)); 
Pi =0.0;
EPi =0;
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

shocks;

var e_v;
stderr 0.25;
var e_z;
stderr 0.5;
var e_a;
stderr 1;
end;

stoch_simul(order=1, periods=0, irf=20, conditional_variance_decomposition =[1:20]);


