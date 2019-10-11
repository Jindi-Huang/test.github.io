% * Copyright@yoursilver;Time@2019/10/09
% * 考察在最优货币政策的前提下，三种情形时技术冲击带来的影响：同时存在工资和价格名义刚性、只有工资刚性且价格灵活调整、只存在价格粘性且工资灵活调整。
% * 只存在价格粘性且工资灵活调整
var yt ${\tilde{y}}$ //产出缺口
    yn ${y^n}$  //自然产出
    y ${y}$  //总产出
    w ${w}$  //实际工资
    wn ${w^n}$  //自然工资
    wt ${\tilde{wt}}$  //工资缺口
    n ${n}$  //就业人数
    a ${a}$  //技术
    Pip ${\pi^p}$  //通货膨胀
    Piw ${\pi^w}$  //工资的通货膨胀
    z ${z}$  //效用水平参数，是总需求冲击的载体
    v ${v}$  //货币政策参数，是外生货币政策冲击的载体
    xi1 ${\xi_1}$
    xi2 ${\xi_2}$
    xi3 ${\xi_3}$;

varexo 
    e_a ${\epsilon_a}$  //外生技术冲击
    e_z ${\epsilon_z}$  //外生需求冲击
    e_v ${\epsilon_v}$;  //外生货币政策冲击

parameters 
    alpha ${\alpha}$  //资本份额
    beta ${\beta}$  //主观贴现率
    ew ${\epsilon^w}$  //劳动力市场中各类劳动的替代弹性，用于劳动者垄断竞争，存在工资刚性的情形。
    ep ${\epsilon^p}$  //产品市场各类产品的替代弹性，用于生产者垄断竞争，存在价格刚性的情形。
    kappaw ${\kappa^w}$ //NKPC（新凯恩斯模型菲利普斯曲线）参数
    kappap ${\kappa^p}$ //NKPC参数
    lambdaw ${\lambda^w}$
    lambdap ${\lambda^p}$
    mup ${\mu^p}$
    phi ${\phi}$
    phi_pip ${\Phi_{\pi^p}}$
    phi_piw ${\Phi_{\pi^w}}$
    phi_y  ${\Phi_{y}}$
    psi_y ${\psi_{y}}$
    psi_ya ${\psi_{ya}}$
    psi_wa ${\psi_{wa}}$
    rho ${\rho}$
    rho_v ${\rho_v}$
    rho_a ${\rho_a}$
    rho_z ${\rho_z}$
    sigma ${\sigma}$ 
    thetap ${\theta^p}$
    thetaw ${\theta^w}$;


alpha = 0.25;
beta = 0.99;
ew = 4.5;
ep = 9;
phi = 5;
sigma = 1;
thetap = 3/4;
thetaw = 1e-8;
phi_pip = 1.5;
phi_piw = 0;
phi_y = 0.5/4;
rho= 1;
rho_v = 0.5;
rho_a = 0.9;
rho_z = 0.5;
lambdap = (1-thetap)/thetap*(1-beta*thetap)*(1-alpha)/(1-alpha+alpha*ep);
lambdaw = (1-thetaw)/thetaw*(1-beta*thetaw)/(1+ew*phi);
kappap = (alpha)/(1-alpha)*lambdap;
kappaw = (sigma+phi/(1-alpha))*lambdaw;
mup = log((ep)/(ep-1));
psi_y = (1-alpha)*(log((ep)/(ep-1))-log(1-alpha))/((1-alpha)*sigma+alpha+phi);
psi_ya = (1+phi)/((1-alpha)*sigma+alpha+phi);
psi_wa = (1-alpha*psi_ya)/(1-alpha);


model;
//1、关于产出缺口的一阶条件
(sigma+(phi+alpha)/(1-alpha))*yt +kappap*xi1+kappaw*xi2=0;
//2、关于价格和产出通胀的一阶条件
ep/lambdap*Pip-xi1+xi1(-1)+xi3 = 0;
ew*(1-alpha)/lambdaw*Piw-xi2+xi2(-1)-xi3 = 0;
//3、NKPC之一：价格的菲利普斯曲线
Pip = beta*Pip(1)+kappap*yt+lambdap*wt;
//4、NKPC之二：工资的菲利普斯曲线
Piw = beta*Piw(1)+kappaw*yt-lambdaw*wt;
//5、由定义得出的工资缺口动态方程
wt = wt(-1)+Piw-Pip-wn+wn(-1);
//6、以及关于工资缺口的一阶条件
lambdap*xi1-lambdaw*xi2+xi3-beta*xi3(1)=0;
//7、真实工资
wn = log(1-alpha)-alpha/(1-alpha)*psi_y+psi_wa*a-mup;
//8、自然产出
yn = psi_ya*a+psi_y;
//9、AR(1)冲击
v = rho_v*v(-1)+ e_v;
a = rho_a*a(-1)+ e_a;
z = rho_z*z(-1)+ e_z;
//10、真实工资
w = wt+wn;
//11、总产出
y = yt+yn;
//12、总就业
n = (y-a)/(1-alpha);
end;


initval; 
yt = 0;
yn = psi_y;
y =  psi_y;
w = log(1-alpha)-alpha/(1-alpha)*psi_y-mup;
wn = log(1-alpha)-alpha/(1-alpha)*psi_y-mup;
wt = 0;
n = 0;
a = 0;
v = 0;
Pip = 0;
Piw = 0;
end;
steady;

check;

write_latex_static_model;
write_latex_dynamic_model;

shocks;
var e_a;  //货币政策冲击
stderr 1;
end;

stoch_simul(order=1, irf=16) yt Pip Piw w;
