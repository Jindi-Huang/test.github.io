% * Copyright@yoursilver;Time@2019/10/09
% * ���������Ż������ߵ�ǰ���£���������ʱ�������������Ӱ�죺ͬʱ���ڹ��ʺͼ۸�������ԡ�ֻ�й��ʸ����Ҽ۸���������ֻ���ڼ۸�ճ���ҹ�����������
% * ֻ���ڼ۸�ճ���ҹ���������
var yt ${\tilde{y}}$ //����ȱ��
    yn ${y^n}$  //��Ȼ����
    y ${y}$  //�ܲ���
    w ${w}$  //ʵ�ʹ���
    wn ${w^n}$  //��Ȼ����
    wt ${\tilde{wt}}$  //����ȱ��
    n ${n}$  //��ҵ����
    a ${a}$  //����
    Pip ${\pi^p}$  //ͨ������
    Piw ${\pi^w}$  //���ʵ�ͨ������
    z ${z}$  //Ч��ˮƽ����������������������
    v ${v}$  //�������߲������������������߳��������
    xi1 ${\xi_1}$
    xi2 ${\xi_2}$
    xi3 ${\xi_3}$;

varexo 
    e_a ${\epsilon_a}$  //�����������
    e_z ${\epsilon_z}$  //����������
    e_v ${\epsilon_v}$;  //�����������߳��

parameters 
    alpha ${\alpha}$  //�ʱ��ݶ�
    beta ${\beta}$  //����������
    ew ${\epsilon^w}$  //�Ͷ����г��и����Ͷ���������ԣ������Ͷ���¢�Ͼ��������ڹ��ʸ��Ե����Ρ�
    ep ${\epsilon^p}$  //��Ʒ�г������Ʒ��������ԣ�����������¢�Ͼ��������ڼ۸���Ե����Ρ�
    kappaw ${\kappa^w}$ //NKPC���¿���˹ģ�ͷ�����˹���ߣ�����
    kappap ${\kappa^p}$ //NKPC����
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
//1�����ڲ���ȱ�ڵ�һ������
(sigma+(phi+alpha)/(1-alpha))*yt +kappap*xi1+kappaw*xi2=0;
//2�����ڼ۸�Ͳ���ͨ�͵�һ������
ep/lambdap*Pip-xi1+xi1(-1)+xi3 = 0;
ew*(1-alpha)/lambdaw*Piw-xi2+xi2(-1)-xi3 = 0;
//3��NKPC֮һ���۸�ķ�����˹����
Pip = beta*Pip(1)+kappap*yt+lambdap*wt;
//4��NKPC֮�������ʵķ�����˹����
Piw = beta*Piw(1)+kappaw*yt-lambdaw*wt;
//5���ɶ���ó��Ĺ���ȱ�ڶ�̬����
wt = wt(-1)+Piw-Pip-wn+wn(-1);
//6���Լ����ڹ���ȱ�ڵ�һ������
lambdap*xi1-lambdaw*xi2+xi3-beta*xi3(1)=0;
//7����ʵ����
wn = log(1-alpha)-alpha/(1-alpha)*psi_y+psi_wa*a-mup;
//8����Ȼ����
yn = psi_ya*a+psi_y;
//9��AR(1)���
v = rho_v*v(-1)+ e_v;
a = rho_a*a(-1)+ e_a;
z = rho_z*z(-1)+ e_z;
//10����ʵ����
w = wt+wn;
//11���ܲ���
y = yt+yn;
//12���ܾ�ҵ
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
var e_a;  //�������߳��
stderr 1;
end;

stoch_simul(order=1, irf=16) yt Pip Piw w;
