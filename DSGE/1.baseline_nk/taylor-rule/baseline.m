nkv = load("interest-policy-shock\NKv_results.mat");
nkz = load("demand-shock\NKz_results.mat");
nka = load("tech-shock\NKa_results.mat");
figure('Name','Baseline','Position',[800,10,800,1200])
subplot(5,2,1)
plot(0:1:15,nkv.oo_.irfs.Pi_e_v,'o-','MarkerSize',4)
hold on
plot(0:1:15,nkz.oo_.irfs.Pi_e_z,'d-','MarkerSize',4)
hold on
plot(0:1:15,nka.oo_.irfs.Pi_e_a,'s-','MarkerSize',4)
title('Output gap')


subplot(5,2,2)
plot(0:1:15,nkv.oo_.irfs.Pi_e_v*4,'o-','MarkerSize',4)
hold on
plot(0:1:15,nkz.oo_.irfs.Pi_e_z*4,'d-','MarkerSize',4)
hold on
plot(0:1:15,nka.oo_.irfs.Pi_e_a*4,'s-','MarkerSize',4)
title('Inflation')

subplot(5,2,3)
plot(0:1:15,nkv.oo_.irfs.y_e_v,'o-','MarkerSize',4)
hold on
plot(0:1:15,nkz.oo_.irfs.y_e_z,'d-','MarkerSize',4)
hold on
plot(0:1:15,nka.oo_.irfs.y_e_a,'s-','MarkerSize',4)
title('Output')


subplot(5,2,4)
plot(0:1:15,nkv.oo_.irfs.n_e_v,'o-','MarkerSize',4)
hold on
plot(0:1:15,nkz.oo_.irfs.n_e_z,'d-','MarkerSize',4)
hold on
plot(0:1:15,nka.oo_.irfs.n_e_a,'s-','MarkerSize',4)
title('Employment')

subplot(5,2,5)
plot(0:1:15,nkv.oo_.irfs.wn_e_v,'o-','MarkerSize',4)
hold on
plot(0:1:15,nkz.oo_.irfs.wn_e_z,'d-','MarkerSize',4)
hold on
plot(0:1:15,nka.oo_.irfs.wn_e_a,'s-','MarkerSize',4)
title('Real wage')
legend({'monetary policy','discount rate','technology'},'Location','southeast')

subplot(5,2,6)
plot(0:1:15,nkv.oo_.irfs.P_e_v,'o-','MarkerSize',4)
hold on
plot(0:1:15,nkz.oo_.irfs.P_e_z,'d-','MarkerSize',4)
hold on
plot(0:1:15,nka.oo_.irfs.P_e_a,'s-','MarkerSize',4)
title('Price level')

subplot(5,2,7)
plot(0:1:15,nkv.oo_.irfs.I_e_v,'o-','MarkerSize',4)
hold on
plot(0:1:15,nkz.oo_.irfs.I_e_z,'d-','MarkerSize',4)
hold on
plot(0:1:15,nka.oo_.irfs.I_e_a,'s-','MarkerSize',4)
title('Nominal rate')

subplot(5,2,8)
plot(0:1:15,nkv.oo_.irfs.r_e_v,'o-','MarkerSize',4)
hold on
plot(0:1:15,nkz.oo_.irfs.r_e_z,'d-','MarkerSize',4)
hold on
plot(0:1:15,nka.oo_.irfs.r_e_a,'s-','MarkerSize',4)
title('Real rate')

subplot(5,2,9)
plot(0:1:15,nkv.oo_.irfs.m_e_v,'o-','MarkerSize',4)
hold on
plot(0:1:15,nkz.oo_.irfs.m_e_z,'d-','MarkerSize',4)
hold on
plot(0:1:15,nka.oo_.irfs.m_e_a,'s-','MarkerSize',4)
title('money supply')

subplot(5,2,10)
plot(0:1:15,nkv.oo_.irfs.v_e_v,'o-','MarkerSize',4)
hold on
plot(0:1:15,-nkz.oo_.irfs.z_e_z,'d-','MarkerSize',4)
hold on
plot(0:1:15,nka.oo_.irfs.a_e_a,'s-','MarkerSize',4)
title('shocks')

saveas(gcf,'Baseline','png')