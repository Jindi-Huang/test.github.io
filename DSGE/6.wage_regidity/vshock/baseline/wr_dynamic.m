function [residual, g1, g2, g3] = wr_dynamic(y, x, params, steady_state, it_)
%
% Status : Computes dynamic model for Dynare
%
% Inputs :
%   y         [#dynamic variables by 1] double    vector of endogenous variables in the order stored
%                                                 in M_.lead_lag_incidence; see the Manual
%   x         [nperiods by M_.exo_nbr] double     matrix of exogenous variables (in declaration order)
%                                                 for all simulation periods
%   steady_state  [M_.endo_nbr by 1] double       vector of steady state values
%   params    [M_.param_nbr by 1] double          vector of parameter values in declaration order
%   it_       scalar double                       time period for exogenous variables for which to evaluate the model
%
% Outputs:
%   residual  [M_.endo_nbr by 1] double    vector of residuals of the dynamic model equations in order of 
%                                          declaration of the equations.
%                                          Dynare may prepend auxiliary equations, see M_.aux_vars
%   g1        [M_.endo_nbr by #dynamic variables] double    Jacobian matrix of the dynamic model equations;
%                                                           rows: equations in order of declaration
%                                                           columns: variables in order stored in M_.lead_lag_incidence followed by the ones in M_.exo_names
%   g2        [M_.endo_nbr by (#dynamic variables)^2] double   Hessian matrix of the dynamic model equations;
%                                                              rows: equations in order of declaration
%                                                              columns: variables in order stored in M_.lead_lag_incidence followed by the ones in M_.exo_names
%   g3        [M_.endo_nbr by (#dynamic variables)^3] double   Third order derivative matrix of the dynamic model equations;
%                                                              rows: equations in order of declaration
%                                                              columns: variables in order stored in M_.lead_lag_incidence followed by the ones in M_.exo_names
%
%
% Warning : this file is generated automatically by Dynare
%           from model file (.mod)

%
% Model equations
%

residual = zeros(14, 1);
lhs =y(6);
rhs =y(20)-1/params(21)*(y(16)-y(21)-y(17));
residual(1)= lhs-rhs;
lhs =y(16);
rhs =params(17)+params(11)*y(14)+params(12)*y(15)+y(6)*params(13)+params(13)*params(15)*y(13)+y(19);
residual(2)= lhs-rhs;
lhs =y(14);
rhs =y(21)*params(2)+y(6)*params(6)+params(8)*y(11);
residual(3)= lhs-rhs;
lhs =y(15);
rhs =params(2)*y(22)+y(6)*params(5)-y(11)*params(7);
residual(4)= lhs-rhs;
lhs =y(11);
rhs =y(15)+y(2)-y(14)-y(10)+y(1);
residual(5)= lhs-rhs;
lhs =y(17);
rhs =params(17)-y(13)*params(21)*params(15)*(1-params(19))+(1-params(20))*y(18);
residual(6)= lhs-rhs;
lhs =y(10);
rhs =log(1-params(1))-params(1)/(1-params(1))*params(14)+y(13)*params(16)-params(9);
residual(7)= lhs-rhs;
lhs =y(7);
rhs =params(14)+params(15)*y(13);
residual(8)= lhs-rhs;
lhs =y(19);
rhs =params(18)*y(5)+x(it_, 3);
residual(9)= lhs-rhs;
lhs =y(13);
rhs =params(19)*y(3)+x(it_, 1);
residual(10)= lhs-rhs;
lhs =y(18);
rhs =params(20)*y(4)+x(it_, 2);
residual(11)= lhs-rhs;
lhs =y(9);
rhs =y(11)+y(10);
residual(12)= lhs-rhs;
lhs =y(8);
rhs =y(6)+y(7);
residual(13)= lhs-rhs;
lhs =y(12);
rhs =(y(8)-y(13))/(1-params(1));
residual(14)= lhs-rhs;
if nargout >= 2,
  g1 = zeros(14, 25);

  %
  % Jacobian matrix
  %

  g1(1,6)=1;
  g1(1,20)=(-1);
  g1(1,21)=(-(1/params(21)));
  g1(1,16)=1/params(21);
  g1(1,17)=(-(1/params(21)));
  g1(2,6)=(-params(13));
  g1(2,13)=(-(params(13)*params(15)));
  g1(2,14)=(-params(11));
  g1(2,15)=(-params(12));
  g1(2,16)=1;
  g1(2,19)=(-1);
  g1(3,6)=(-params(6));
  g1(3,11)=(-params(8));
  g1(3,14)=1;
  g1(3,21)=(-params(2));
  g1(4,6)=(-params(5));
  g1(4,11)=params(7);
  g1(4,15)=1;
  g1(4,22)=(-params(2));
  g1(5,1)=(-1);
  g1(5,10)=1;
  g1(5,2)=(-1);
  g1(5,11)=1;
  g1(5,14)=1;
  g1(5,15)=(-1);
  g1(6,13)=params(21)*params(15)*(1-params(19));
  g1(6,17)=1;
  g1(6,18)=(-(1-params(20)));
  g1(7,10)=1;
  g1(7,13)=(-params(16));
  g1(8,7)=1;
  g1(8,13)=(-params(15));
  g1(9,5)=(-params(18));
  g1(9,19)=1;
  g1(9,25)=(-1);
  g1(10,3)=(-params(19));
  g1(10,13)=1;
  g1(10,23)=(-1);
  g1(11,4)=(-params(20));
  g1(11,18)=1;
  g1(11,24)=(-1);
  g1(12,9)=1;
  g1(12,10)=(-1);
  g1(12,11)=(-1);
  g1(13,6)=(-1);
  g1(13,7)=(-1);
  g1(13,8)=1;
  g1(14,8)=(-(1/(1-params(1))));
  g1(14,12)=1;
  g1(14,13)=(-((-1)/(1-params(1))));

if nargout >= 3,
  %
  % Hessian matrix
  %

  g2 = sparse([],[],[],14,625);
if nargout >= 4,
  %
  % Third order derivatives
  %

  g3 = sparse([],[],[],14,15625);
end
end
end
end
