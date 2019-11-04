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

residual = zeros( 15, 1);

%
% Model equations
%

residual(1) = (params(21)+(params(10)+params(1))/(1-params(1)))*y(1)+params(6)*y(13)+params(5)*y(14);
residual(2) = y(13)+params(4)/params(8)*y(9)-y(13)+y(15);
residual(3) = y(14)+(1-params(1))*params(3)/params(7)*y(10)-y(14)-y(15);
lhs =y(9);
rhs =y(9)*params(2)+y(1)*params(6)+params(8)*y(6);
residual(4)= lhs-rhs;
lhs =y(10);
rhs =y(10)*params(2)+y(1)*params(5)-params(7)*y(6);
residual(5)= lhs-rhs;
lhs =y(6);
rhs =y(5)+y(10)+y(6)-y(9)-y(5);
residual(6)= lhs-rhs;
residual(7) = y(15)+y(13)*params(8)-y(14)*params(7)-y(15)*params(2);
lhs =y(5);
rhs =log(1-params(1))-params(1)/(1-params(1))*params(14)+params(16)*y(8)-params(9);
residual(8)= lhs-rhs;
lhs =y(2);
rhs =params(14)+y(8)*params(15);
residual(9)= lhs-rhs;
lhs =y(12);
rhs =y(12)*params(18)+x(3);
residual(10)= lhs-rhs;
lhs =y(8);
rhs =y(8)*params(19)+x(1);
residual(11)= lhs-rhs;
lhs =y(11);
rhs =y(11)*params(20)+x(2);
residual(12)= lhs-rhs;
lhs =y(4);
rhs =y(6)+y(5);
residual(13)= lhs-rhs;
lhs =y(3);
rhs =y(1)+y(2);
residual(14)= lhs-rhs;
lhs =y(7);
rhs =(y(3)-y(8))/(1-params(1));
residual(15)= lhs-rhs;
if ~isreal(residual)
  residual = real(residual)+imag(residual).^2;
end
if nargout >= 2,
  g1 = zeros(15, 15);

  %
  % Jacobian matrix
  %

  g1(1,1)=params(21)+(params(10)+params(1))/(1-params(1));
  g1(1,13)=params(6);
  g1(1,14)=params(5);
  g1(2,9)=params(4)/params(8);
  g1(2,15)=1;
  g1(3,10)=(1-params(1))*params(3)/params(7);
  g1(3,15)=(-1);
  g1(4,1)=(-params(6));
  g1(4,6)=(-params(8));
  g1(4,9)=1-params(2);
  g1(5,1)=(-params(5));
  g1(5,6)=params(7);
  g1(5,10)=1-params(2);
  g1(6,9)=1;
  g1(6,10)=(-1);
  g1(7,13)=params(8);
  g1(7,14)=(-params(7));
  g1(7,15)=1-params(2);
  g1(8,5)=1;
  g1(8,8)=(-params(16));
  g1(9,2)=1;
  g1(9,8)=(-params(15));
  g1(10,12)=1-params(18);
  g1(11,8)=1-params(19);
  g1(12,11)=1-params(20);
  g1(13,4)=1;
  g1(13,5)=(-1);
  g1(13,6)=(-1);
  g1(14,1)=(-1);
  g1(14,2)=(-1);
  g1(14,3)=1;
  g1(15,3)=(-(1/(1-params(1))));
  g1(15,7)=1;
  g1(15,8)=(-((-1)/(1-params(1))));
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
