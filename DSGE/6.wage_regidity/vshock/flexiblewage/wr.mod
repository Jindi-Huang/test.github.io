% * Copyright@yoursilver;Time@2019/10/09
% * ������������ʱ�������������Ӱ�죺ͬʱ���ڹ��ʺͼ۸�������ԡ�ֻ�й��ʸ����Ҽ۸���������ֻ���ڼ۸�ճ���ҹ�����������
% * ����ֻ���ڼ۸�ճ���ҹ�����������ģ�͡�
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
    i ${i}$  //��������
    rn ${r^n}$  //��Ȼ����
    z ${z}$  //Ч��ˮƽ����������������������
    v ${v}$;  //�������߲������������������߳��������

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
thetaw = 1e-6;
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
//1�������������߿����Ż�ŷ����ʽ
yt = yt(1)-1/sigma*(i-Pip(1)-rn);
//2�����ʹ�������̩�չ���
i = rho+phi_pip*Pip+phi_piw*Piw+phi_y*yt+phi_y*psi_ya*a+v;
//3��NKPC֮һ���۸�ķ�����˹����
Pip = beta*Pip(1)+kappap*yt+lambdap*wt;
//4��NKPC֮�������ʵķ�����˹����
Piw = beta*Piw(1)+kappaw*yt-lambdaw*wt;
//5���ɶ���ó��Ĺ���ȱ�ڶ�̬����
wt = wt(-1)+Piw-Pip-wn+wn(-1);
//6����Ȼ����
rn = rho-(1-rho_a)*psi_ya*sigma*a+(1-rho_z)*z;
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
i = rho;
rn = rho;
end;
steady;

check;

write_latex_static_model;
write_latex_dynamic_model;

shocks;
var e_v;  //�������߳��
stderr 0.25;
end;

stoch_simul(order=1, irf=16) yt Pip Piw w;

