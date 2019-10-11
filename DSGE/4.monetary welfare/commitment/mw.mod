var  x ${x}$ 
    Pi ${\pi}$ 
    u ${u}$
    p ${\hat{p}}$ ;

varexo e_u ${\epsilon_u}$;

parameters Theta ${mathbb{Q}}$ 
    rho_u ${\rho_u}$
    beta ${\beta}$
    sigma ${\sigma}$ 
    theta ${\theta}$
    phi ${\phi}$
    e ${\epsilon}$
    k ${k}$
     delta  ${\delta}$ 
    gamma ${\gamma}$
    Lambda ${\Lambda}$
    lambda ${\lambda}$;

rho_u = 0.8;
alpha = 0.25;
beta = 0.99;
sigma = 1;
theta = 3/4;
lambda = (1-theta)/theta*(1-beta*theta)*(1-alpha)/(1-alpha+alpha*e);
phi = 5;
e = 9;
k = (sigma+(phi+alpha)/(1-alpha))*lambda;
Theta = k/e;
gamma = Theta/(k^2+Theta*(1+beta));
delta = (1-sqrt(1-4*gamma^2*beta))/(2*gamma*beta);
Lambda = lambda/e^2;

model;
//1. dynamics of x
x = delta*x(-1)-delta*k/(Theta*(1-delta*beta*rho_u))*u;
//2. dynamics of p
p = -k/Theta*x+Lambda/Theta;
//3. dynamics of Pi
Pi = p-p(-1);
// AR(1) shocks
u = rho_u*u(-1)+ e_u;
end;

initval; 
Pi =0.0;
x = 0.0;
u = 0.0;
p = Lambda/Theta;
end;
steady;

check;

write_latex_static_model;
write_latex_dynamic_model;

shocks;
var e_u;
stderr 1;
end;

stoch_simul(order=1, irf=10);
