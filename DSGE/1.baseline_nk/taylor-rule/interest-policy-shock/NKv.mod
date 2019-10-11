var  yt Pi y yn n  w wn P I r rn m v a z;

varexo e_a e_v e_z;

parameters rho alpha beta sigma theta phi e phi_pi phi_y rho_v rho_a rho_z eta k psi_ya  psi_y;
rho= 1;
alpha = 0.25;
beta = 0.99;
sigma = 1;
theta = 3/4;
phi = 5;
e = 9;
phi_pi = 1.5;
phi_y = 0.5/4;
psi_ya = (1+phi)/((1-alpha)*sigma+alpha+phi);
psi_y = (1-alpha)*log(1-alpha)/(sigma*(1-alpha)+phi+alpha);
rho_v = 0.5;
rho_a = 0.9;
rho_z = 0.5;
eta= 4;
k = (sigma+(phi+alpha)/(1-alpha))*(1-theta)/theta*(1-beta*theta)*(1-alpha)/(1-alpha+alpha*e);



model;
//1.NKPC
Pi = beta*Pi(1)+k*yt;
//2.EULER
yt = yt(1)-1/sigma*(I-Pi(1)-rn);
//3.TAYLOR
I = rho+phi_pi*Pi+phi_y*y-phi_y*psi_y+v;
//4.Natural rate definition
rn = rho-psi_ya*sigma*(1-rho_a)*a+(1-rho_z)*z;
//5.Natural output definition
yn = psi_ya*a+psi_y;
//6.total output
y = yt+yn;
//7.total employmenr
n = (y-a)/(1-alpha);
//8.price level
P = P(-1)+Pi;
//9.nominal wage
w = P+phi*n+sigma*y;
//10.real wage
wn =w-P;
//11.real rate
r = I - Pi(1);
//12. AR(1)shocks
v = rho_v*v(-1)+ e_v;
a = rho_a*a(-1) +e_a;
z = rho_z*z(-1) -e_z;
//13.money demand
m = P + y-eta*I;
end;
initval;
Pi =0.0;
y = psi_y;
yt =0.0;
yn= psi_y;
n = (psi_y-a)/(1-alpha);
I = rho;
w = psi_y*sigma;
wn = psi_y*sigma;
P = 0.0;
r = rho;
rn = rho;
m = psi_y-eta*rho;
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
stderr 0;
var e_a;
stderr 0;
end;

stoch_simul(order=1, periods=0, irf=16)yt Pi y n wn P I r m v;


