function [residual, g1, g2, g3] = wr_static(y, x, params)
%
% Status : Computes static model for Dynare
%
% Inputs : 
%   y         [M_.endo_nbr by 1] double    vector of endogenous variables in declaration order
%   x         [M_.exo_nbr by 1] double     vector of exogenous variables in declaration order
%   params    [M_.param_nbr by 1] double   vector of parameter values in declaration order
%
% Outputs:
%   residual  [M_.endo_nbr by 1] double    vector of residuals of the static model equations 
%                                          in order of declaration of the equations.
%                                          Dynare may prepend or append auxiliary equations, see M_.aux_vars
%   g1        [M_.endo_nbr by M_.endo_nbr] double    Jacobian matrix of the static model equations;
%                                                       columns: variables in declaration order
%                                                       rows: equations in order of declaration
%   g2        [M_.endo_nbr by (M_.endo_nbr)^2] double   Hessian matrix of the static model equations;
%                                                       columns: variables in declaration order
%                                                       rows: equations in order of declaration
%   g3        [M_.endo_nbr by (M_.endo_nbr)^3] double   Third derivatives matrix of the static model equations;
%                                                       columns: variables in declaration order
%                                                       rows: equations in order of declaration
%
%
% Warning : this file is generated automatically by Dynare
%           from model file (.mod)

residual = zeros( 16, 1);

%
% Model equations
%

lhs =y(1);
rhs =y(1)-1/params(21)*(y(11)-y(9)-y(12));
residual(1)= lhs-rhs;
lhs =y(11);
rhs =params(17)+y(9)*params(12)+params(13)*y(10)+y(1)*params(14)+params(14)*params(16)*y(8)+y(16);
residual(2)= lhs-rhs;
lhs =y(9);
rhs =y(9)*params(2)+y(1)*params(6)+params(8)*y(6);
residual(3)= lhs-rhs;
lhs =y(10);
rhs =y(10)*params(2)-params(7)*params(11)*(y(13)-params(24));
residual(4)= lhs-rhs;
lhs =y(12);
rhs =params(17)-y(8)*params(21)*params(16)*(1-params(19))+(1-params(20))*y(15);
residual(5)= lhs-rhs;
lhs =y(5);
rhs =params(21)*y(2)+params(11)*(y(2)-y(8))/(1-params(1))+params(10);
residual(6)= lhs-rhs;
lhs =y(5);
rhs =y(2)-(y(2)-y(8))/(1-params(1))-params(9)+log(1-params(1));
residual(7)= lhs-rhs;
lhs =y(6);
rhs =y(4)-y(5);
residual(8)= lhs-rhs;
lhs =y(13);
rhs =1/params(11)*(y(6)-y(1)*(params(21)+params(11)/(1-params(1))));
residual(9)= lhs-rhs;
lhs =y(4);
rhs =params(21)*y(3)+params(11)*y(14);
residual(10)= lhs-rhs;
lhs =y(3);
rhs =y(8)+(1-params(1))*y(7);
residual(11)= lhs-rhs;
lhs =y(4);
rhs =y(10)+y(4)-y(9);
residual(12)= lhs-rhs;
lhs =y(3);
rhs =y(1)+y(2);
residual(13)= lhs-rhs;
lhs =y(16);
rhs =y(16)*params(18)+x(3);
residual(14)= lhs-rhs;
lhs =y(8);
rhs =y(8)*params(19)+x(1);
residual(15)= lhs-rhs;
lhs =y(15);
rhs =params(20)*y(15)+x(2);
residual(16)= lhs-rhs;
if ~isreal(residual)
  residual = real(residual)+imag(residual).^2;
end
if nargout >= 2,
  g1 = zeros(16, 16);

  %
  % Jacobian matrix
  %

  g1(1,9)=(-(1/params(21)));
  g1(1,11)=1/params(21);
  g1(1,12)=(-(1/params(21)));
  g1(2,1)=(-params(14));
  g1(2,8)=(-(params(14)*params(16)));
  g1(2,9)=(-params(12));
  g1(2,10)=(-params(13));
  g1(2,11)=1;
  g1(2,16)=(-1);
  g1(3,1)=(-params(6));
  g1(3,6)=(-params(8));
  g1(3,9)=1-params(2);
  g1(4,10)=1-params(2);
  g1(4,13)=params(7)*params(11);
  g1(5,8)=params(21)*params(16)*(1-params(19));
  g1(5,12)=1;
  g1(5,15)=(-(1-params(20)));
  g1(6,2)=(-(params(21)+params(11)/(1-params(1))));
  g1(6,5)=1;
  g1(6,8)=(-((-params(11))/(1-params(1))));
  g1(7,2)=(-(1-1/(1-params(1))));
  g1(7,5)=1;
  g1(7,8)=(-1)/(1-params(1));
  g1(8,4)=(-1);
  g1(8,5)=1;
  g1(8,6)=1;
  g1(9,1)=(-(1/params(11)*(-(params(21)+params(11)/(1-params(1))))));
  g1(9,6)=(-(1/params(11)));
  g1(9,13)=1;
  g1(10,3)=(-params(21));
  g1(10,4)=1;
  g1(10,14)=(-params(11));
  g1(11,3)=1;
  g1(11,7)=(-(1-params(1)));
  g1(11,8)=(-1);
  g1(12,9)=1;
  g1(12,10)=(-1);
  g1(13,1)=(-1);
  g1(13,2)=(-1);
  g1(13,3)=1;
  g1(14,16)=1-params(18);
  g1(15,8)=1-params(19);
  g1(16,15)=1-params(20);
  if ~isreal(g1)
    g1 = real(g1)+2*imag(g1);
  end
if nargout >= 3,
  %
  % Hessian matrix
  %

  g2 = sparse([],[],[],16,256);
if nargout >= 4,
  %
  % Third order derivatives
  %

  g3 = sparse([],[],[],16,4096);
end
end
end
end
