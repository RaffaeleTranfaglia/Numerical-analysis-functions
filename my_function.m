% This file contains the non-linear function used in bisection method and
% other algorithms that require a function.
% Enter the function whose root is needed.

function y = my_function(x)
y = 2*x + 3/4;
%y = -x.^2 + 3*x -2;
%y = 2.5*x + 0.7;  
%y = sin(x) - (x/2).^2;  % in [1,2]
%y = exp(-x+1) - 0.012;  % in [0,10]
%y = 9*x.^2 .* sin(6*x) ./ (3*x + 4);   % in [-1,1]
%y = 1./(1 + 25*x.^2);   % in [-1,1]
%y = 2.5*x + 0.7;
