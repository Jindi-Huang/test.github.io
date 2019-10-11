function [residual, g1, g2, g3] = NKa_static(y, x, params)
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

residual = zeros( 15, 1);

%
% Model equations
%

lhs =y(2);
rhs =y(2)*params(3)+params(14)*y(1);
residual(1)= lhs-rhs;
lhs =y(1);
rhs =y(1)-1/params(4)*(y(9)-y(2)-y(11));
residual(2)= lhs-rhs;
lhs =y(9);
rhs =params(1)+y(2)*params(8)+params(9)*y(3)-params(9)*params(16)+y(13);
residual(3)= lhs-rhs;
lhs =y(11);
rhs =params(1)-params(4)*params(15)*(1-params(11))*y(14)+(1-params(12))*y(15);
residual(4)= lhs-rhs;
lhs =y(4);
rhs =params(16)+params(15)*y(14);
residual(5)= lhs-rhs;
lhs =y(3);
rhs =y(1)+y(4);
residual(6)= lhs-rhs;
lhs =y(5);
rhs =(y(3)-y(14))/(1-params(2));
residual(7)= lhs-rhs;
lhs =y(8);
rhs =y(2)+y(8);
residual(8)= lhs-rhs;
lhs =y(6);
rhs =y(8)+y(5)*params(6)+params(4)*y(3);
residual(9)= lhs-rhs;
lhs =y(7);
rhs =y(6)-y(8);
residual(10)= lhs-rhs;
lhs =y(10);
rhs =y(9)-y(2);
residual(11)= lhs-rhs;
lhs =y(13);
rhs =y(13)*params(10)+x(2);
residual(12)= lhs-rhs;
lhs =y(14);
rhs =params(11)*y(14)+x(1);
residual(13)= lhs-rhs;
lhs =y(15);
rhs =params(12)*y(15)-x(3);
residual(14)= lhs-rhs;
lhs =y(12);
rhs =y(3)+y(8)-y(9)*params(13);
residual(15)= lhs-rhs;
if ~isreal(residual)
  residual = real(residual)+imag(residual).^2;
end
if nargout >= 2,
  g1 = zeros(15, 15);

  %
  % Jacobian matrix
  %

  g1(1,1)=(-params(14));
  g1(1,2)=1-params(3);
  g1(2,2)=(-(1/params(4)));
  g1(2,9)=1/params(4);
  g1(2,11)=(-(1/params(4)));
  g1(3,2)=(-params(8));
  g1(3,3)=(-params(9));
  g1(3,9)=1;
  g1(3,13)=(-1);
  g1(4,11)=1;
  g1(4,14)=params(4)*params(15)*(1-params(11));
  g1(4,15)=(-(1-params(12)));
  g1(5,4)=1;
  g1(5,14)=(-params(15));
  g1(6,1)=(-1);
  g1(6,3)=1;
  g1(6,4)=(-1);
  g1(7,3)=(-(1/(1-params(2))));
  g1(7,5)=1;
  g1(7,14)=(-((-1)/(1-params(2))));
  g1(8,2)=(-1);
  g1(9,3)=(-params(4));
  g1(9,5)=(-params(6));
  g1(9,6)=1;
  g1(9,8)=(-1);
  g1(10,6)=(-1);
  g1(10,7)=1;
  g1(10,8)=1;
  g1(11,2)=1;
  g1(11,9)=(-1);
  g1(11,10)=1;
  g1(12,13)=1-params(10);
  g1(13,14)=1-params(11);
  g1(14,15)=1-params(12);
  g1(15,3)=(-1);
  g1(15,8)=(-1);
  g1(15,9)=params(13);
  g1(15,12)=1;
  if ~isreal(g1)
    g1 = real(g1)+2*imag(g1);
  end
if nargout >= 3,
  %
  % Hessian matrix
  %

  g2 = sparse([],[],[],15,225);
if nargout >= 4,
  %
  % Third order derivatives
  %

  g3 = sparse([],[],[],15,3375);
end
end
end
end
