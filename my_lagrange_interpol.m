% Function which, given n+1 point in R^2, evaluates the interpolating
% polynomial of degree n. It is calculated using the Lagrange interpolation
% theorem. We assume that the vectors are all columns.

function y_eval = my_lagrange_interpol(x, y, x_eval)

m = length(x);
L = zeros(m, 1);

omega_n = 1;
for i = 1:m
    omega_n = omega_n * (x_eval - x(i));
end
% alternatively, omega_n = prod(x_eval - x);

for k = 1:m
    den = 1; % denominator of L (without (x_eval-x(k)))
    for i = 1:m
        den = den * (x(k) - x(i));
    end

    L(k) = omega_n / (den  * (x_eval - x(k)));
end

y_eval = y' * L;
