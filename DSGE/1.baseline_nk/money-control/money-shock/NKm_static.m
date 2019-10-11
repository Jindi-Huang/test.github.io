function [residual, g1, g2, g3] = NKm_static(y, x, params)
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

lhs =y(2);
rhs =y(2)*params(3)+params(14)*y(1);
residual(1)= lhs-rhs;
lhs =y(1);
rhs =y(1)-1/params(4)*(y(9)-y(2)-y(11));
residual(2)= lhs-rhs;
lhs =y(16);
rhs =y(16)*params(17)+x(4);
residual(3)= lhs-rhs;
residual(4) = y(16);
lhs =y(11);
rhs =params(1)-params(4)*params(15)*(1-params(11))*y(14)+(1-params(12))*y(15);
residual(5)= lhs-rhs;
lhs =y(4);
rhs =params(15)*y(14)+params(16);
residual(6)= lhs-rhs;
lhs =y(3);
rhs =y(1)+y(4);
residual(7)= lhs-rhs;
lhs =y(5);
rhs =(y(3)-y(14))/(1-params(2));
residual(8)= lhs-rhs;
lhs =y(8);
rhs =y(2)+y(8);
residual(9)= lhs-rhs;
lhs =y(6);
rhs =y(8)+y(5)*params(6)+params(4)*y(3);
residual(10)= lhs-rhs;
lhs =y(7);
rhs =y(6)-y(8);
residual(11)= lhs-rhs;
lhs =y(10);
rhs =y(9)-y(2);
residual(12)= lhs-rhs;
lhs =y(13);
rhs =y(13)*params(10)+x(2);
residual(13)= lhs-rhs;
lhs =y(14);
rhs =params(11)*y(14)+x(1);
residual(14)= lhs-rhs;
lhs =y(15);
rhs =params(12)*y(15)-x(3);
residual(15)= lhs-rhs;
lhs =y(12);
rhs =y(3)+y(8)-y(9)*params(13);
residual(16)= lhs-rhs;
if ~isreal(residual)
  residual = real(residual)+imag(residual).^2;
end
if nargout >= 2,
  g1 = zeros(16, 16);

  %
  % Jacobian matrix
  %

  g1(1,1)=(-params(14));
  g1(1,2)=1-params(3);
  g1(2,2)=(-(1/params(4)));
  g1(2,9)=1/params(4);
  g1(2,11)=(-(1/params(4)));
  g1(3,16)=1-params(17);
  g1(4,16)=1;
  g1(5,11)=1;
  g1(5,14)=params(4)*params(15)*(1-params(11));
  g1(5,15)=(-(1-params(12)));
  g1(6,4)=1;
  g1(6,14)=(-params(15));
  g1(7,1)=(-1);
  g1(7,3)=1;
  g1(7,4)=(-1);
  g1(8,3)=(-(1/(1-params(2))));
  g1(8,5)=1;
  g1(8,14)=(-((-1)/(1-params(2))));
  g1(9,2)=(-1);
  g1(10,3)=(-params(4));
  g1(10,5)=(-params(6));
  g1(10,6)=1;
  g1(10,8)=(-1);
  g1(11,6)=(-1);
  g1(11,7)=1;
  g1(11,8)=1;
  g1(12,2)=1;
  g1(12,9)=(-1);
  g1(12,10)=1;
  g1(13,13)=1-params(10);
  g1(14,14)=1-params(11);
  g1(15,15)=1-params(12);
  g1(16,3)=(-1);
  g1(16,8)=(-1);
  g1(16,9)=params(13);
  g1(16,12)=1;
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
