%
% Status : main Dynare file
%
% Warning : this file is generated automatically by Dynare
%           from model file (.mod)

if isoctave || matlab_ver_less_than('8.6')
    clear all
else
    clearvars -global
    clear_persistent_variables(fileparts(which('dynare')), false)
end
tic0 = tic;
% Save empty dates and dseries objects in memory.
dates('initialize');
dseries('initialize');
% Define global variables.
global M_ options_ oo_ estim_params_ bayestopt_ dataset_ dataset_info estimation_info ys0_ ex0_
options_ = [];
M_.fname = 'wr';
M_.dynare_version = '4.5.7';
oo_.dynare_version = '4.5.7';
options_.dynare_version = '4.5.7';
%
% Some global variables initialization
%
global_initialization;
diary off;
diary('wr.log');
M_.exo_names = 'e_a';
M_.exo_names_tex = '{\epsilon_a}';
M_.exo_names_long = 'e_a';
M_.exo_names = char(M_.exo_names, 'e_z');
M_.exo_names_tex = char(M_.exo_names_tex, '{\epsilon_z}');
M_.exo_names_long = char(M_.exo_names_long, 'e_z');
M_.exo_names = char(M_.exo_names, 'e_v');
M_.exo_names_tex = char(M_.exo_names_tex, '{\epsilon_v}');
M_.exo_names_long = char(M_.exo_names_long, 'e_v');
M_.endo_names = 'yt';
M_.endo_names_tex = '{\tilde{y}}';
M_.endo_names_long = 'yt';
M_.endo_names = char(M_.endo_names, 'yn');
M_.endo_names_tex = char(M_.endo_names_tex, '{y^n}');
M_.endo_names_long = char(M_.endo_names_long, 'yn');
M_.endo_names = char(M_.endo_names, 'y');
M_.endo_names_tex = char(M_.endo_names_tex, '{y}');
M_.endo_names_long = char(M_.endo_names_long, 'y');
M_.endo_names = char(M_.endo_names, 'w');
M_.endo_names_tex = char(M_.endo_names_tex, '{w}');
M_.endo_names_long = char(M_.endo_names_long, 'w');
M_.endo_names = char(M_.endo_names, 'wn');
M_.endo_names_tex = char(M_.endo_names_tex, '{\omega^n}');
M_.endo_names_long = char(M_.endo_names_long, 'wn');
M_.endo_names = char(M_.endo_names, 'wt');
M_.endo_names_tex = char(M_.endo_names_tex, '{\tilde{\omega}_t}');
M_.endo_names_long = char(M_.endo_names_long, 'wt');
M_.endo_names = char(M_.endo_names, 'n');
M_.endo_names_tex = char(M_.endo_names_tex, '{n}');
M_.endo_names_long = char(M_.endo_names_long, 'n');
M_.endo_names = char(M_.endo_names, 'a');
M_.endo_names_tex = char(M_.endo_names_tex, '{a}');
M_.endo_names_long = char(M_.endo_names_long, 'a');
M_.endo_names = char(M_.endo_names, 'Pip');
M_.endo_names_tex = char(M_.endo_names_tex, '{\pi^p}');
M_.endo_names_long = char(M_.endo_names_long, 'Pip');
M_.endo_names = char(M_.endo_names, 'Piw');
M_.endo_names_tex = char(M_.endo_names_tex, '{\pi^w}');
M_.endo_names_long = char(M_.endo_names_long, 'Piw');
M_.endo_names = char(M_.endo_names, 'i');
M_.endo_names_tex = char(M_.endo_names_tex, '{i}');
M_.endo_names_long = char(M_.endo_names_long, 'i');
M_.endo_names = char(M_.endo_names, 'rn');
M_.endo_names_tex = char(M_.endo_names_tex, '{r^n}');
M_.endo_names_long = char(M_.endo_names_long, 'rn');
M_.endo_names = char(M_.endo_names, 'u');
M_.endo_names_tex = char(M_.endo_names_tex, '{u}');
M_.endo_names_long = char(M_.endo_names_long, 'u');
M_.endo_names = char(M_.endo_names, 'l');
M_.endo_names_tex = char(M_.endo_names_tex, '{l}');
M_.endo_names_long = char(M_.endo_names_long, 'l');
M_.endo_names = char(M_.endo_names, 'z');
M_.endo_names_tex = char(M_.endo_names_tex, '{z}');
M_.endo_names_long = char(M_.endo_names_long, 'z');
M_.endo_names = char(M_.endo_names, 'v');
M_.endo_names_tex = char(M_.endo_names_tex, '{v}');
M_.endo_names_long = char(M_.endo_names_long, 'v');
M_.endo_partitions = struct();
M_.param_names = 'alpha';
M_.param_names_tex = '{\alpha}';
M_.param_names_long = 'alpha';
M_.param_names = char(M_.param_names, 'beta');
M_.param_names_tex = char(M_.param_names_tex, '{\beta}');
M_.param_names_long = char(M_.param_names_long, 'beta');
M_.param_names = char(M_.param_names, 'ew');
M_.param_names_tex = char(M_.param_names_tex, '{\epsilon^w}');
M_.param_names_long = char(M_.param_names_long, 'ew');
M_.param_names = char(M_.param_names, 'ep');
M_.param_names_tex = char(M_.param_names_tex, '{\epsilon^p}');
M_.param_names_long = char(M_.param_names_long, 'ep');
M_.param_names = char(M_.param_names, 'kappaw');
M_.param_names_tex = char(M_.param_names_tex, '{\kappa^w}');
M_.param_names_long = char(M_.param_names_long, 'kappaw');
M_.param_names = char(M_.param_names, 'kappap');
M_.param_names_tex = char(M_.param_names_tex, '{\kappa^p}');
M_.param_names_long = char(M_.param_names_long, 'kappap');
M_.param_names = char(M_.param_names, 'lambdaw');
M_.param_names_tex = char(M_.param_names_tex, '{\lambda^w}');
M_.param_names_long = char(M_.param_names_long, 'lambdaw');
M_.param_names = char(M_.param_names, 'lambdap');
M_.param_names_tex = char(M_.param_names_tex, '{\lambda^p}');
M_.param_names_long = char(M_.param_names_long, 'lambdap');
M_.param_names = char(M_.param_names, 'mup');
M_.param_names_tex = char(M_.param_names_tex, '{\mu^p}');
M_.param_names_long = char(M_.param_names_long, 'mup');
M_.param_names = char(M_.param_names, 'muw');
M_.param_names_tex = char(M_.param_names_tex, '{\mu^w}');
M_.param_names_long = char(M_.param_names_long, 'muw');
M_.param_names = char(M_.param_names, 'phi');
M_.param_names_tex = char(M_.param_names_tex, '{\phi}');
M_.param_names_long = char(M_.param_names_long, 'phi');
M_.param_names = char(M_.param_names, 'phi_pip');
M_.param_names_tex = char(M_.param_names_tex, '{\Phi_{\pi^p}}');
M_.param_names_long = char(M_.param_names_long, 'phi_pip');
M_.param_names = char(M_.param_names, 'phi_piw');
M_.param_names_tex = char(M_.param_names_tex, '{\Phi_{\pi^w}}');
M_.param_names_long = char(M_.param_names_long, 'phi_piw');
M_.param_names = char(M_.param_names, 'phi_y');
M_.param_names_tex = char(M_.param_names_tex, '{\Phi_{y}}');
M_.param_names_long = char(M_.param_names_long, 'phi_y');
M_.param_names = char(M_.param_names, 'psi_y');
M_.param_names_tex = char(M_.param_names_tex, '{\psi_{y}}');
M_.param_names_long = char(M_.param_names_long, 'psi_y');
M_.param_names = char(M_.param_names, 'psi_ya');
M_.param_names_tex = char(M_.param_names_tex, '{\psi_{ya}}');
M_.param_names_long = char(M_.param_names_long, 'psi_ya');
M_.param_names = char(M_.param_names, 'rho');
M_.param_names_tex = char(M_.param_names_tex, '{\rho}');
M_.param_names_long = char(M_.param_names_long, 'rho');
M_.param_names = char(M_.param_names, 'rho_v');
M_.param_names_tex = char(M_.param_names_tex, '{\rho_v}');
M_.param_names_long = char(M_.param_names_long, 'rho_v');
M_.param_names = char(M_.param_names, 'rho_a');
M_.param_names_tex = char(M_.param_names_tex, '{\rho_a}');
M_.param_names_long = char(M_.param_names_long, 'rho_a');
M_.param_names = char(M_.param_names, 'rho_z');
M_.param_names_tex = char(M_.param_names_tex, '{\rho_z}');
M_.param_names_long = char(M_.param_names_long, 'rho_z');
M_.param_names = char(M_.param_names, 'sigma');
M_.param_names_tex = char(M_.param_names_tex, '{\sigma}');
M_.param_names_long = char(M_.param_names_long, 'sigma');
M_.param_names = char(M_.param_names, 'thetap');
M_.param_names_tex = char(M_.param_names_tex, '{\theta^p}');
M_.param_names_long = char(M_.param_names_long, 'thetap');
M_.param_names = char(M_.param_names, 'thetaw');
M_.param_names_tex = char(M_.param_names_tex, '{\theta^w}');
M_.param_names_long = char(M_.param_names_long, 'thetaw');
M_.param_names = char(M_.param_names, 'un');
M_.param_names_tex = char(M_.param_names_tex, '{\u_n}');
M_.param_names_long = char(M_.param_names_long, 'un');
M_.param_partitions = struct();
M_.exo_det_nbr = 0;
M_.exo_nbr = 3;
M_.endo_nbr = 16;
M_.param_nbr = 24;
M_.orig_endo_nbr = 16;
M_.aux_vars = [];
M_.Sigma_e = zeros(3, 3);
M_.Correlation_matrix = eye(3, 3);
M_.H = 0;
M_.Correlation_matrix_ME = 1;
M_.sigma_e_is_diagonal = 1;
M_.det_shocks = [];
options_.block=0;
options_.bytecode=0;
options_.use_dll=0;
M_.hessian_eq_zero = 1;
erase_compiled_function('wr_static');
erase_compiled_function('wr_dynamic');
M_.orig_eq_nbr = 16;
M_.eq_nbr = 16;
M_.ramsey_eq_nbr = 0;
M_.set_auxiliary_variables = exist(['./' M_.fname '_set_auxiliary_variables.m'], 'file') == 2;
M_.lead_lag_incidence = [
 0 5 21;
 0 6 0;
 0 7 0;
 1 8 0;
 0 9 0;
 0 10 0;
 0 11 0;
 2 12 0;
 0 13 22;
 0 14 23;
 0 15 0;
 0 16 0;
 0 17 0;
 0 18 0;
 3 19 0;
 4 20 0;]';
M_.nstatic = 9;
M_.nfwrd   = 3;
M_.npred   = 4;
M_.nboth   = 0;
M_.nsfwrd   = 3;
M_.nspred   = 4;
M_.ndynamic   = 7;
M_.equations_tags = {
};
M_.static_and_dynamic_models_differ = 0;
M_.exo_names_orig_ord = [1:3];
M_.maximum_lag = 1;
M_.maximum_lead = 1;
M_.maximum_endo_lag = 1;
M_.maximum_endo_lead = 1;
oo_.steady_state = zeros(16, 1);
M_.maximum_exo_lag = 0;
M_.maximum_exo_lead = 0;
oo_.exo_steady_state = zeros(3, 1);
M_.params = NaN(24, 1);
M_.NNZDerivatives = [55; -1; -1];
M_.params( 1 ) = 0.25;
alpha = M_.params( 1 );
M_.params( 2 ) = 0.99;
beta = M_.params( 2 );
M_.params( 3 ) = 4.5;
ew = M_.params( 3 );
M_.params( 4 ) = 9;
ep = M_.params( 4 );
M_.params( 11 ) = 5;
phi = M_.params( 11 );
M_.params( 21 ) = 1;
sigma = M_.params( 21 );
M_.params( 22 ) = 0.75;
thetap = M_.params( 22 );
M_.params( 23 ) = 0.75;
thetaw = M_.params( 23 );
M_.params( 12 ) = 1.5;
phi_pip = M_.params( 12 );
M_.params( 13 ) = 0;
phi_piw = M_.params( 13 );
M_.params( 14 ) = 0.125;
phi_y = M_.params( 14 );
M_.params( 17 ) = 1;
rho = M_.params( 17 );
M_.params( 18 ) = 0.5;
rho_v = M_.params( 18 );
M_.params( 19 ) = 0.9;
rho_a = M_.params( 19 );
M_.params( 20 ) = 0.5;
rho_z = M_.params( 20 );
M_.params( 8 ) = (1-M_.params(22))/M_.params(22)*(1-M_.params(22)*M_.params(2))*(1-M_.params(1))/(1-M_.params(1)+M_.params(1)*M_.params(4));
lambdap = M_.params( 8 );
M_.params( 7 ) = (1-M_.params(23))/M_.params(23)*(1-M_.params(2)*M_.params(23))/(1+M_.params(3)*M_.params(11));
lambdaw = M_.params( 7 );
M_.params( 6 ) = M_.params(1)/(1-M_.params(1))*M_.params(8);
kappap = M_.params( 6 );
M_.params( 5 ) = (M_.params(21)+M_.params(11)/(1-M_.params(1)))*M_.params(7);
kappaw = M_.params( 5 );
M_.params( 9 ) = log(M_.params(4)/(M_.params(4)-1));
mup = M_.params( 9 );
M_.params( 10 ) = log(M_.params(3)/(M_.params(3)-1));
muw = M_.params( 10 );
M_.params( 15 ) = (-(1-M_.params(1)))*(M_.params(9)+M_.params(10)-log(1-M_.params(1)))/(M_.params(11)+M_.params(1)+(1-M_.params(1))*M_.params(21));
psi_y = M_.params( 15 );
M_.params( 16 ) = (1+M_.params(11))/(M_.params(11)+M_.params(1)+(1-M_.params(1))*M_.params(21));
psi_ya = M_.params( 16 );
M_.params( 24 ) = M_.params(10)/M_.params(11);
un = M_.params( 24 );
%
% INITVAL instructions
%
options_.initval_file = 0;
oo_.steady_state( 1 ) = 0;
oo_.steady_state( 2 ) = M_.params(15);
oo_.steady_state( 3 ) = M_.params(15);
oo_.steady_state( 4 ) = log(1-M_.params(1))+M_.params(15)*(-M_.params(1))/(1-M_.params(1))-M_.params(9);
oo_.steady_state( 5 ) = log(1-M_.params(1))+M_.params(15)*(-M_.params(1))/(1-M_.params(1))-M_.params(9);
oo_.steady_state( 6 ) = 0;
oo_.steady_state( 7 ) = M_.params(15)/(1-M_.params(1));
oo_.steady_state( 8 ) = 0;
oo_.steady_state( 13 ) = M_.params(24);
oo_.steady_state( 16 ) = 0;
oo_.steady_state( 9 ) = 0;
oo_.steady_state( 10 ) = 0;
oo_.steady_state( 11 ) = M_.params(17);
oo_.steady_state( 12 ) = M_.params(17);
if M_.exo_nbr > 0
	oo_.exo_simul = ones(M_.maximum_lag,1)*oo_.exo_steady_state';
end
if M_.exo_det_nbr > 0
	oo_.exo_det_simul = ones(M_.maximum_lag,1)*oo_.exo_det_steady_state';
end
steady;
oo_.dr.eigval = check(M_,options_,oo_);
%
% SHOCKS instructions
%
M_.exo_det_length = 0;
M_.Sigma_e(3, 3) = (0.25)^2;
options_.irf = 16;
options_.order = 1;
var_list_ = char('u','n','l','w');
info = stoch_simul(var_list_);
save('wr_results.mat', 'oo_', 'M_', 'options_');
if exist('estim_params_', 'var') == 1
  save('wr_results.mat', 'estim_params_', '-append');
end
if exist('bayestopt_', 'var') == 1
  save('wr_results.mat', 'bayestopt_', '-append');
end
if exist('dataset_', 'var') == 1
  save('wr_results.mat', 'dataset_', '-append');
end
if exist('estimation_info', 'var') == 1
  save('wr_results.mat', 'estimation_info', '-append');
end
if exist('dataset_info', 'var') == 1
  save('wr_results.mat', 'dataset_info', '-append');
end
if exist('oo_recursive_', 'var') == 1
  save('wr_results.mat', 'oo_recursive_', '-append');
end


disp(['Total computing time : ' dynsec2hms(toc(tic0)) ]);
if ~isempty(lastwarn)
  disp('Note: warning(s) encountered in MATLAB/Octave code')
end
diary off
