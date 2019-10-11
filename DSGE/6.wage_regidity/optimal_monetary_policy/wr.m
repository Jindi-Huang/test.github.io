baseline = load('baseline\wr_results.mat');
flexprice = load('flexibleprice\wr_results.mat');
flexwage = load('flexiblewage\wr_results.mat');

figure(1)
subplot(2,2,1)
plot(0:1:length(baseline.oo_.irfs.yt_e_a)-1,baseline.oo_.irfs.yt_e_a,'o-','MarkerSize',4)
ylim([-0.1 0.1])
hold on
plot(0:1:length(baseline.oo_.irfs.yt_e_a)-1,flexprice.oo_.irfs.yt_e_a,'s-','MarkerSize',4)
hold on
plot(0:1:length(baseline.oo_.irfs.yt_e_a)-1,flexwage.oo_.irfs.yt_e_a,'d-','MarkerSize',4)
title('Output gap')
legend({'baseline','flexible prices','flexible wages'},'Location','southeast')
subplot(2,2,2)
plot(0:1:length(baseline.oo_.irfs.yt_e_a)-1,baseline.oo_.irfs.Pip_e_a*4,'o-','MarkerSize',4)
hold on 
plot(0:1:length(baseline.oo_.irfs.yt_e_a)-1,flexprice.oo_.irfs.Pip_e_a*4,'s-','MarkerSize',4)
hold on 
plot(0:1:length(baseline.oo_.irfs.yt_e_a)-1,flexwage.oo_.irfs.Pip_e_a*4,'d-','MarkerSize',4)
title('Price Inflation')
subplot(2,2,3)
plot(0:1:length(baseline.oo_.irfs.yt_e_a)-1,baseline.oo_.irfs.Piw_e_a*4,'o-','MarkerSize',4)
hold on 
plot(0:1:length(baseline.oo_.irfs.yt_e_a)-1,flexprice.oo_.irfs.Piw_e_a*4,'s-','MarkerSize',4)
hold on 
plot(0:1:length(baseline.oo_.irfs.yt_e_a)-1,flexwage.oo_.irfs.Piw_e_a*4,'d-','MarkerSize',4)
title('Wage Inflation')
subplot(2,2,4)
plot(0:1:length(baseline.oo_.irfs.w_e_a)-1,baseline.oo_.irfs.w_e_a,'o-','MarkerSize',4)
hold on 
plot(0:1:length(baseline.oo_.irfs.w_e_a)-1,flexprice.oo_.irfs.w_e_a,'s-','MarkerSize',4)
hold on 
plot(0:1:length(baseline.oo_.irfs.w_e_a)-1,flexwage.oo_.irfs.w_e_a,'d-','MarkerSize',4)
title('Real wage')
saveas(gcf,'wage_price_rigid_a','png')