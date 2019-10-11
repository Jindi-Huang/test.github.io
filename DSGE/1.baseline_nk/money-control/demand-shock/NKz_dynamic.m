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

residual = zeros(16, 1);
lhs =y(8);
rhs =params(3)*y(24)+params(14)*y(7);
residual(1)= lhs-rhs;
lhs =y(7);
rhs =y(23)-1/params(4)*(y(15)-y(24)-y(17));
residual(2)= lhs-rhs;
lhs =y(18)-y(2);
rhs =x(it_, 4)+params(17)*(y(2)-y(6));
residual(3)= lhs-rhs;
lhs =y(17);
rhs =params(1)-params(4)*params(15)*(1-params(11))*y(20)+(1-params(12))*y(21);
residual(4)= lhs-rhs;
lhs =y(10);
rhs =params(15)*y(20)+params(16);
residual(5)= lhs-rhs;
lhs =y(9);
rhs =y(7)+y(10);
residual(6)= lhs-rhs;
lhs =y(11);
rhs =(y(9)-y(20))/(1-params(2));
residual(7)= lhs-rhs;
lhs =y(14);
rhs =y(8)+y(1);
residual(8)= lhs-rhs;
lhs =y(12);
rhs =y(14)+y(11)*params(6)+params(4)*y(9);
residual(9)= lhs-rhs;
lhs =y(13);
rhs =y(12)-y(14);
residual(10)= lhs-rhs;
lhs =y(16);
rhs =y(15)-y(24);
residual(11)= lhs-rhs;
lhs =y(19);
rhs =params(10)*y(3)+x(it_, 2);
residual(12)= lhs-rhs;
lhs =y(20);
rhs =params(11)*y(4)+x(it_, 1);
residual(13)= lhs-rhs;
lhs =y(21);
rhs =params(12)*y(5)-x(it_, 3);
residual(14)= lhs-rhs;
lhs =y(18);
rhs =y(9)+y(14)-y(15)*params(13);
residual(15)= lhs-rhs;
lhs =y(22);
rhs =y(2);
residual(16)= lhs-rhs;
if nargout >= 2,
  g1 = zeros(16, 28);

  %
  % Jacobian matrix
  %

  g1(1,7)=(-params(14));
  g1(1,8)=1;
  g1(1,24)=(-params(3));
  g1(2,7)=1;
  g1(2,23)=(-1);
  g1(2,24)=(-(1/params(4)));
  g1(2,15)=1/params(4);
  g1(2,17)=(-(1/params(4)));
  g1(3,2)=(-1)-params(17);
  g1(3,18)=1;
  g1(3,28)=(-1);
  g1(3,6)=params(17);
  g1(4,17)=1;
  g1(4,20)=params(4)*params(15)*(1-params(11));
  g1(4,21)=(-(1-params(12)));
  g1(5,10)=1;
  g1(5,20)=(-params(15));
  g1(6,7)=(-1);
  g1(6,9)=1;
  g1(6,10)=(-1);
  g1(7,9)=(-(1/(1-params(2))));
  g1(7,11)=1;
  g1(7,20)=(-((-1)/(1-params(2))));
  g1(8,8)=(-1);
  g1(8,1)=(-1);
  g1(8,14)=1;
  g1(9,9)=(-params(4));
  g1(9,11)=(-params(6));
  g1(9,12)=1;
  g1(9,14)=(-1);
  g1(10,12)=(-1);
  g1(10,13)=1;
  g1(10,14)=1;
  g1(11,24)=1;
  g1(11,15)=(-1);
  g1(11,16)=1;
  g1(12,3)=(-params(10));
  g1(12,19)=1;
  g1(12,26)=(-1);
  g1(13,4)=(-params(11));
  g1(13,20)=1;
  g1(13,25)=(-1);
  g1(14,5)=(-params(12));
  g1(14,21)=1;
  g1(14,27)=1;
  g1(15,9)=(-1);
  g1(15,14)=(-1);
  g1(15,15)=params(13);
  g1(15,18)=1;
  g1(16,2)=(-1);
  g1(16,22)=1;

if nargout >= 3,
  %
  % Hessian matrix
  %

  g2 = sparse([],[],[],16,784);
if nargout >= 4,
  %
  % Third order derivatives
  %

  g3 = sparse([],[],[],16,21952);
end
end
end
end
