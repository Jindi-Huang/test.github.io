use http://www.stata-press.com/data/r16/rates2.dta, clear
tsset
generate p = 400*(ln(gdpdef) - ln(L.gdpdef))
label variable p "Inflation rate" 		
// dsgenl (1 = {beta}*(x/F.x)*(1/g)*(r/F.p) ) ///
// (1/{phi} + (p-1) = {phi}*x + {beta}*(F.p-1)) ///
// ({beta}*r = p^(1/{beta})*u) ///
// (ln(F.u) = {rhou}*ln(u)) ///
// (ln(F.g) = {rhog}*ln(g)), ///
// exostate(u g) observed(p r) unobserved(x)
// nlcom 1/_b[beta]

dsge (p = {beta}*F.p + {kappa}*x) ///
(x = F.x - (r - F.p - g), unobserved) ///
(r = (1/{beta})*p + u) ///
(F.u = {rhou}*u, state) ///
(F.g = {rhog}*g, state)
irf set nkirf.irf
irf create model1
irf graph irf, impulse(u) response(x p r u) byopts(yrescale)
estimates store dsge_est
tsappend, add(12)
forecast create dsgemodel
forecast estimates dsge_est
forecast solve, prefix(d1_) begin(tq(2017q1))
tsline d1_p if tin(2010q1, 2021q1), tline(2017q1)
forecast solve, prefix(d2_) begin(tq(2014q1))
tsline p d2_p if tin(2010q1, 2021q1), tline(2014q1)