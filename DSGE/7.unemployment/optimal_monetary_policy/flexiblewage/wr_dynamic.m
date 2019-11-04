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

residual = zeros(15, 1);
residual(1) = (params(21)+(params(10)+params(1))/(1-params(1)))*y(8)+params(6)*y(20)+params(5)*y(21);
residual(2) = params(4)/params(8)*y(16)-y(20)+y(6)+y(22);
residual(3) = (1-params(1))*params(3)/params(7)*y(17)-y(21)+y(7)-y(22);
lhs =y(16);
rhs =params(2)*y(23)+y(8)*params(6)+params(8)*y(13);
residual(4)= lhs-rhs;
lhs =y(17);
rhs =params(2)*y(24)+y(8)*params(5)-params(7)*y(13);
residual(5)= lhs-rhs;
lhs =y(13);
rhs =y(17)+y(2)-y(16)-y(12)+y(1);
residual(6)= lhs-rhs;
residual(7) = y(22)+y(20)*params(8)-y(21)*params(7)-params(2)*y(25);
lhs =y(12);
rhs =log(1-params(1))-params(1)/(1-params(1))*params(14)+params(16)*y(15)-params(9);
residual(8)= lhs-rhs;
lhs =y(9);
rhs =params(14)+y(15)*params(15);
residual(9)= lhs-rhs;
lhs =y(19);
rhs =params(18)*y(5)+x(it_, 3);
residual(10)= lhs-rhs;
lhs =y(15);
rhs =params(19)*y(3)+x(it_, 1);
residual(11)= lhs-rhs;
lhs =y(18);
rhs =params(20)*y(4)+x(it_, 2);
residual(12)= lhs-rhs;
lhs =y(11);
rhs =y(13)+y(12);
residual(13)= lhs-rhs;
lhs =y(10);
rhs =y(8)+y(9);
residual(14)= lhs-rhs;
lhs =y(14);
rhs =(y(10)-y(15))/(1-params(1));
residual(15)= lhs-rhs;
if nargout >= 2,
  g1 = zeros(15, 28);

  %
  % Jacobian matrix
  %

  g1(1,8)=params(21)+(params(10)+params(1))/(1-params(1));
  g1(1,20)=params(6);
  g1(1,21)=params(5);
  g1(2,16)=params(4)/params(8);
  g1(2,6)=1;
  g1(2,20)=(-1);
  g1(2,22)=1;
  g1(3,17)=(1-params(1))*params(3)/params(7);
  g1(3,7)=1;
  g1(3,21)=(-1);
  g1(3,22)=(-1);
  g1(4,8)=(-params(6));
  g1(4,13)=(-params(8));
  g1(4,16)=1;
  g1(4,23)=(-params(2));
  g1(5,8)=(-params(5));
  g1(5,13)=params(7);
  g1(5,17)=1;
  g1(5,24)=(-params(2));
  g1(6,1)=(-1);
  g1(6,12)=1;
  g1(6,2)=(-1);
  g1(6,13)=1;
  g1(6,16)=1;
  g1(6,17)=(-1);
  g1(7,20)=params(8);
  g1(7,21)=(-params(7));
  g1(7,22)=1;
  g1(7,25)=(-params(2));
  g1(8,12)=1;
  g1(8,15)=(-params(16));
  g1(9,9)=1;
  g1(9,15)=(-params(15));
  g1(10,5)=(-params(18));
  g1(10,19)=1;
  g1(10,28)=(-1);
  g1(11,3)=(-params(19));
  g1(11,15)=1;
  g1(11,26)=(-1);
  g1(12,4)=(-params(20));
  g1(12,18)=1;
  g1(12,27)=(-1);
  g1(13,11)=1;
  g1(13,12)=(-1);
  g1(13,13)=(-1);
  g1(14,8)=(-1);
  g1(14,9)=(-1);
  g1(14,10)=1;
  g1(15,10)=(-(1/(1-params(1))));
  g1(15,14)=1;
  g1(15,15)=(-((-1)/(1-params(1))));

if nargout >= 3,
  %
  % Hessian matrix
  %

  g2 = sparse([],[],[],15,784);
if nargout >= 4,
  %
  % Third order derivatives
  %

  g3 = sparse([],[],[],15,21952);
end
end
end
end
