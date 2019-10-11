function [residual, g1, g2, g3] = NKz_dynamic(y, x, params, steady_state, it_)
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

residual = zeros(15, 1);
lhs =y(6);
rhs =params(3)*y(21)+params(14)*y(5);
residual(1)= lhs-rhs;
lhs =y(5);
rhs =y(20)-1/params(4)*(y(13)-y(21)-y(15));
residual(2)= lhs-rhs;
lhs =y(13);
rhs =params(1)+y(6)*params(8)+params(9)*y(7)-params(9)*params(16)+y(17);
residual(3)= lhs-rhs;
lhs =y(15);
rhs =params(1)-params(4)*params(15)*(1-params(11))*y(18)+(1-params(12))*y(19);
residual(4)= lhs-rhs;
lhs =y(8);
rhs =params(16)+params(15)*y(18);
residual(5)= lhs-rhs;
lhs =y(7);
rhs =y(5)+y(8);
residual(6)= lhs-rhs;
lhs =y(9);
rhs =(y(7)-y(18))/(1-params(2));
residual(7)= lhs-rhs;
lhs =y(12);
rhs =y(6)+y(1);
residual(8)= lhs-rhs;
lhs =y(10);
rhs =y(12)+y(9)*params(6)+params(4)*y(7);
residual(9)= lhs-rhs;
lhs =y(11);
rhs =y(10)-y(12);
residual(10)= lhs-rhs;
lhs =y(14);
rhs =y(13)-y(21);
residual(11)= lhs-rhs;
lhs =y(17);
rhs =params(10)*y(2)+x(it_, 2);
residual(12)= lhs-rhs;
lhs =y(18);
rhs =params(11)*y(3)+x(it_, 1);
residual(13)= lhs-rhs;
lhs =y(19);
rhs =params(12)*y(4)-x(it_, 3);
residual(14)= lhs-rhs;
lhs =y(16);
rhs =y(7)+y(12)-y(13)*params(13);
residual(15)= lhs-rhs;
if nargout >= 2,
  g1 = zeros(15, 24);

  %
  % Jacobian matrix
  %

  g1(1,5)=(-params(14));
  g1(1,6)=1;
  g1(1,21)=(-params(3));
  g1(2,5)=1;
  g1(2,20)=(-1);
  g1(2,21)=(-(1/params(4)));
  g1(2,13)=1/params(4);
  g1(2,15)=(-(1/params(4)));
  g1(3,6)=(-params(8));
  g1(3,7)=(-params(9));
  g1(3,13)=1;
  g1(3,17)=(-1);
  g1(4,15)=1;
  g1(4,18)=params(4)*params(15)*(1-params(11));
  g1(4,19)=(-(1-params(12)));
  g1(5,8)=1;
  g1(5,18)=(-params(15));
  g1(6,5)=(-1);
  g1(6,7)=1;
  g1(6,8)=(-1);
  g1(7,7)=(-(1/(1-params(2))));
  g1(7,9)=1;
  g1(7,18)=(-((-1)/(1-params(2))));
  g1(8,6)=(-1);
  g1(8,1)=(-1);
  g1(8,12)=1;
  g1(9,7)=(-params(4));
  g1(9,9)=(-params(6));
  g1(9,10)=1;
  g1(9,12)=(-1);
  g1(10,10)=(-1);
  g1(10,11)=1;
  g1(10,12)=1;
  g1(11,21)=1;
  g1(11,13)=(-1);
  g1(11,14)=1;
  g1(12,2)=(-params(10));
  g1(12,17)=1;
  g1(12,23)=(-1);
  g1(13,3)=(-params(11));
  g1(13,18)=1;
  g1(13,22)=(-1);
  g1(14,4)=(-params(12));
  g1(14,19)=1;
  g1(14,24)=1;
  g1(15,7)=(-1);
  g1(15,12)=(-1);
  g1(15,13)=params(13);
  g1(15,16)=1;

if nargout >= 3,
  %
  % Hessian matrix
  %

  g2 = sparse([],[],[],15,576);
if nargout >= 4,
  %
  % Third order derivatives
  %

  g3 = sparse([],[],[],15,13824);
end
end
end
end
