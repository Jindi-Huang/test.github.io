baseline = load('baseline\wr_results.mat');
flexprice = load('flexibleprice\wr_results.mat');
flexwage = load('flexiblewage\wr_results.mat');

figure(1)
subplot(2,2,1)
plot(0:1:length(baseline.oo_.irfs.yt_e_v)-1,baseline.oo_.irfs.yt_e_v,'o-','MarkerSize',4)
hold on
plot(0:1:length(baseline.oo_.irfs.yt_e_v)-1,flexprice.oo_.irfs.yt_e_v,'s-','MarkerSize',4)
hold on
plot(0:1:length(baseline.oo_.irfs.yt_e_v)-1,flexwage.oo_.irfs.yt_e_v,'d-','MarkerSize',4)
title('Output gap')
legend({'baseline','flexible prices','flexible wages'},'Location','southeast')
subplot(2,2,2)
plot(0:1:length(baseline.oo_.irfs.yt_e_v)-1,baseline.oo_.irfs.Pip_e_v*4,'o-','MarkerSize',4)
hold on 
plot(0:1:length(baseline.oo_.irfs.yt_e_v)-1,flexprice.oo_.irfs.Pip_e_v*4,'s-','MarkerSize',4)
hold on 
plot(0:1:length(baseline.oo_.irfs.yt_e_v)-1,flexwage.oo_.irfs.Pip_e_v*4,'d-','MarkerSize',4)
title('Price Inflation')
ylim([-0.5 0.2])
yticks(-0.5:0.1:0.2)
subplot(2,2,3)
plot(0:1:length(baseline.oo_.irfs.yt_e_v)-1,baseline.oo_.irfs.Piw_e_v*4,'o-','MarkerSize',4)
hold on 
plot(0:1:length(baseline.oo_.irfs.yt_e_v)-1,flexprice.oo_.irfs.Piw_e_v*4,'s-','MarkerSize',4)
hold on 
plot(0:1:length(baseline.oo_.irfs.yt_e_v)-1,flexwage.oo_.irfs.Piw_e_v*4,'d-','MarkerSize',4)
title('Wage Inflation')
ylim([-10 4])
yticks([-10:2:4])
subplot(2,2,4)
plot(0:1:length(baseline.oo_.irfs.w_e_v)-1,baseline.oo_.irfs.w_e_v,'o-','MarkerSize',4)
hold on 
plot(0:1:length(baseline.oo_.irfs.w_e_v)-1,flexprice.oo_.irfs.w_e_v,'s-','MarkerSize',4)
hold on 
plot(0:1:length(baseline.oo_.irfs.w_e_v)-1,flexwage.oo_.irfs.w_e_v,'d-','MarkerSize',4)
title('Real wage')
savefig('wage_price_rigid_v')