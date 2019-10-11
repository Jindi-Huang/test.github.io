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
M_.fname = 'NKm';
M_.dynare_version = '4.5.7';
oo_.dynare_version = '4.5.7';
options_.dynare_version = '4.5.7';
%
% Some global variables initialization
%
global_initialization;
diary off;
diary('NKm.log');
M_.exo_names = 'e_a';
M_.exo_names_tex = 'e\_a';
M_.exo_names_long = 'e_a';
M_.exo_names = char(M_.exo_names, 'e_v');
M_.exo_names_tex = char(M_.exo_names_tex, 'e\_v');
M_.exo_names_long = char(M_.exo_names_long, 'e_v');
M_.exo_names = char(M_.exo_names, 'e_z');
M_.exo_names_tex = char(M_.exo_names_tex, 'e\_z');
M_.exo_names_long = char(M_.exo_names_long, 'e_z');
M_.exo_names = char(M_.exo_names, 'e_m');
M_.exo_names_tex = char(M_.exo_names_tex, 'e\_m');
M_.exo_names_long = char(M_.exo_names_long, 'e_m');
M_.endo_names = 'yt';
M_.endo_names_tex = 'yt';
M_.endo_names_long = 'yt';
M_.endo_names = char(M_.endo_names, 'Pi');
M_.endo_names_tex = char(M_.endo_names_tex, 'Pi');
M_.endo_names_long = char(M_.endo_names_long, 'Pi');
M_.endo_names = char(M_.endo_names, 'y');
M_.endo_names_tex = char(M_.endo_names_tex, 'y');
M_.endo_names_long = char(M_.endo_names_long, 'y');
M_.endo_names = char(M_.endo_names, 'yn');
M_.endo_names_tex = char(M_.endo_names_tex, 'yn');
M_.endo_names_long = char(M_.endo_names_long, 'yn');
M_.endo_names = char(M_.endo_names, 'n');
M_.endo_names_tex = char(M_.endo_names_tex, 'n');
M_.endo_names_long = char(M_.endo_names_long, 'n');
M_.endo_names = char(M_.endo_names, 'w');
M_.endo_names_tex = char(M_.endo_names_tex, 'w');
M_.endo_names_long = char(M_.endo_names_long, 'w');
M_.endo_names = char(M_.endo_names, 'wn');
M_.endo_names_tex = char(M_.endo_names_tex, 'wn');
M_.endo_names_long = char(M_.endo_names_long, 'wn');
M_.endo_names = char(M_.endo_names, 'P');
M_.endo_names_tex = char(M_.endo_names_tex, 'P');
M_.endo_names_long = char(M_.endo_names_long, 'P');
M_.endo_names = char(M_.endo_names, 'I');
M_.endo_names_tex = char(M_.endo_names_tex, 'I');
M_.endo_names_long = char(M_.endo_names_long, 'I');
M_.endo_names = char(M_.endo_names, 'r');
M_.endo_names_tex = char(M_.endo_names_tex, 'r');
M_.endo_names_long = char(M_.endo_names_long, 'r');
M_.endo_names = char(M_.endo_names, 'rn');
M_.endo_names_tex = char(M_.endo_names_tex, 'rn');
M_.endo_names_long = char(M_.endo_names_long, 'rn');
M_.endo_names = char(M_.endo_names, 'm');
M_.endo_names_tex = char(M_.endo_names_tex, 'm');
M_.endo_names_long = char(M_.endo_names_long, 'm');
M_.endo_names = char(M_.endo_names, 'v');
M_.endo_names_tex = char(M_.endo_names_tex, 'v');
M_.endo_names_long = char(M_.endo_names_long, 'v');
M_.endo_names = char(M_.endo_names, 'a');
M_.endo_names_tex = char(M_.endo_names_tex, 'a');
M_.endo_names_long = char(M_.endo_names_long, 'a');
M_.endo_names = char(M_.endo_names, 'z');
M_.endo_names_tex = char(M_.endo_names_tex, 'z');
M_.endo_names_long = char(M_.endo_names_long, 'z');
M_.endo_names = char(M_.endo_names, 'dm');
M_.endo_names_tex = char(M_.endo_names_tex, 'dm');
M_.endo_names_long = char(M_.endo_names_long, 'dm');
M_.endo_partitions = struct();
M_.param_names = 'rho';
M_.param_names_tex = 'rho';
M_.param_names_long = 'rho';
M_.param_names = char(M_.param_names, 'alpha');
M_.param_names_tex = char(M_.param_names_tex, 'alpha');
M_.param_names_long = char(M_.param_names_long, 'alpha');
M_.param_names = char(M_.param_names, 'beta');
M_.param_names_tex = char(M_.param_names_tex, 'beta');
M_.param_names_long = char(M_.param_names_long, 'beta');
M_.param_names = char(M_.param_names, 'sigma');
M_.param_names_tex = char(M_.param_names_tex, 'sigma');
M_.param_names_long = char(M_.param_names_long, 'sigma');
M_.param_names = char(M_.param_names, 'theta');
M_.param_names_tex = char(M_.param_names_tex, 'theta');
M_.param_names_long = char(M_.param_names_long, 'theta');
M_.param_names = char(M_.param_names, 'phi');
M_.param_names_tex = char(M_.param_names_tex, 'phi');
M_.param_names_long = char(M_.param_names_long, 'phi');
M_.param_names = char(M_.param_names, 'e');
M_.param_names_tex = char(M_.param_names_tex, 'e');
M_.param_names_long = char(M_.param_names_long, 'e');
M_.param_names = char(M_.param_names, 'phi_pi');
M_.param_names_tex = char(M_.param_names_tex, 'phi\_pi');
M_.param_names_long = char(M_.param_names_long, 'phi_pi');
M_.param_names = char(M_.param_names, 'phi_y');
M_.param_names_tex = char(M_.param_names_tex, 'phi\_y');
M_.param_names_long = char(M_.param_names_long, 'phi_y');
M_.param_names = char(M_.param_names, 'rho_v');
M_.param_names_tex = char(M_.param_names_tex, 'rho\_v');
M_.param_names_long = char(M_.param_names_long, 'rho_v');
M_.param_names = char(M_.param_names, 'rho_a');
M_.param_names_tex = char(M_.param_names_tex, 'rho\_a');
M_.param_names_long = char(M_.param_names_long, 'rho_a');
M_.param_names = char(M_.param_names, 'rho_z');
M_.param_names_tex = char(M_.param_names_tex, 'rho\_z');
M_.param_names_long = char(M_.param_names_long, 'rho_z');
M_.param_names = char(M_.param_names, 'eta');
M_.param_names_tex = char(M_.param_names_tex, 'eta');
M_.param_names_long = char(M_.param_names_long, 'eta');
M_.param_names = char(M_.param_names, 'k');
M_.param_names_tex = char(M_.param_names_tex, 'k');
M_.param_names_long = char(M_.param_names_long, 'k');
M_.param_names = char(M_.param_names, 'psi_ya');
M_.param_names_tex = char(M_.param_names_tex, 'psi\_ya');
M_.param_names_long = char(M_.param_names_long, 'psi_ya');
M_.param_names = char(M_.param_names, 'psi_y');
M_.param_names_tex = char(M_.param_names_tex, 'psi\_y');
M_.param_names_long = char(M_.param_names_long, 'psi_y');
M_.param_names = char(M_.param_names, 'rho_m');
M_.param_names_tex = char(M_.param_names_tex, 'rho\_m');
M_.param_names_long = char(M_.param_names_long, 'rho_m');
M_.param_partitions = struct();
M_.exo_det_nbr = 0;
M_.exo_nbr = 4;
M_.endo_nbr = 16;
M_.param_nbr = 17;
M_.orig_endo_nbr = 16;
M_.aux_vars = [];
M_.Sigma_e = zeros(4, 4);
M_.Correlation_matrix = eye(4, 4);
M_.H = 0;
M_.Correlation_matrix_ME = 1;
M_.sigma_e_is_diagonal = 1;
M_.det_shocks = [];
options_.block=0;
options_.bytecode=0;
options_.use_dll=0;
M_.hessian_eq_zero = 1;
erase_compiled_function('NKm_static');
erase_compiled_function('NKm_dynamic');
M_.orig_eq_nbr = 16;
M_.eq_nbr = 16;
M_.ramsey_eq_nbr = 0;
M_.set_auxiliary_variables = exist(['./' M_.fname '_set_auxiliary_variables.m'], 'file') == 2;
M_.lead_lag_incidence = [
 0 7 23;
 0 8 24;
 0 9 0;
 0 10 0;
 0 11 0;
 0 12 0;
 0 13 0;
 1 14 0;
 0 15 0;
 0 16 0;
 0 17 0;
 2 18 0;
 3 19 0;
 4 20 0;
 5 21 0;
 6 22 0;]';
M_.nstatic = 8;
M_.nfwrd   = 2;
M_.npred   = 6;
M_.nboth   = 0;
M_.nsfwrd   = 2;
M_.nspred   = 6;
M_.ndynamic   = 8;
M_.equations_tags = {
};
M_.static_and_dynamic_models_differ = 0;
M_.exo_names_orig_ord = [1:4];
M_.maximum_lag = 1;
M_.maximum_lead = 1;
M_.maximum_endo_lag = 1;
M_.maximum_endo_lead = 1;
oo_.steady_state = zeros(16, 1);
M_.maximum_exo_lag = 0;
M_.maximum_exo_lead = 0;
oo_.exo_steady_state = zeros(4, 1);
M_.params = NaN(17, 1);
M_.NNZDerivatives = [51; -1; -1];
M_.params( 1 ) = 1;
rho = M_.params( 1 );
M_.params( 2 ) = 0.25;
alpha = M_.params( 2 );
M_.params( 3 ) = 0.99;
beta = M_.params( 3 );
M_.params( 4 ) = 1;
sigma = M_.params( 4 );
M_.params( 5 ) = 0.75;
theta = M_.params( 5 );
M_.params( 6 ) = 5;
phi = M_.params( 6 );
M_.params( 7 ) = 9;
e = M_.params( 7 );
M_.params( 8 ) = 1.5;
phi_pi = M_.params( 8 );
M_.params( 9 ) = 0.125;
phi_y = M_.params( 9 );
M_.params( 15 ) = (1+M_.params(6))/(M_.params(6)+M_.params(2)+(1-M_.params(2))*M_.params(4));
psi_ya = M_.params( 15 );
M_.params( 16 ) = (1-M_.params(2))*log(1-M_.params(2))/(M_.params(2)+M_.params(6)+(1-M_.params(2))*M_.params(4));
psi_y = M_.params( 16 );
M_.params( 10 ) = 0.5;
rho_v = M_.params( 10 );
M_.params( 11 ) = 0.9;
rho_a = M_.params( 11 );
M_.params( 12 ) = 0.5;
rho_z = M_.params( 12 );
M_.params( 17 ) = 0.5;
rho_m = M_.params( 17 );
M_.params( 13 ) = 4;
eta = M_.params( 13 );
M_.params( 14 ) = (1-M_.params(2))*(M_.params(4)+(M_.params(6)+M_.params(2))/(1-M_.params(2)))*(1-M_.params(5))/M_.params(5)*(1-M_.params(5)*M_.params(3))/(1-M_.params(2)+M_.params(2)*M_.params(7));
k = M_.params( 14 );
%
% INITVAL instructions
%
options_.initval_file = 0;
oo_.steady_state( 2 ) = 0.0;
oo_.steady_state( 3 ) = M_.params(16);
oo_.steady_state( 1 ) = 0.0;
oo_.steady_state( 4 ) = M_.params(16);
oo_.steady_state( 5 ) = (M_.params(16)-oo_.steady_state(14))/(1-M_.params(2));
oo_.steady_state( 9 ) = M_.params(1);
oo_.steady_state( 6 ) = M_.params(4)*M_.params(16);
oo_.steady_state( 7 ) = M_.params(4)*M_.params(16);
oo_.steady_state( 8 ) = 0.0;
oo_.steady_state( 10 ) = M_.params(1);
oo_.steady_state( 11 ) = M_.params(1);
oo_.steady_state( 12 ) = M_.params(16)-M_.params(1)*M_.params(13);
oo_.steady_state( 13 ) = 0.0;
oo_.steady_state( 14 ) = 0.0;
oo_.steady_state( 15 ) = 0.0;
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
M_.Sigma_e(1, 1) = (0)^2;
M_.Sigma_e(2, 2) = (0)^2;
M_.Sigma_e(3, 3) = (0)^2;
M_.Sigma_e(4, 4) = (0.25)^2;
options_.irf = 16;
options_.order = 1;
options_.periods = 0;
var_list_ = char('yt','Pi','y','n','wn','P','I','r','m','dm');
info = stoch_simul(var_list_);
save('NKm_results.mat', 'oo_', 'M_', 'options_');
if exist('estim_params_', 'var') == 1
  save('NKm_results.mat', 'estim_params_', '-append');
end
if exist('bayestopt_', 'var') == 1
  save('NKm_results.mat', 'bayestopt_', '-append');
end
if exist('dataset_', 'var') == 1
  save('NKm_results.mat', 'dataset_', '-append');
end
if exist('estimation_info', 'var') == 1
  save('NKm_results.mat', 'estimation_info', '-append');
end
if exist('dataset_info', 'var') == 1
  save('NKm_results.mat', 'dataset_info', '-append');
end
if exist('oo_recursive_', 'var') == 1
  save('NKm_results.mat', 'oo_recursive_', '-append');
end


disp(['Total computing time : ' dynsec2hms(toc(tic0)) ]);
if ~isempty(lastwarn)
  disp('Note: warning(s) encountered in MATLAB/Octave code')
end
diary off
