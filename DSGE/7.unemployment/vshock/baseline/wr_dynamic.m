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

residual = zeros(16, 1);
lhs =y(5);
rhs =y(21)-1/params(21)*(y(15)-y(22)-y(16));
residual(1)= lhs-rhs;
lhs =y(15);
rhs =params(17)+params(12)*y(13)+params(13)*y(14)+y(5)*params(14)+params(14)*params(16)*y(12)+y(20);
residual(2)= lhs-rhs;
lhs =y(13);
rhs =y(22)*params(2)+y(5)*params(6)+params(8)*y(10);
residual(3)= lhs-rhs;
lhs =y(14);
rhs =params(2)*y(23)-params(7)*params(11)*(y(17)-params(24));
residual(4)= lhs-rhs;
lhs =y(16);
rhs =params(17)-y(12)*params(21)*params(16)*(1-params(19))+(1-params(20))*y(19);
residual(5)= lhs-rhs;
lhs =y(9);
rhs =params(21)*y(6)+params(11)*(y(6)-y(12))/(1-params(1))+params(10);
residual(6)= lhs-rhs;
lhs =y(9);
rhs =y(6)-(y(6)-y(12))/(1-params(1))-params(9)+log(1-params(1));
residual(7)= lhs-rhs;
lhs =y(10);
rhs =y(8)-y(9);
residual(8)= lhs-rhs;
lhs =y(17);
rhs =1/params(11)*(y(10)-y(5)*(params(21)+params(11)/(1-params(1))));
residual(9)= lhs-rhs;
lhs =y(8);
rhs =params(21)*y(7)+params(11)*y(18);
residual(10)= lhs-rhs;
lhs =y(7);
rhs =y(12)+(1-params(1))*y(11);
residual(11)= lhs-rhs;
lhs =y(8);
rhs =y(14)+y(1)-y(13);
residual(12)= lhs-rhs;
lhs =y(7);
rhs =y(5)+y(6);
residual(13)= lhs-rhs;
lhs =y(20);
rhs =params(18)*y(4)+x(it_, 3);
residual(14)= lhs-rhs;
lhs =y(12);
rhs =params(19)*y(2)+x(it_, 1);
residual(15)= lhs-rhs;
lhs =y(19);
rhs =params(20)*y(3)+x(it_, 2);
residual(16)= lhs-rhs;
if nargout >= 2,
  g1 = zeros(16, 26);

  %
  % Jacobian matrix
  %

  g1(1,5)=1;
  g1(1,21)=(-1);
  g1(1,22)=(-(1/params(21)));
  g1(1,15)=1/params(21);
  g1(1,16)=(-(1/params(21)));
  g1(2,5)=(-params(14));
  g1(2,12)=(-(params(14)*params(16)));
  g1(2,13)=(-params(12));
  g1(2,14)=(-params(13));
  g1(2,15)=1;
  g1(2,20)=(-1);
  g1(3,5)=(-params(6));
  g1(3,10)=(-params(8));
  g1(3,13)=1;
  g1(3,22)=(-params(2));
  g1(4,14)=1;
  g1(4,23)=(-params(2));
  g1(4,17)=params(7)*params(11);
  g1(5,12)=params(21)*params(16)*(1-params(19));
  g1(5,16)=1;
  g1(5,19)=(-(1-params(20)));
  g1(6,6)=(-(params(21)+params(11)/(1-params(1))));
  g1(6,9)=1;
  g1(6,12)=(-((-params(11))/(1-params(1))));
  g1(7,6)=(-(1-1/(1-params(1))));
  g1(7,9)=1;
  g1(7,12)=(-1)/(1-params(1));
  g1(8,8)=(-1);
  g1(8,9)=1;
  g1(8,10)=1;
  g1(9,5)=(-(1/params(11)*(-(params(21)+params(11)/(1-params(1))))));
  g1(9,10)=(-(1/params(11)));
  g1(9,17)=1;
  g1(10,7)=(-params(21));
  g1(10,8)=1;
  g1(10,18)=(-params(11));
  g1(11,7)=1;
  g1(11,11)=(-(1-params(1)));
  g1(11,12)=(-1);
  g1(12,1)=(-1);
  g1(12,8)=1;
  g1(12,13)=1;
  g1(12,14)=(-1);
  g1(13,5)=(-1);
  g1(13,6)=(-1);
  g1(13,7)=1;
  g1(14,4)=(-params(18));
  g1(14,20)=1;
  g1(14,26)=(-1);
  g1(15,2)=(-params(19));
  g1(15,12)=1;
  g1(15,24)=(-1);
  g1(16,3)=(-params(20));
  g1(16,19)=1;
  g1(16,25)=(-1);

if nargout >= 3,
  %
  % Hessian matrix
  %

  g2 = sparse([],[],[],16,676);
if nargout >= 4,
  %
  % Third order derivatives
  %

  g3 = sparse([],[],[],16,17576);
end
end
end
end